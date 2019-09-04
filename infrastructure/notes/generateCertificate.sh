openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj "/C=US/ST=Pennsylvania/L=Philadelphia/O=ntno/OU=./CN=."  -nodes

#to put
aws ssm put-parameter --name "dummyPrivateKey" --value "$(cat key.pem)"  --type "SecureString" --overwrite
aws ssm put-parameter --name "dummyCert" --value "$(cat cert.pem)" --type "SecureString" --overwrite
#use --overwrite if not version 1

#to retrieve
aws ssm get-parameter --name "dummyPrivateKey" --region us-east-2  --with-decryption 