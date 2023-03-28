cd ..

docker build -t webproxy:latest -f DockerfileStaging .

docker tag webproxy:latest 482053628475.dkr.ecr.eu-central-1.amazonaws.com/usupport-webproxy

docker push 482053628475.dkr.ecr.eu-central-1.amazonaws.com/usupport-webproxy

cd webproxy

kubectl apply -f deployment.yaml -f service.yaml