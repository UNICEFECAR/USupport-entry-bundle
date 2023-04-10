ENV=$1
REDEPLOY=$2

if [ "$ENV" != 'staging' ] && [ "$ENV" != 'prod' ]
then    
    echo "Please select deployment environment: staging | prod"
fi

if [ "$REDEPLOY" = 'deploy' ] || [ "$REDEPLOY" = 'redeploy' ]
then
    IMAGE_TAG=beta
    DOCKERFILE=DockerfileStaging
    if [ "$ENV" = 'staging' ]
    then    
        IMAGE_TAG=beta
        DOCKERFILE=DockerfileStaging
    elif [ "$ENV" = 'prod' ]
    then 
        IMAGE_TAG=latest
        DOCKERFILE=Dockerfile
    fi

    cd ..
    # Build docker image of the service locally
    docker build -t webproxy:$IMAGE_TAG -f $DOCKERFILE .
    docker tag webproxy:$IMAGE_TAG 482053628475.dkr.ecr.eu-central-1.amazonaws.com/usupport-webproxy:$IMAGE_TAG

    # Push image to 
    docker push 482053628475.dkr.ecr.eu-central-1.amazonaws.com/usupport-webproxy:$IMAGE_TAG

    cd webproxy/kube-config/$ENV

    if [ "$REDEPLOY" = 'deploy' ]
    then
        # Update Kuberenetes Cluster applications for this API service
        kubectl apply -f deployment.yaml
    elif [ "$REDEPLOY" = 'redeploy' ]
    then 
        kubectl rollout restart deployment webproxy
    fi

    cd ..
    kubectl apply -f service.yaml

else
    echo "Please select either to deploy or redeploy k8s pod"
fi
