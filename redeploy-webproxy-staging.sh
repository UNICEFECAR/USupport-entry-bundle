echo "Stopping the webproxy container"
docker-compose stop webproxy

echo "Prune the webproxy container"
docker container prune

echo "Prune all the dangling images"
docker image prune

echo "Build the webproxy container"
docker-compose -f docker-compose-staging.yml up -d --build webproxy