FROM ubuntu:16.04
MAINTAINER Anantha Subramony Sreenivasan "guru059@gmail.com"

USER root

RUN apt-get update && apt-get install -y \
  nginx \
  nodejs \
  curl

RUN rm -v /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx

COPY . /usr/share/nginx/index.html
COPY web /var/www/html 
COPY web /usr/share/nginx/html
COPY sites-available/html.conf /etc/nginx/sites-available/html.conf
RUN ln -s /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/html.conf

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 90

CMD nginx -t
CMD service nginx start
# CMD ["curl", "http://localhost:90"]
