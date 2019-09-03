# ntno-challenge

## Infrastructure
### Problem
* static web application
* AWS
* secure
  * http redirects to https
  * self signed cert ok
* automated testing of infrastructure
* scripts only (no manual config)

### Solution
see [infrastructure](https://github.com/ntno/ntno-challenge/tree/master/infrastructure) for partial solution

**complete:**
* http web app using nginx and docker
* integration with codecommit
* integration with codebuild 
  * changes to web app are automatically built
  * docker image is stored in elastic container registry 
* creation of source->build pipeline done via [cloudformation template](https://github.com/ntno/ntno-challenge/tree/master/infrastructure.yml)
* researched:
  * how to deploy docker applications with elastic container service (ecs)
  * how to redirect http traffic to https with nginx
  * how to automate certificate installation with bootstrap script or with the secure parameter store service


**todo:**
* finish https web app implementation 
  * started in branch `secure-nginx`
* get ecs cluster working manually
* convert ecs cluster infrastructure to code
* integrate ecs cluster with codedeploy
* integrate codedeploy project with pipeline

---

## Coding
#### Problem
[regex/file parsing](https://www.hackerrank.com/challenges/validating-credit-card-number/problem)

#### Solution
see [code](https://github.com/ntno/ntno-challenge/blob/master/code/validate.py) for solution


---
