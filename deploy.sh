
ENV=$1
DROP=$2

export COMPOSE_PROJECT_NAME=usupport-services

if [ "$ENV" = 'local' ] || [ "$ENV" = 'staging' ]  || [ "$ENV" = 'production' ] 
then
    printf "Running deployment for %s \n" "$ENV"
    docker-compose stop
    docker system prune -af
    docker volume rm "$(docker volume ls -qf dangling=true)"
  
    case "$ENV" in
        "local") 
        # LOCAL ENV DEPLOYMENT 

        # Delete all local DB data if drop param is added when executing command
        if [ "$DROP" = 'drop' ] 
        then
            -rf ./client/pii-db/data/db/*
            rm -rf ./client/clinical-db/data/db/*
        fi

        docker-compose -f docker-compose-local.yml up -d --build
        ;;
        
        "staging")
        # STAGING ENV DEPLOYMENT 

        git stash       # in case we changed something locally
        git pull origin staging
        git submodule foreach git pull origin staging

        # TODO: ADD LOGIC TO COPY OVER .env.staging FILES
        
        docker-compose -f docker-compose-staging.yml up -d --build
        ;;

        "production")
        # PROD ENV DEPLOYMENT 

        git stash       # in case we changed something locally
        git pull origin main
        git submodule foreach git pull origin main

        # TODO: ADD LOGIC TO COPY OVER .env.production FILES

        docker-compose -f docker-compose-production.yml up -d --build
        ;;

        *)
        # this will not happen
        ;;
    esac
    
    printf "\n** Finished deployment for %s\n" "$ENV"
fi