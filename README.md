# Welcome

Main repository for the USupport API services

## Installation

This is the entry bundle repository for all USupport web services (webapps + API services).

To clone and populate all submodules use:

```
git clone --recurse-submodules git@github.com:UNICEFECAR/USupport-entry-bundle.git entry-bundle
```

Setup:
1. Run `./setup.sh` script in the root directory of the project. If you get permissions error run `chmod 777 setup.sh`
2. Get the localhost env variables and copy them into your folders in a `.env.local` file.
3. Copy the `.env.local` files for the User PII data and Clinical data databases in `entry-bundle/client/pii-db/` and `entry-bundle/client/clinical-db/`

Deployment: 
- LOCAL: run `./deploy.sh local`
- LOCAL + DB DROP: `./deploy.sh local drop`
- STAGING: `./deploy.sh staging`
- PRODUCTION: `./deploy.sh production`

In the root directory, run `docker-compose -f docker-compose-local.yml -up -d --build` to run all the docker containers configured for a local environment

Notes:

1. Note that once built you can stop the services using `docker-compose -f docker-compose-local.yml down`. If running on staging or production use the relevant docker-compose file to stop the containers. 
2. To add a new dependency, still run `npm install {dependency}`. To upgrade, use either `npm update {dependency}` or `npm install ${dependendency}@{version}` and commit the changed `package-lock.json`. If an upgrade fails, revert to the last known working `package-lock.json`
3. After running `npm audit fix` remember to commit any changes to `package-lock.json` to the repo

## Committing changes in submodules

```
cd your_submodule
git commit -a -m "{commit message}"
git push
cd ..
git add your_submodule
git commit -m "Updated submodule"
```

## Please follow these naming conventions for your branches
- Features `feature/{JIRA_ID}-{branch_name}
- Bugs `bug/{JIRA_ID}-{branch_name}
- Hotfixes `hotfix/{JIRA_ID}-{branch_name}

## Guidelines for writing a commit message when committing changes to any of the git submodules 

- Create: `[commit message]` (create a new component)
- Add: `[commit message]` (addition to an existing component)
- Fix: `[commit message]` (fix a bug within an existing component)
- Refactor: `[commit message]` (refactor an existing component)