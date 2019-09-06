# ntno-challenge

## Infrastructure

**complete:**
* http web app using nginx and docker
* force http -> https (locally tested)
* nginx config tested during build 
* docker image for generating a self signed certificate and uploading to aws systems manager parameter store
* cert is pulled into final web app image during the build process - **not** stored with the web app code
  * note - this is still not ideal because the keys are stored in the build artifact and final image (see todos)
* integration with aws codecommit, codebuild, codedeploy
  * changes to web app are automatically built into an image
  * build process gets latest certs from systems parameter store
  * docker image is packaged and stored in s3
    * docker image is also stored in elastic container registry for easy retrieval
  * packaged image is deployed to host server
* automated provisioning of the codecommit -> codebuild -> codedeploy pipeline - see [pipeline.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/pipeline.yml)
* automated provisioning of the host server and associated networking resources - see [deploy-hello-world-app.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/deploy-hello-world-app.yml)
  * optional ssh access (via cloudformation parameter, defaults to no access over port 22)

**in progress**
* clean up IAM roles 
  * for the purposes of completing this POC quickly I made some of the roles more permissive than I would like them to be
  * policies should be restricted to only act on pipeline resources
  * unused policies should be removed

**todo:**
* integrate with automated certificate generator like certbot
  * we want to prevent cert from being stored with app code or app image
* add test stage to pipeline for functional testing (as opposed to configuration syntax checking)
  * python e2e tests on against running container
* research how to handle branch builds/deploys

## Install
### Prerequisites
* create an amazon ec2 key pair and store securely
* s3 bucket to store cloud formation templates (ex: ntno-misc)
* aws user with the following permissions:  
  * add parameters to the systems manager parameter store
  * create/update/delete cloudformation stacks
  * write/read for the cloud formation template bucket
* docker
* awscli
* aws user with codecommit permissions and credentials (can be separate or the same as the first user)
* update the [cloudformation helper script](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/create.sh) with your custom parameters (bucket name, ec2 key pair name, etc.)  

### Step 1 
generate certificate and add to the systems manager parameter store

`
docker build generate-certificate \
   -t generate-certificate \
   --build-arg AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id)" \
   --build-arg AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key)" \
   --build-arg AWS_REGION="$(aws configure get region)" \
   --no-cache
`

### Step 2
* provision bucket for storing pipeline artifacts using [artifact-bucket.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/pipeline.yml)
* provision resources required for app hosting using [deploy-hello-world-app.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/pipeline.yml)
* provision the codecommit->codebuild->codedeploy pipeline using [pipeline.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/pipeline.yml)  

*see [create.sh](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/create.sh) for notes on parameter values*

### Step 3
* connect to codecommit repo following aws instructions  
* copy contents of [hello-world](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/hello-world) to the codecommit repo 
  * (do not include .git files)  
* push to codecommit  

### Step 4 
wait for pipeline to complete

### Step 5  
visit the public dns of the hosted app

* `region=$(aws configure get region)`  
* `publicDns=$(aws cloudformation describe-stacks --stack-name app-hosting --query "Stacks[0].Outputs[?OutputKey=='PublicDns'].OutputValue" --output text)`  
* `curl http://$publicDns.$region.compute.amazonaws.com`  
* `curl -k https://$publicDns.$region.compute.amazonaws.com`  

*note: you may need to navigate to the above address in chrome and go through the 'advanced -> proceed' before the above curl requests work correctly*

---
---

## Coding
### Problem
[regex/file parsing](https://www.hackerrank.com/challenges/validating-credit-card-number/problem)

### Solution
see [code](https://github.com/ntno/ntno-challenge/blob/master/code/validate.py) for solution


---
---  
