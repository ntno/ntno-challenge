FROM nginx
RUN cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.backup
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
COPY site /usr/share/nginx/html
COPY nginx.conf /etc/nginx
RUN /bin/bash -c "nginx -t"
