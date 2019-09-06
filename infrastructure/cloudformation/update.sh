#update.sh

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
# aws cloudformation update-stack --template-url https://${cftBucketName}.s3.amazonaws.com/$makeArtifactBucketTemplate \
#                                 --stack-name ${artifactBucketStackName}  \
#                                 --parameters  ParameterKey=CustomBucketName,ParameterValue="${ArtifactBucketName}" \
#                                               ParameterKey=DomainTag,ParameterValue=personal 
######################################


######################################
SSHKeyPair="ntno-us-east-1"
LogGroupName="hello-world-docker-container"
# aws s3 cp $makeHostingResourcesTemplate s3://${cftBucketName}/$makeHostingResourcesTemplate --sse
# aws cloudformation validate-template --template-body file://$makeHostingResourcesTemplate

# aws cloudformation update-stack --template-url https://${cftBucketName}.s3.amazonaws.com/$makeHostingResourcesTemplate \
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

# aws s3 cp $makePipelineTemplate s3://${cftBucketName}/$makePipelineTemplate --sse
# aws cloudformation validate-template --template-body file://$makePipelineTemplate
# aws cloudformation update-stack --template-url https://${cftBucketName}.s3.amazonaws.com/$makePipelineTemplate \
#                     --capabilities CAPABILITY_NAMED_IAM \
#                     --stack-name $pipelineStackName \
#                     --parameters  ParameterKey=RepoName,ParameterValue=$RepoName \
#                                   ParameterKey=RepoDescription,ParameterValue="$RepoDescription" \
#                                   ParameterKey=HostResourceStackName,ParameterValue="$hostResourcesStackName"\
#                                   ParameterKey=ArtifactBucketName,ParameterValue="$ArtifactBucketName"\
#                                   ParameterKey=DomainTag,ParameterValue=personal \
#                                   ParameterKey=ProjectTag,ParameterValue=ntno-challenge \

######################################

