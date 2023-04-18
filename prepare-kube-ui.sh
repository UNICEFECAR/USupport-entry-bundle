ENV=$1 # Deployment environment

declare -a KUBE_PODS=("client-ui" "provider-ui" "website" "admin-global-ui" "admin-country-ui")

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
    
    # pull the components library
    cd USupport-components-library
    git checkout staging
    git pull origin development

    # install the components library
    npm install

    # install the current ui
    cd ..
    npm install

    # build the ui
    npm run staging
  elif [ "$ENV" = 'prod' ]
  then 
    git checkout main
    git pull origin staging

    # pull the components library
    cd USupport-components-library
    git checkout main
    git pull origin staging

    # install the components library
    npm install

    # install the current ui
    cd ..
    npm install

    # build the ui
    npm run build --prod
  fi

  cd ..
done