#!/bin/bash

docker build --force-rm=true -t "local:debian-base" ~/server_provision/debian-base/
docker build --force-rm=true -t "local:nginx" ~/server_provision/nginx/

docker run -d --name nginx -p 80:80 -p 443:443 -v /var/www/html:/var/www/html local:nginx
