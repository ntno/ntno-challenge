## ntno-challenge

### Infrastructure
* static web application
* AWS
* secure
  * http redirects to https
  * self signed cert ok
    * how to get certs onto the container?
    * is docker secrets compatable with aws?
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
* [intro to nginx](https://carrot.is/coding/nginx_introduction)


* [gist with comments](https://gist.github.com/plentz/6737338)
* [securing nginx with nice explanations](https://help.dreamhost.com/hc/en-us/articles/222784068-The-most-important-steps-to-take-to-make-an-nginx-server-more-secure)
*  !! [nginx config generator](https://nginxconfig.io/?0.non_www=false&0.php=false&0.index=index.html&0.fallback_html)
* [generating cert in dockerfile(?)](https://codefresh.io/docker-tutorial/using-docker-generate-ssl-certificates/)
* [might be useful for adding certs](https://github.com/KyleAMathews/docker-nginx)
* [use bootstrap script to make the cert](https://forums.docker.com/t/get-ssl-certificate-for-use-in-docker-container/42069/3)
* [docker + self signed cert tutorial](https://www.johnmackenzie.co.uk/post/creating-self-signed-ssl-certificates-for-docker-and-nginx/)
* !! [use docker secrets to store the certs](https://docs.docker.com/ee/ucp/interlock/usage/tls/)
* !! [aws docs on getting certs to container](https://aws.amazon.com/blogs/compute/maintaining-transport-layer-security-all-the-way-to-your-container-part-2-using-aws-certificate-manager-private-certificate-authority/)
## Notes
* should separate ECR from app from pipeline

---



`docker build hello-world -t hello-world`


`docker run --name ntno-challenge -p 8080:80 -d hello-world:latest` 

`docker run --name ntno-challenge -p 8080:80 hello-world:latest` 

`docker exec -it ntno-challenge bash`

`docker stop ntno-challenge`

`docker rm ntno-challenge`
