#!/bin/sh
#create-stack.sh
templateName=pipeline.yml
stackName=ntno-challenge-pipeline

repoName=hello-world
repoDescription=serves static site securely
artifactBucketName=$NTNO_CHALLENGE_ARTIFACT_BUCKET_NAME        #see create-artifact-bucket-stack.sh

aws s3 cp pipeline.yml s3://ntno-misc/cft/$templateName --sse
aws cloudformation create-stack --template-url https://ntno-misc.s3.amazonaws.com/cft/$templateName \
                    --capabilities CAPABILITY_NAMED_IAM \
                    --stack-name $stackName \
                    --parameters  ParameterKey=RepoName,ParameterValue=$repoName \
                                  ParameterKey=RepoDescription,ParameterValue=$repoDescription \
                                  ParameterKey=ArtifactBucketName,ParameterValue=$artifactBucketName
