FROM nginx

#back up original configurations
RUN cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.backup
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup

#create user for hello-world site
RUN adduser --system --no-create-home --shell /bin/false --group --disabled-login www-hello-world

#copy the certificate
COPY dummy-key.pem /etc/nginx/ssl/hello-world.key
COPY dummy-cert.pem /etc/nginx/ssl/hello-world.crt

#copy the configuration
COPY nginx.conf /etc/nginx

#copy the site content
COPY site /etc/nginx/www/hello-world

#test the configuration
RUN /bin/bash -c "nginx -t"
