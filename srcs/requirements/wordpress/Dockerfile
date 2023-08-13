FROM debian:buster
ENV DEBIAN_FRONTEND=noninteractive

RUN addgroup --gid 1000 mygroup
RUN adduser --disabled-password --gecos "" --uid 1000 --ingroup mygroup myuser

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/html/ && \
	chown -R myuser:mygroup /var/www/html/ && \
	chmod -R 700 /var/www/html
RUN apt update && apt upgrade -y

RUN apt install -y wget php7.3 php7.3-fpm php7.3-mysql curl mariadb-client && apt-get clean

COPY /conf/mdb_client.cnf /etc/mysql/my.cnf

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY conf/configure-wordpress.sh /usr/local/bin/configure-wordpress.sh
RUN chmod +x /usr/local/bin/configure-wordpress.sh

EXPOSE 9000

# CMD [ "php-fpm7.3", "-F" ]
