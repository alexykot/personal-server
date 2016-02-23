FROM local:debian-base

#nginx
RUN echo "deb http://nginx.org/packages/debian/ squeeze nginx\n\ndeb-src http://nginx.org/packages/debian/ squeeze nginx\n\n" > /etc/apt/sources.list.d/nginx.list
RUN curl -sL http://nginx.org/packages/keys/nginx_signing.key | apt-key add - 
RUN apt-get update -qq 
RUN apt-get install -y nginx-full=1.9.10-1 nginx-common=1.9.10-1

COPY alexykot.me.conf /etc/nginx/sites-available/alexykot.me.conf
RUN ln -s /etc/nginx/sites-available/alexykot.me.conf /etc/nginx/sites-enabled/alexykot.me.conf

COPY nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && apt-get autoclean && apt-get clean && apt-get autoremove

EXPOSE 80 443

CMD nginx