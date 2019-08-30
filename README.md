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

## Notes
* should separate ECR from app from pipeline

---



`docker build hello-world -t hello-world`


`docker run --name ntno-challenge -p 8080:80 -d hello-world:latest` 

`docker run --name ntno-challenge -p 8080:80 hello-world:latest` 

`docker exec -it ntno-challenge bash`

`docker stop ntno-challenge`

`docker rm ntno-challenge`
