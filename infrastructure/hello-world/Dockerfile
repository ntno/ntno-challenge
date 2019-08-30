FROM nginx

#install utilities  
RUN apt-get update 
RUN apt-get install -y wget ca-certificates openssl
RUN apt-get install -y procps curl vim

#backup original nginx configs
RUN mkdir -p /home/backup
RUN cp /etc/nginx/conf.d/default.conf /home/backup/default.conf
RUN cp /etc/nginx/nginx.conf /home/backup/nginx.conf

#create new user for hello-world site
RUN adduser --system --no-create-home --shell /bin/false --group --disabled-login www-hello-world


#copy cert scripts
COPY setup /opt/program
RUN chmod +x /opt/program/installCertbot.sh 
RUN chmod +x /opt/program/generateCert.sh

#copy nginx configuration
# COPY nginxconfig/ /etc/nginx/

#test nginx configuration
RUN /bin/bash -c "nginx -t"

#copy site content
COPY site /var/www/hello-world
