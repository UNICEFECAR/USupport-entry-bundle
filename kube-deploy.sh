POD=$1 # Specify if deployment is for all pods or a specific one 
ENV=$2 # Deployment environment
REDEPLOY=$3 # Select if pods should be deployed (use to deploy first time only) or redeployed (when you want to restart and apply changes)
BRANCH_NAME=$4 # Specify branch name to deploy

# Allowed values for $POD: 
# If you want to add more pods add the root folder of that pod in the list below
declare -a KUBE_PODS=("all" "admin" "client" "cms" "email" "gateway" "messaging" "notifications" "payments" "provider" "user" "video" "webproxy")

if [ "$ENV" != 'staging' ] && [ "$ENV" != 'prod' ]
then    
    echo "Please select deployment environment: staging | prod"
    exit
fi

# Check if selected pod exists 
podExists=false
for el in "${KUBE_PODS[@]}"
do
   if [ "$el" == "$POD" ]
   then
    podExists=true
   fi
done

if [ $podExists == false ]
then    
    echo "Selected pod doesn't exist, please select "all" pods or a specific pod you want to deploy"
    exit
fi

if [ "$REDEPLOY" = 'deploy' ] || [ "$REDEPLOY" = 'redeploy' ]
then
    if [ "$BRANCH_NAME" = '' ]
    then
        if [ "$ENV" = 'staging' ]
        then    
            BRANCH_NAME=staging
        elif [ "$ENV" = 'prod' ]
        then 
            BRANCH_NAME=main
        fi
    fi

    if [ "$POD" = 'all' ]
    then 
        # Deploying all pods
        for el in "${KUBE_PODS[@]}"
        do
            if [ "$el" != 'all' ]
            then
                cd $el
                git checkout $BRANCH_NAME # Ensure that we are on the correct branch
                git pull # Pull latest changes
                ./deploy.sh $ENV $REDEPLOY
                cd ..
            fi
        done
    else 
        # Deploying individual pod
        cd $POD
        git checkout $BRANCH_NAME # Ensure that we are on the correct branch
        git pull # Pull latest changes
        ./deploy.sh $ENV $REDEPLOY
        cd ..
    fi

else
    echo "Please select either to deploy or redeploy k8s pod"
fi