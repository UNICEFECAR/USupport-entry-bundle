# Make sure all submodules are on staging branch branch
git submodule foreach git checkout staging

# Pull all backend submodules from development branch
echo "Pulling each backend from development branch"
cd admin && git pull origin development && cd ..
cd client && git pull origin development && cd ..
cd user && git pull origin development && cd ..
cd messaging && git pull origin development && cd ..
cd notifications && git pull origin development && cd ..
cd payments && git pull origin development && cd ..
cd provider && git pull origin development && cd ..
cd video && git pull origin development && cd ..
cd email && git pull origin development && cd ..
cd gateway && git pull origin development && cd ..

# Stop all backend services
echo "Stopping all backend services"
docker-compose stop admin
docker-compose stop client
docker-compose stop user
docker-compose stop messaging
docker-compose stop notifications
docker-compose stop payments
docker-compose stop provider
docker-compose stop video
docker-compose stop email
docker-compose stop gateway

# Remove all backend services
echo "Removing all backend services"
docker-compose rm -f admin
docker-compose rm -f client
docker-compose rm -f user
docker-compose rm -f messaging
docker-compose rm -f notifications
docker-compose rm -f payments
docker-compose rm -f provider
docker-compose rm -f video
docker-compose rm -f email
docker-compose rm -f gateway

# Build and start all backend services
echo "Building and starting all backend services"
docker-compose -f docker-compose-staging.yml up -d --build admin
docker-compose -f docker-compose-staging.yml up -d --build client
docker-compose -f docker-compose-staging.yml up -d --build user
docker-compose -f docker-compose-staging.yml up -d --build messaging
docker-compose -f docker-compose-staging.yml up -d --build notifications
docker-compose -f docker-compose-staging.yml up -d --build payments
docker-compose -f docker-compose-staging.yml up -d --build provider
docker-compose -f docker-compose-staging.yml up -d --build video
docker-compose -f docker-compose-staging.yml up -d --build email
docker-compose -f docker-compose-staging.yml up -d --build gateway
