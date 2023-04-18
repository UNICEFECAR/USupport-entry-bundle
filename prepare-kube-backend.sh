ENV=$1 # Deployment environment

declare -a KUBE_PODS=("admin" "client" "cms" "email" "gateway" "messaging" "notifications" "payments" "payments" "provider" "user" "video" "webproxy")

if [ "$ENV" != 'staging' ] && [ "$ENV" != 'prod' ]
then    
    echo "Please select deployment environment: staging | prod"
    exit
fi

# Prepare all pods
for el in "${KUBE_PODS[@]}"
do
  cd $el
  if [ "$ENV" = 'staging' ]
  then    
    git checkout staging
    git pull origin development
  elif [ "$ENV" = 'prod' ]
  then 
    git checkout main
    git pull origin staging
  fi
  cd ..
done