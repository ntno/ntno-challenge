#!/bin/bash
################################################################################
# Copyright 2019 ntno                                                          #
#                                                                              #
# Licensed under the Apache License, Version 2.0 (the "License");              #
# you may not use this file except in compliance with the License.             #
# You may obtain a copy of the License at                                      #
#                                                                              #
#       http://www.apache.org/licenses/LICENSE-2.0                             #
#                                                                              #
# Unless required by applicable law or agreed to in writing, software          #
# distributed under the License is distributed on an "AS IS" BASIS,            #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.     #
# See the License for the specific language governing permissions and          #
# limitations under the License.                                               #
################################################################################

makeArtifactBucketTemplate="cft/artifact-bucket.yml"
makeHostingResourcesTemplate="cft/deploy-hello-world-app.yml"
makePipelineTemplate="cft/pipeline.yml"

artifactBucketStackName="artifact-bucket"
hostResourcesStackName="app-hosting"
pipelineStackName="app-pipeline"

region=$(aws configure get region)
cftBucketName="ntno-misc"

######################################
ArtifactBucketName="ntno-code-pipeline-artifacts-${region}"
# aws s3 cp $makeArtifactBucketTemplate s3://${cftBucketName}/$makeArtifactBucketTemplate --sse
# aws cloudformation validate-template --template-body file://$makeArtifactBucketTemplate
# aws cloudformation create-stack --template-url https://${cftBucketName}.s3.amazonaws.com/$makeArtifactBucketTemplate \
#                                 --stack-name ${artifactBucketStackName}  \
#                                 --parameters  ParameterKey=CustomBucketName,ParameterValue="${ArtifactBucketName}" \
#                                               ParameterKey=DomainTag,ParameterValue=personal 
######################################


######################################
SSHKeyPair="ntno-us-east-1"
LogGroupName="hello-world-docker-container"
# aws s3 cp $makeHostingResourcesTemplate s3://${cftBucketName}/$makeHostingResourcesTemplate --sse
# aws cloudformation validate-template --template-body file://$makeHostingResourcesTemplate

# aws cloudformation create-stack --template-url https://${cftBucketName}.s3.amazonaws.com/$makeHostingResourcesTemplate \
#                     --capabilities CAPABILITY_NAMED_IAM \
#                     --stack-name $hostResourcesStackName \
#                     --parameters    ParameterKey=LogGroupName,ParameterValue="$LogGroupName" \
#                                     ParameterKey=SSHKeyName,ParameterValue="$SSHKeyPair" \
#                                     ParameterKey=DomainTag,ParameterValue=personal \
#                                     ParameterKey=ProjectTag,ParameterValue=ntno-challenge 
######################################


######################################
RepoName="hello-world"
RepoDescription="serves static site securely"

aws s3 cp $makePipelineTemplate s3://${cftBucketName}/$makePipelineTemplate --sse
aws cloudformation validate-template --template-body file://$makePipelineTemplate
aws cloudformation create-stack --template-url https://${cftBucketName}.s3.amazonaws.com/$makePipelineTemplate \
                    --capabilities CAPABILITY_NAMED_IAM \
                    --stack-name $pipelineStackName \
                    --parameters  ParameterKey=RepoName,ParameterValue=$RepoName \
                                  ParameterKey=RepoDescription,ParameterValue="$RepoDescription" \
                                  ParameterKey=HostResourceStackName,ParameterValue="$hostResourcesStackName"\
                                  ParameterKey=ArtifactBucketName,ParameterValue="$ArtifactBucketName"\
                                  ParameterKey=DomainTag,ParameterValue=personal \
                                  ParameterKey=ProjectTag,ParameterValue=ntno-challenge \

######################################

