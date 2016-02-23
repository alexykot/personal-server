#!/bin/bash

echo "building debian-base"
docker build --force-rm=true -t "local:debian-base" /opt/server_provision/debian-base/

echo "building letsencrypt"
docker build --force-rm=true -t "local:letsencrypt" /opt/server_provision/letsencrypt/

echo "building nginx"
docker build --force-rm=true -t "local:nginx" /opt/server_provision/nginx/

echo "running letsencrypt"
mkdir -p /opt/server_provision/letsencrypt/tls
docker run -d --name nginx -p 80:80 -p 443:443 -v /opt/server_provision/letsencrypt/tls:/opt/server_provision/letsencrypt/tls local:letsencrypt

echo "running nginx"
docker run -d --name nginx -p 80:80 -p 443:443 -v /var/www/html:/var/www/html local:nginx

