# see https://hub.docker.com/_/nginx/
ARG NGINX_VERSION=nginx:1.23.1-alpine
ARG HUB_VERSION=node:16.5.0-alpine3.13

###
# Stage 1 - build client webapp
###

FROM ${HUB_VERSION} as webAppBuilds

ENV PORT 3010

# set working directory
WORKDIR /clientApp

# install app dependencies
COPY ./client-ui/package.json       ./
COPY ./client-ui/package-lock.json  ./
RUN npm install

# Copy source files
COPY ./client-ui/ .

# Building app
RUN npm run build --prod

# remove dev dependencies
RUN npm prune --production

# EXPOSE 3010

###
# Stage 2 - build provider webapp
###

# set working directory
WORKDIR /providerApp

# install app dependencies
COPY ./provider-ui/package.json         ./
COPY ./provider-ui/package-lock.json    ./
RUN npm install

# Copy source files
COPY ./provider-ui/ .

# Building app
RUN npm run build --prod

# remove dev dependencies
RUN npm prune --production

###
# Stage 3 - build country admin webapp
###

# set working directory
WORKDIR /countryAdminApp

# install app dependencies
COPY ./admin-country-ui/package.json ./
COPY ./admin-country-ui/package-lock.json ./
RUN npm install

# Copy source files
COPY ./admin-country-ui/ .

# Building app
RUN npm run build --prod

# remove dev dependencies
RUN npm prune --production

###
# Stage 4 - build global admin webapp
###

# set working directory
WORKDIR /globalAdminApp

# install app dependencies
COPY ./admin-global-ui/package.json ./
COPY ./admin-global-ui/package-lock.json ./
RUN npm install

# Copy source files
COPY ./admin-global-ui/ .

# Building app
RUN npm run build --prod

# remove dev dependencies
RUN npm prune --production

###
# Stage 5 - build website
###

# set working directory
WORKDIR /websiteApp

# install app dependencies
COPY ./website/package.json ./
COPY ./website/package-lock.json ./
RUN npm install

# Copy source files
COPY ./website/ .

# Building app
RUN npm run build --prod

# remove dev dependencies
RUN npm prune --production

###
# Stage 6 - nginx server
###
FROM ${NGINX_VERSION}

# copy web app builds to nginx/html
COPY --from=webAppBuilds        /clientApp/dist    /usr/share/nginx/html/client
COPY --from=webAppBuilds        /providerApp/dist  /usr/share/nginx/html/provider
COPY --from=webAppBuilds        /countryAdminApp/dist     /usr/share/nginx/html/countryAdmin
COPY --from=webAppBuilds        /globalAdminApp/dist     /usr/share/nginx/html/globalAdmin
COPY --from=webAppBuilds        /websiteApp/dist     /usr/share/nginx/html/website
