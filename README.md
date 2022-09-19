# Welcome

Main repository for the USupportMe API services

## Installation

This is the entry bundle repository for all USupportMe web services (webapps + API services).

To clone and populate all submodules use:

`git clone --recurse-submodules git@github.com:UNICEFECAR/USupport-entry-bundle.git entry-bundle`

Get the localhost env variables and copy them into your folders in a `.env.local` file.
In the root directory, run `docker-compose -f docker-compose-local.yml -up -d --build` to run all the docker containers configured for a local environment

Notes:

1. Note that once built you can stop the services using `docker-compose -f docker-compose-local.yml down`
2. To add a new dependency, still run `npm install {dependency}`. To upgrade, use either `npm update {dependency}` or `npm install ${dependendency}@{version}` and commit the changed `package-lock.json`. If an upgrade fails, revert to the last known working `package-lock.json`
3. After running `npm audit fix` remember to commit any changes to `package-lock.json` to the repo

## Committing changes in submodules

```
cd your_submodule
git commit -a -m "commit message"
git push
cd ..
git add your_submodule
git commit -m "Updated submodule"
```
