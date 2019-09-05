# ntno-challenge

## Infrastructure
### Problem
* static web application
* AWS
* secure
  * http redirects to https
  * self signed cert ok
* automated testing of infrastructure
* scripts only (no manual config)


### Solution
see [infrastructure](https://github.com/ntno/ntno-challenge/tree/master/infrastructure) for partial solution

**complete:**
* http web app using nginx and docker
* integration with codecommit
* integration with codebuild 
  * changes to web app are automatically built
  * docker image is stored in elastic container registry 
* creation of source->build pipeline done via [cloudformation template](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/pipeline.yml)
* [researched](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/notes/reference.md):
  * how to deploy docker applications with elastic container service (ecs)
  * how to redirect http traffic to https with nginx
  * how to automate certificate installation with bootstrap script or with the secure parameter store service
* cloud formation template to deploy nginx web app on ec2 with associated application load balancer

**in progress**
* clean up deploy template (don't need all the resources that were in the example)
  * create role for the ec2 instance
    * needs create log access
    * needs ecr pull access
  * add ec2 instance profile
  * create log group 
* finish https web app implementation 

**todo:**
* add 'deploy' step to pipeline via codedeploy
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
