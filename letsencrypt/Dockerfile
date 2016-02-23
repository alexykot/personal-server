FROM local:debian-base

RUN apt-get -t unstable install -y letsencrypt

COPY nginx.conf /etc/nginx/nginx.conf
RUN apt-get update && apt-get autoclean && apt-get clean && apt-get autoremove

EXPOSE 80 443

CMD nginx