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
- Features `feature/{JIRA_ID}-{branch_name}`
- Bugs `bug/{JIRA_ID}-{branch_name}`
- Hotfixes `hotfix/{JIRA_ID}-{branch_name}`

## Guidelines for writing a commit message when committing changes to any of the git submodules 

- Create: `[commit message]` (create a new component)
- Add: `[commit message]` (addition to an existing component)
- Fix: `[commit message]` (fix a bug within an existing component)
- Refactor: `[commit message]` (refactor an existing component)

## Kubernetes Clusters

We are using Kubernetes clusters for our staging and production environments to run all API services as well as all client apps. Each API service runs in a single-container pod and has a `service`, `config`, `deployment` and `secrets` yaml files. 

We are using the AWS EKS service to run each cluster. 

Here we explain how to set up your local machine so you are able to run, maintain and spin off new containers in each cluster. 

# Before you start
Make sure you have the following tools installed: 
- AWS CLI - click [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) for instructions. 
- Kubectl - used for communicating with the cluster. You need this to be able to control each pod. Click [here](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html) for instructions
- Amazon ECR Docker Credential Helper - [GitHub Repo](https://github.com/awslabs/amazon-ecr-credential-helper)
- Change `~/.docker/config.json` to be `"credsStore": "ecr-login"`
- Add `secrets.yaml` files for each pod and environment

# How to deploy or redeploy an API pod
The first time you want to deploy a new pod to the cluster you can use the following command from the root folder of the project: 
`./kube-deploy.sh {pod folder name} {staging | prod} deploy`
E.g. `./kube-deploy.sh admin staging deploy` - This will deploy and configure the admin pod with the staging env variables (### NOTE: Make sure you are in the correct context ###)
E.g. `./kube-deploy.sh all staging deploy` - This will deploy and configure all pods with the staging env variables (### NOTE: Make sure you are in the correct context ###)

Each K8s pod is configured to have a Rolling Update which ensures minimal downtime as the old pod stays READY until the new pod is deployed, configured and working. Use this command every time you want to apply a new change in `config.yaml`, `secrets.yaml` or the container build:  
`./kube-deploy.sh {pod folder name} {staging | prod} redeploy`

If you want to stop a pod you have to go to the folder where the pod `deployment.yaml` file is: 
```
cd admin/kube-config/staging
kubectl delete -f deployment.yaml
```

# Shared Cluster Pods 
All shared cluster pods and services are in the `./kube-services` folder in the root folder of the project. There you can find deployment and service yaml files for kafka broker, zookeeper and redis. 

In `./kube-services/db-services` you can find all External Names for the DBs used in the project. Add or change those to update the URL for outside resources the pods need to communicate with. 

# Folder structure explained
Each service has the same kubernetes configuration folder called `kube-config`. In that folder you can find deployment environment independent yaml files (`config.yaml` & `service.yaml`). You can also find folders called `staging` and `prod` which contain the `deployment.yaml` and `secrets.yaml` files for each deployment environment. 

# Useful Commands
- `kubectl get po` - Get all pods in a cluster
- `kubectl get po -n {namespace}` - Get all pods in a specific namespace of a cluster
- `kubectl logs -f {pod name}` - Get the console logs of a specific pod (same as `docker-compose logs -f`)
- `kubectl apply -f {yaml file}` - Use this to apply a yaml configuration to the current cluster
- `kubectl describe pod {pod name}` - Detailed information of a pod status. Use this to identify why a pod failed
- `kubectl get services` - Get all services running on the cluster
- `kubectl get ingress` - Get the cluster ingress service
- `kubectl config use-context {context name}` - Use this to switch between cluster contexts. IMPORTANT: Make sure you are in the correct context before making changes as you can apply changes to the production cluster
- `kubectl config view` - See all contexts. Use this to see what clusters tour local machine is connected to


# Useful resources: 
- [How to Setup a New EKS Cluster](https://logz.io/blog/amazon-eks-cluster/)
- [How to Build and Push Docker Images to AWS ECR](https://www.freecodecamp.org/news/build-and-push-docker-images-to-aws-ecr/)
- [Handling env variables in K8s](https://humanitec.com/blog/handling-environment-variables-with-kubernetes)
- [Accessing Resources From Outside the Cluster VPC - RDS example](https://dev.to/bensooraj/accessing-amazon-rds-from-aws-eks-2pc3)
- [NLB - Using TLS for Your Cluster Ingress](https://aws.amazon.com/blogs/opensource/network-load-balancer-nginx-ingress-controller-eks/)
- [List of Max Pods Supported For Each K8s Node Instance](https://github.com/awslabs/amazon-eks-ami/blob/master/files/eni-max-pods.txt)
- [Base64 Encoder](https://www.base64encode.org)
