#!/bin/sh
#create-app-deploy-stack.sh
templateName="cft/deploy-hello-world-app.yml"
stackName="ntno-challenge-app-deploy"

sshKeyPair="ntno-challenge-key-pair"

aws s3 cp $templateName s3://ntno-misc/$templateName --sse
aws cloudformation validate-template --template-body file://$templateName
aws cloudformation create-stack --template-url https://ntno-misc.s3.amazonaws.com/$templateName \
                    --capabilities CAPABILITY_NAMED_IAM \
                    --stack-name $stackName \
                    --parameters  ParameterKey=SSHKeyName,ParameterValue=$sshKeyPair 