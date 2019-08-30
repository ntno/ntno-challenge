FROM nginx

#install procps for ps (useful for troubleshooting - could be removed)
RUN apt-get update && apt-get install -y procps

#backup original nginx configs
RUN mkdir -p /home/backup
RUN cp /etc/nginx/conf.d/default.conf /home/backup/default.conf
RUN cp /etc/nginx/nginx.conf /home/backup/nginx.conf

#create new user for hello-world site
RUN adduser --system --no-create-home --shell /bin/false --group --disabled-login www-hello-world

#copy nginx configuration
COPY nginxconfig/nginx.conf /etc/nginx/

#test nginx configuration
RUN /bin/bash -c "nginx -t"

#copy site content
COPY site /var/www/hello-world
