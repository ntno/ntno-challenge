#!/bin/sh
Region=$(aws configure get region)
BucketName=ntno-code-pipeline-artifacts-${Region}
StackName=$BucketName
TemplateName=artifact-bucket.yml

aws cloudformation update-stack --template-body file://${TemplateName} \
                                --stack-name ${StackName}  \
                                --parameters  ParameterKey=CustomBucketName,ParameterValue=${BucketName} 

export NTNO_CHALLENGE_ARTIFACT_BUCKET_NAME=$BucketName