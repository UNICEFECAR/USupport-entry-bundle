# Setup guide

## Before you start

1. Make sure that Node.js and NPM is installed on your system. [Download Node.js](https://nodejs.org/en/download/)

### Installation

This is the entry bundle repository for all USupport web services (webapps + API services).

To clone and populate all submodules use:

```
git clone --recurse-submodules git@github.com:UNICEFECAR/USupport-entry-bundle.git entry-bundle
```

Setup:

1. Run `./setup.sh` script in the root directory of the project. If you get permissions error run `chmod 777 setup.sh`
2. Create a JWT secret key and add it to the "JWT_KEY" field in the following files: `./admin/service/.env.local` `./user/service/.env.local`
3. To use the payments functionality you need to create a Stripe account. After creating the account, you need to fullfill the following:

   3.1 Stripe keys
      - "STRIPE_SECRET_KEY"
      - "STRIPE_WEBHOOK_ENDPOINT_SECRET" in the `./payments/service/.env.local` file

      [Instructions for creating Stripe keys](https://stripe.com/docs/keys)

   3.2 Stripe Webhooks
      - "payment_intent.succeeded" is the type of event which the webhook should handle
        
      [Instructions for creating Stripe webhooks](https://stripe.com/docs/development/dashboard/register-webhook)


4. To use the uploading images functionality you need to create AWS S3 bucket. After creating the bucket you will need to fulfill the following keys:

   - "AWS_ACCESS_KEY_ID"
   - "AWS_SECRET_ACCESS_KEY"
   - "AWS_REGION"
   - "AWS_BUCKET_NAME" in the following files: `./client/service/.env.local` `./provider/service/.env.local` `./user/service/.env.local` and
   - VITE_AMAZON_S3_BUCKET in the following files: `./website/.env.development` `./client-ui/.env.development` `./provider-ui/.env.development` `./user-ui/.env.development` `./admin-country-ui/.env.development` `./admin-global-ui/.env.development`

   [Instruction for creating AWS Account and Access Keys](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)

   [Instructions for creating Create AWS S3 Bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-bucket.html)

5. To use the video consultation functionality you need to create Twilio account. After creating the account you need to fullfill the following keys:

- "TWILIO_ACCOUNT_SID"
- "TWILIO_API_SID"
- "TWILIO_API_SECRET"
- "TWILIO_AUTH_TOKEN" in the `user/service/.env.local/` file and
- "TWILIO_ACCOUNT_SID"
- "TWILIO_AUTH_TOKEN" in the `./provider/service/.env.local`file

   [Instructions for finding Twilio Access Keys](https://missiveapp.com/faq/twilio-credentials)

6. To use the email functionality you need access to an email account that can be used to setup the email service. The following enviorment variables need to be fullfilled: -"EMAIL_SENDER" -"EMAIL_SENDER_PASSWORD" -"EMAIL_HOST" -"EMAIL_PORT" -"RECIEVERS" in the `./email/.env.local` file

[Instructions for creating email server](https://kinsta.com/blog/gmail-smtp-server/?fbclid=IwAR2K0lQLxKEUno7BQ1b4ju45qpyI7NB_otAnwwMRGuFfT6sE75hKEVmHaCY)

7. After successfully running all the microservices set the "VITE_API_ENDPOINT" key to "http://localhost:3000/api" in the following files: `./website/.env.development` `./client-ui/.env.development` `./provider-ui/.env.development` `./user-ui/.env.development` `./admin-country-ui/.env.development` `./admin-global-ui/.env.development`

Local Deployment:

- run `./deploy.sh local`
- run + database drop: `./deploy.sh local drop`

The above commands wil configure the local databse and run all the contaiers.

Notes:

1. To track the logs for all the containers run `docker-compose logs -f`.
2. To see logs for a single container run

   ```sh
   docker-compose logs -f {container_name}
   ```

3. Note that once built you can stop the services using `docker-compose -f docker-compose.yml down`. If running on staging or production use the relevant docker-compose file to stop the containers.
4. If you need to rebuild the containers, run `docker-compose -f docker-compose.yml up -d --build`
5. To restart a single container run:

   ```sh
   docker-compose stop {container_name}
   docker-compose rm -f {container_name}
   docker compose -f docker-compose.yml up -d --build {container_name}
   ```

6. To add a new dependency, still run `npm install {dependency}`. To upgrade, use either `npm update {dependency}` or `npm install ${dependendency}@{version}` and commit the changed `package-lock.json`. If an upgrade fails, revert to the last known working `package-lock.json`
7. After running `npm audit fix` remember to commit any changes to `package-lock.json` to the repo
8. Each UI runs on a port that is specified in it's package.json file. To change it, change the port number in the package.json "dev" script

### Committing changes in submodules

```sh
cd your_submodule
git commit -a -m "{commit message}"
git push
cd ..
git add your_submodule
git commit -m "Updated submodule"
```

### Please follow these naming conventions for your branches

- Features `feature/{JIRA_ID}-{branch_name}`
- Bugs `bug/{JIRA_ID}-{branch_name}`
- Hotfixes `hotfix/{JIRA_ID}-{branch_name}`

### Guidelines for writing a commit message when committing changes to any of the git submodules

- Create: `[commit message]` (create a new component)
- Add: `[commit message]` (addition to an existing component)
- Fix: `[commit message]` (fix a bug within an existing component)
- Refactor: `[commit message]` (refactor an existing component)

### Kubernetes Clusters

We are using Kubernetes clusters for our staging and production environments to run all API services as well as all client apps. Each API service runs in a single-container pod and has a `service`, `config`, `deployment` and `secrets` yaml files.

We are using the AWS EKS service to run each cluster.

Here we explain how to set up your local machine so you are able to run, maintain and spin off new containers in each cluster.

## Before you start

Make sure you have the following tools installed:

- AWS CLI - click [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) for instructions.
- Kubectl - used for communicating with the cluster. You need this to be able to control each pod. Click [here](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html) for instructions
- Install AWS IAM Authenticator - `brew install aws-iam-authenticator`
- Amazon ECR Docker Credential Helper - [GitHub Repo](https://github.com/awslabs/amazon-ecr-credential-helper)
- Change `~/.docker/config.json` to be `"credsStore": "ecr-login"`
- Add `secrets.yaml` files for each pod and environment

### Apple Silicon laptop

- Add at the end of your \~/.zshrc file the following line `export DOCKER_DEFAULT_PLATFORM=linux/amd64`
- Ensure that the installed K8S version is 1.23.6, otherwise apply the following commands:

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/darwin/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl
```

## How to deploy or redeploy an API pod

The first time you want to deploy a new pod to the cluster you can use the following command from the root folder of the project: `./kube-deploy.sh {pod folder name} {staging | prod} deploy` E.g. `./kube-deploy.sh admin staging deploy` - This will deploy and configure the admin pod with the staging env variables (### NOTE: Make sure you are in the correct context ###) E.g. `./kube-deploy.sh all staging deploy` - This will deploy and configure all pods with the staging env variables (### NOTE: Make sure you are in the correct context ###)

Each K8s pod is configured to have a Rolling Update which ensures minimal downtime as the old pod stays READY until the new pod is deployed, configured and working. Use this command every time you want to apply a new change in `config.yaml`, `secrets.yaml` or the container build:\
`./kube-deploy.sh {pod folder name} {staging | prod} redeploy`

If you want to stop a pod you have to go to the folder where the pod `deployment.yaml` file is:

```
cd admin/kube-config/staging
kubectl delete -f deployment.yaml
```

## Shared Cluster Pods

All shared cluster pods and services are in the `./kube-services` folder in the root folder of the project. There you can find deployment and service yaml files for kafka broker, zookeeper and redis.

In `./kube-services/db-services` you can find all External Names for the DBs used in the project. Add or change those to update the URL for outside resources the pods need to communicate with.

## Folder structure explained

Each service has the same kubernetes configuration folder called `kube-config`. In that folder you can find deployment environment independent yaml files (`config.yaml` & `service.yaml`). You can also find folders called `staging` and `prod` which contain the `deployment.yaml` and `secrets.yaml` files for each deployment environment.

## Useful Commands

- `kubectl get po` - Get all pods in a cluster
- `kubectl get po -n {namespace}` - Get all pods in a specific namespace of a cluster
- `kubectl logs -f {pod name}` - Get the console logs of a specific pod (same as `docker-compose logs -f`)
- `kubectl apply -f {yaml file}` - Use this to apply a yaml configuration to the current cluster
- `kubectl describe pod {pod name}` - Detailed information of a pod status. Use this to identify why a pod failed
- `kubectl get services` - Get all services running on the cluster
- `kubectl get ingress` - Get the cluster ingress service
- `kubectl config use-context {context name}` - Use this to switch between cluster contexts. IMPORTANT: Make sure you are in the correct context before making changes as you can apply changes to the production cluster
- `kubectl config view` - See all contexts. Use this to see what clusters tour local machine is connected to

## Useful resources:

- [How to Setup a New EKS Cluster](https://logz.io/blog/amazon-eks-cluster/)
- [How to Build and Push Docker Images to AWS ECR](https://www.freecodecamp.org/news/build-and-push-docker-images-to-aws-ecr/)
- [Handling env variables in K8s](https://humanitec.com/blog/handling-environment-variables-with-kubernetes)
- [Accessing Resources From Outside the Cluster VPC - RDS example](https://dev.to/bensooraj/accessing-amazon-rds-from-aws-eks-2pc3)
- [NLB - Using TLS for Your Cluster Ingress](https://aws.amazon.com/blogs/opensource/network-load-balancer-nginx-ingress-controller-eks/)
- [List of Max Pods Supported For Each K8s Node Instance](https://github.com/awslabs/amazon-eks-ami/blob/master/files/eni-max-pods.txt)
- [Base64 Encoder](https://www.base64encode.org)
