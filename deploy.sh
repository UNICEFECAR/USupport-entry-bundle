
ENV=$1
DROP=$2

if [ "$ENV" = 'local' ]
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

        docker-compose up -d --build
        ;;
        
        *)
        # this will not happen
        ;;
    esac
    
    printf "\n** Finished deployment for %s\n" "$ENV"
fi