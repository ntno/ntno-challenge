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