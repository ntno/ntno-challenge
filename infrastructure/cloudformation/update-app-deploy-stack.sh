#!/bin/sh
#update-app-deploy-stack.sh
templateName="cft/deploy-hello-world-app.yml"
stackName="ntno-challenge-app-deploy"

sshKeyPair="ntno-challenge-key-pair"
logGroupName="ntno-challenge-docker-logs"

aws s3 cp $templateName s3://ntno-misc/$templateName --sse
aws cloudformation validate-template --template-body file://$templateName
aws cloudformation update-stack --template-url https://ntno-misc.s3.amazonaws.com/$templateName \
                    --capabilities CAPABILITY_NAMED_IAM \
                    --stack-name $stackName \
                    --parameters  ParameterKey=LogGroupName,ParameterValue=$logGroupName \
                                    ParameterKey=SSHKeyName,ParameterValue=$sshKeyPair \
                                    ParameterKey=EcrRepoName,ParameterValue=hello-world \
                                    ParameterKey=ImageTag,ParameterValue=latest 
