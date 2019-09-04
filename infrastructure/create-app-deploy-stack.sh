#!/bin/sh
#create-app-deploy-stack.sh
templateName=deploy-hello-world-app.yml
stackName=ntno-challenge-app-deploy

sshKeyPair="ntno-challenge-key-pair"

aws s3 cp $templateName s3://ntno-misc/cft/$templateName --sse
aws cloudformation create-stack --template-url https://ntno-misc.s3.amazonaws.com/cft/$templateName \
                    --capabilities CAPABILITY_NAMED_IAM \
                    --stack-name $stackName \
                    --parameters  ParameterKey=SSHKeyName,ParameterValue=$sshKeyPair 