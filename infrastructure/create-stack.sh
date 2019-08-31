#!/bin/sh
#create-stack.sh
templateName=pipeline.yml
stackName=ntno-challenge-pipeline

repoName=hello-world
repoDescription=serves static site securely

aws s3 cp pipeline.yml s3://ntno-misc/cft/$templateName --sse
aws cloudformation create-stack --template-url https://ntno-misc.s3.amazonaws.com/cft/$templateName \
                    --stack-name $stackName \
                    --parameters  ParameterKey=RepoName,ParameterValue=$repoName \
                                  ParameterKey=RepoDescription,ParameterValue=$repoDescription
