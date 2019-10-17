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

FROM amazonlinux:latest
RUN yum install -y awscli
RUN yum install -y openssl

#generate certificate

RUN openssl req -x509 -newkey rsa:4096 \
         -keyout key.pem \
         -out cert.pem \
         -days 365 \
         -subj "/C=US/ST=Pennsylvania/L=Philadelphia/O=ntno/OU=./CN=."  \
         -nodes

#configure awscli
ARG AWS_ACCESS_KEY_ID="some_access_key_id"
ARG AWS_SECRET_ACCESS_KEY="some_secret_access_key"
ARG AWS_REGION="some_default_region"
RUN aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
RUN aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
RUN aws configure set region $AWS_REGION

#upload certificate to systems manager parameter store as a secure string 
ARG APP_PRIVATE_KEY_SSM_PATH="/hello-world/key.pem"
RUN aws ssm put-parameter --name $APP_PRIVATE_KEY_SSM_PATH --value "$(cat key.pem)"  --type "SecureString" --overwrite

ARG APP_CERTIFICATE_SSM_PATH="/hello-world/cert.pem"
RUN aws ssm put-parameter --name $APP_CERTIFICATE_SSM_PATH --value "$(cat cert.pem)" --type "SecureString" --overwrite

#delete certificates from image
RUN rm key.pem
RUN rm cert.pem

#overwrite keys
RUN aws configure set aws_access_key_id "."
RUN aws configure set aws_secret_access_key "."
RUN aws configure set region "."

#uninstall awscli
RUN yum remove -y awscli