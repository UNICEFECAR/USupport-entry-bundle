REDEPLOY=$1

if [ "$REDEPLOY" = 'deploy' ] || [ "$REDEPLOY" = 'redeploy' ]
then
    if [ "$REDEPLOY" = 'deploy' ]
    then
        # Deploy zookeeper
        kubectl apply -f deployment-zookeeper.yaml -f service-zookeeper.yaml

        # Give time to zookeeper to start 
        sleep 5

        # Deploy kafka broker
        kubectl apply -f deployment-kafka.yaml -f service-kafka.yaml
    elif [ "$REDEPLOY" = 'redeploy' ]
    then 
        kubectl apply -f service-zookeeper.yaml -f service-kafka.yaml
        kubectl rollout restart deployment zookeeper
        kubectl rollout restart deployment k-broker
    fi

else
    echo "Please select either to deploy or redeploy k8s pod"
fi
