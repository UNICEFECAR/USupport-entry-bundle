REDEPLOY=$1

if [ "$REDEPLOY" = 'deploy' ] || [ "$REDEPLOY" = 'redeploy' ]
then
    cd ..
    # Build docker image of the service locally
    docker build -t webproxy:latest -f DockerfileStaging .

    docker tag webproxy:latest 482053628475.dkr.ecr.eu-central-1.amazonaws.com/usupport-webproxy

    # Push image to ECR
    docker push 482053628475.dkr.ecr.eu-central-1.amazonaws.com/usupport-webproxy
    cd webproxy

    if [ "$REDEPLOY" = 'deploy' ]
    then
        # Update Kuberenetes Cluster applications for this API service
        kubectl apply -f deployment.yaml -f service.yaml
    elif [ "$REDEPLOY" = 'redeploy' ]
    then 
        kubectl apply -f service.yaml
        kubectl rollout restart deployment webproxy
    fi

else
    echo "Please select either to deploy or redeploy k8s pod"
fi
