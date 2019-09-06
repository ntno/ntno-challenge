
## References
* [node app on aws (manual)](https://ourcodeworld.com/articles/read/977/how-to-deploy-a-node-js-application-on-aws-ec2-server)
* [tutorial on build/deploy pipeline](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-cd-pipeline.html)
* [another tutorial](https://www.infoq.com/articles/aws-codepipeline-deploy-docker/)
* [securing ec2 instances](https://aws.amazon.com/answers/security/aws-securing-ec2-instances/)
* [installing nginx on docker](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/)
* [nginx on docker](https://www.digitalocean.com/community/tutorials/how-to-run-nginx-in-a-docker-container-on-ubuntu-14-04)
* [nginx config](http://nginx.org/en/docs/beginners_guide.html)
* [secure nginx](https://www.cyberciti.biz/tips/linux-unix-bsd-nginx-webserver-security.html)
* [intro to nginx](https://carrot.is/coding/nginx_introduction)


* [gist with comments](https://gist.github.com/plentz/6737338)
* [securing nginx with nice explanations](https://help.dreamhost.com/hc/en-us/articles/222784068-The-most-important-steps-to-take-to-make-an-nginx-server-more-secure)
*  !! [nginx config generator](https://nginxconfig.io/?0.non_www=false&0.php=false&0.index=index.html&0.fallback_html)
* [generating cert in dockerfile(?)](https://codefresh.io/docker-tutorial/using-docker-generate-ssl-certificates/)
* [might be useful for adding certs](https://github.com/KyleAMathews/docker-nginx)

```
#To use SSL, put your certs in /etc/nginx/ssl and enable the default-ssl site:

ADD server.crt /etc/nginx/ssl/
ADD server.key /etc/nginx/ssl/
RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/default-ssl

#When you run it, you'll want to make port 443 available, e.g.:

$ docker run -p 80:80 -p 443:443 -d mysite
```

* [use bootstrap script to make the cert](https://forums.docker.com/t/get-ssl-certificate-for-use-in-docker-container/42069/3)
* [docker + self signed cert tutorial](https://www.johnmackenzie.co.uk/post/creating-self-signed-ssl-certificates-for-docker-and-nginx/)
* !! [use docker secrets to store the certs](https://docs.docker.com/ee/ucp/interlock/usage/tls/)
* !! [aws docs on getting certs to container](https://aws.amazon.com/blogs/compute/maintaining-transport-layer-security-all-the-way-to-your-container-part-2-using-aws-certificate-manager-private-certificate-authority/)



* [docker buildspec.yml](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html)
* [buildspec reference](https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html)
* [code pipeline resource types](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awscodepipeline.html)
* [code deploy resource types](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awscodedeploy.html)
* [code commit resource types](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awscodecommit.html)
* [ecr example policies](https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicyExamples.html)
* [curated environments for codebuild](https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html)
* [test stage](https://docs.aws.amazon.com/codebuild/latest/userguide/how-to-create-pipeline.html#how-to-create-pipeline-add-test)
* [artifact troubleshooting](https://stelligent.com/2018/09/06/troubleshooting-aws-codepipeline-artifacts/)

* [docker aws tutorial](https://www.ybrikman.com/writing/2015/11/11/running-docker-aws-ground-up/)
* [how to install ecs software on ec2](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-install.html)
* [aws docs on installing docker on ec2](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html)


* [critical info on bootscript](https://aws.amazon.com/premiumsupport/knowledge-center/execute-user-data-ec2/)
* [docs on bootscript](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)

* [blank if false cloudformation syntax](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/pseudo-parameter-reference.html)

* [cloudformation conditionals syntax](https://ig.nore.me/2018/02/conditionals-in-cloudformation/)

### TODOs
* add test stage to pipeline
* create deploy project
* review IAM privledges
* update awscloudformationexample repo with new bucket policy
* send build artifacts to s3 so that code pipeline can pick them up
* consider movning code commit repo away from pipeline because if that gets deleted then so does the code history
* investigate how branch builds would work
---



`docker build hello-world -t hello-world`

`docker run --name ntno-challenge -p 80:80 -p 443:443 -d hello-world:latest` 

`docker run --name ntno-challenge -p 80:80 -p 443:443 hello-world:latest` 

`docker exec -it ntno-challenge bash`

`docker stop ntno-challenge && docker rm ntno-challenge`


`docker build generate-certificate \
   -t generate-certificate \
   --build-arg AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id)" \
   --build-arg AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key)" \
   --no-cache` 