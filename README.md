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
* optional ssh access (via cloudformation parameter, defaults to no access over port 22)


**in progress**
* integrate the deploy template with codedeploy

**todo:**
  * grab certificate from systems manager parameter store and install during ec2 boot - see bootscript in `deploy-hello-world-app.yml`
* add test stage to pipeline
* research how to handle branch builds/deploys/e2e tests
* break out the creation of the codecommit repo and ecr repo from the pipeline template 
* research cloudformation signals / wait conditions - should wait for log group to finish before creating instance


## Install
### Prerequisites
* create an amazon ec2 key pair and store securely
* s3 bucket to store cloud formation templates (ex: ntno-misc)
* aws user with the following permissions 
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
* `./create-pipeline-stack.sh  `

### Step 3
connect to codecommit repo following aws instructions  
copy contents of [hello-world](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/hello-world) to the codecommit repo  
push to codecommit  

### Step 4 - (work around until todos are complete)
log into amazon console and check the pipeline for build results  
if the web app built successfully then provision the web app using [deploy-hello-world-app.yml](https://github.com/ntno/ntno-challenge/tree/master/infrastructure/cloudformation/cft/deploy-hello-world-app.yml)  
connect to the ec2 instance via ssh and manually run the bootstrap config (see `UserData`)
navigate to https://PUBLIC_IPV4_DNS in the browser
* `./create-app-deploy-stack.sh`  

### Step 5  

example:  
* `curl https://ec2-13-59-209-203.us-east-2.compute.amazonaws.com`  
* `curl -k https://ec2-13-59-209-203.us-east-2.compute.amazonaws.com`  

---  
---  

## Coding
### Problem
[regex/file parsing](https://www.hackerrank.com/challenges/validating-credit-card-number/problem)

### Solution
see [code](https://github.com/ntno/ntno-challenge/blob/master/code/validate.py) for solution


---
---  
