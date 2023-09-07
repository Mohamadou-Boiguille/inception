FROM debian:buster-slim

RUN apt-get update && apt-get upgrade && apt-get install -y openssl nginx-light \
	&& mkdir -p /etc/nginx/ssl \
	&& apt-get install --only-upgrade openssl \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=Ecole 42/OU=moboigui/CN=moboigui"

COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN chmod -R 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
