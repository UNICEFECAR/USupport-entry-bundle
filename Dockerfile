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
# Stage 3 - build admin webapp
###

# set working directory
WORKDIR /adminApp

# install app dependencies
COPY ./admin-ui/package.json ./
COPY ./admin-ui/package-lock.json ./
RUN npm install

# Copy source files
COPY ./admin-ui/ .

# Building app
RUN npm run build --prod

# remove dev dependencies
RUN npm prune --production

# ###
# # Stage 4 - build cms webapp
# ###

# # set working directory
# WORKDIR /cmsApp

# # install app dependencies
# COPY ./cms/package.json         ./
# COPY ./cms/package-lock.json    ./
# RUN npm install

# # Copy source files
# COPY ./cms/ .

# # Building app
# RUN npm run build 

# # remove dev dependencies
# RUN npm prune --production

###
# Stage 4 - nginx server
###
FROM ${NGINX_VERSION}

# copy web app builds to nginx/html
COPY --from=webAppBuilds        /clientApp/dist    /usr/share/nginx/html/client
COPY --from=webAppBuilds        /providerApp/dist  /usr/share/nginx/html/provider
COPY --from=webAppBuilds        /adminApp/dist     /usr/share/nginx/html/admin