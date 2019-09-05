#!/bin/sh
Region=$(aws configure get region)
BucketName="ntno-code-pipeline-artifacts-${Region}"
StackName=$BucketName
templateName="cft/artifact-bucket.yml"

aws s3 cp $templateName s3://ntno-misc/$templateName --sse
aws cloudformation validate-template --template-body file://$templateName
aws cloudformation update-stack --template-url https://ntno-misc.s3.amazonaws.com/$templateName \
                                --stack-name ${StackName}  \
                                --parameters  ParameterKey=CustomBucketName,ParameterValue=${BucketName} \
                                              ParameterKey=DomainTag,ParameterValue=personal 

export NTNO_CHALLENGE_ARTIFACT_BUCKET_NAME=$BucketName