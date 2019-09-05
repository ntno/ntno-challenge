FROM nginx

#back up original configurations
RUN cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.backup
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup

#copy the certificate
COPY dummy-key.pem /etc/nginx/ssl/hello-world.key
COPY dummy-cert.pem /etc/nginx/ssl/hello-world.crt

#copy the configuration
COPY nginx.conf /etc/nginx

#copy the site content
COPY site /usr/share/nginx/html

#test the configuration
RUN /bin/bash -c "nginx -t"
