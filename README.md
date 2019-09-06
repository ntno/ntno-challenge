# ntno-challenge

## Infrastructure
see [infrastructure](https://github.com/ntno/ntno-challenge/tree/master/infrastructure) for solution (in progress)

**complete:**
* http web app using nginx and docker
* force http -> https (locally tested)
* nginx config tested during build 
* docker image for generating a self signed certificate and uploading to aws systems manager parameter store
* integration with aws codecommit, codebuild, codedeploy
  * changes to web app are automatically built into an image
  * docker image is packaged and stored in s3
    * docker image is also stored in elastic container registry for easy retrieval
  * packaged image is deployed to host server
* automated provisioning of the codecommit/codebuild/codedeploy pipeline - see [pipeline.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/pipeline.yml)
* automated provisioning of the host server and associated networking resources - see [deploy-hello-world-app.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/deploy-hello-world-app.yml)
  * optional ssh access (via cloudformation parameter, defaults to no access over port 22)

**in progress**
 * grab certificate from systems manager parameter store so that cert creation is automated 
   * ideally this should happen during the deploy / runtime so the certs aren't stored in the image
   * future enhancements would be to use an automated cert generator like certbot

**todo:**
* add test stage to pipeline
* research how to handle branch builds/deploys/e2e tests

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
* update the [cloudformation helper scripts](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/) with your custom parameters (bucket name, ec2 key pair name, etc.)  

### Step 1 
generate certificate and add to the systems manager parameter store

`docker build generate-certificate \
   -t generate-certificate \
   --build-arg AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id)" \
   --build-arg AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key)" \
   --build-arg AWS_REGION="$(aws configure get region)" \
   --no-cache`   

### Step 2
provision the codecommit and codebuild pipeline using [pipeline.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/pipeline.yml)  
* `cd infrastructure/cloudformation`  
* `./create-artifact-bucket-stack.sh`  
* `./create-pipeline-stack.sh`  

### Step 3
connect to codecommit repo following aws instructions  
copy contents of [hello-world](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/hello-world) to the codecommit repo (do not include .git files)  
push to codecommit  

### Step 4 


### Step 5
curl https://ec2-13-59-209-203.us-east-2.compute.amazonaws.com
curl -k https://ec2-13-59-209-203.us-east-2.compute.amazonaws.com
---  

## Coding
### Problem
[regex/file parsing](https://www.hackerrank.com/challenges/validating-credit-card-number/problem)

### Solution
see [code](https://github.com/ntno/ntno-challenge/blob/master/code/validate.py) for solution


---
