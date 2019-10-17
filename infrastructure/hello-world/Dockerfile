################################################################################
# Copyright 2019 ntno                                                          #
#                                                                              #
# Licensed under the Apache License, Version 2.0 (the "License");              #
# you may not use this file except in compliance with the License.             #
# You may obtain a copy of the License at                                      #
#                                                                              #
#       http://www.apache.org/licenses/LICENSE-2.0                             #
#                                                                              #
# Unless required by applicable law or agreed to in writing, software          #
# distributed under the License is distributed on an "AS IS" BASIS,            #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.     #
# See the License for the specific language governing permissions and          #
# limitations under the License.                                               #
################################################################################

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
