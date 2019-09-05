# ntno-challenge

## Infrastructure
see [infrastructure](https://github.com/ntno/ntno-challenge/tree/master/infrastructure) for solution (in progress)

**complete:**
* http web app using nginx and docker
* force http -> https (locally tested)
* docker image for generating a self signed certificate and uploading to aws systems manager parameter store
* integration with aws codecommit and codebuild
  * changes to web app are automatically built into an image
  * docker image is stored in elastic container registry 
* automated provisioning of the codecommit/codebuild pipeline - see [pipeline.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/pipeline.yml)
  

**in progress**
* troubleshoot the automatic provisioning of the web app deployment - see [deploy-hello-world-app.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/deploy-hello-world-app.yml)
* clean up deploy template
  * create profile for the ec2 instance
    * needs create log access
    * needs ecr pull access
  * add ec2 instance profile
  * create log group 

**todo:**
* integrate the deploy template with codedeploy
  * grab certificate from systems manager parameter store and install during ec2 boot - see bootscript in `deploy-hello-world-app.yml`
* add test stage to pipeline
* research how to handle branch builds/deploys/e2e tests


### Install
#### Prerequisites
* create an amazon ec2 key pair and store securely
* s3 bucket to store cloud formation templates (ex: ntno-misc)
* aws user with the following permissions 
  * add parameters to the systems manager parameter store
  * create/update/delete cloudformation stacks
  * write/read for the cloud formation template bucket
* docker
* awscli

#### Step 1 
generate certificate and add to the systems manager parameter store

`docker build generate-certificate \
   -t generate-certificate \
   --build-arg AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id)" \
   --build-arg AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key)" \
   --build-arg AWS_REGION="$(aws configure get region)" \
   --no-cache` 

#### Step 2
#### Step 3
#### Step 4




## Coding
### Problem
[regex/file parsing](https://www.hackerrank.com/challenges/validating-credit-card-number/problem)

### Solution
see [code](https://github.com/ntno/ntno-challenge/blob/master/code/validate.py) for solution


---
