## ntno-challenge

### Infrastructure
* static web application
* AWS
* secure
  * http redirects to https
  * self signed cert ok
* automated testing of infrastructure
* scripts only (no manual config)

### Coding
[regex/file parsing](https://www.hackerrank.com/challenges/validating-credit-card-number/problem)


---

## References
* [node app on aws (manual)](https://ourcodeworld.com/articles/read/977/how-to-deploy-a-node-js-application-on-aws-ec2-server)
* [tutorial on build/deploy pipeline](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-cd-pipeline.html)
* [another tutorial](https://www.infoq.com/articles/aws-codepipeline-deploy-docker/)
* [securing ec2 instances](https://aws.amazon.com/answers/security/aws-securing-ec2-instances/)
* [installing nginx on docker](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/)
* [nginx on docker](https://www.digitalocean.com/community/tutorials/how-to-run-nginx-in-a-docker-container-on-ubuntu-14-04)
* [nginx config](http://nginx.org/en/docs/beginners_guide.html)
* [secure nginx](https://www.cyberciti.biz/tips/linux-unix-bsd-nginx-webserver-security.html)



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


`docker run --name ntno-challenge -p 8080:80 -d hello-world:latest` 

`docker run --name ntno-challenge -p 8080:80 hello-world:latest` 

`docker exec -it ntno-challenge bash`

`docker stop ntno-challenge && docker rm ntno-challenge`
