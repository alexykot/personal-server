FROM local:debian-base

RUN apt-get -t unstable install -y letsencrypt

COPY letsencrypt-alexykot.me.ini /opt/server_provision/letsencrypt/letsencrypt-alexykot.me.ini
RUN apt-get update && apt-get autoclean && apt-get clean && apt-get autoremove

EXPOSE 80 443

CMD letsencrypt certonly --config /opt/server_provision/letsencrypt/letsencrypt-alexykot.me.ini