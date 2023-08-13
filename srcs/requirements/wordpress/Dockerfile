FROM debian:buster
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/wordpress && \
	chmod -R 700 /var/www/wordpress
RUN apt update && apt upgrade -y && apt install -y \
	wget php7.3 php7.3-fpm php7.3-mysql curl mariadb-client && apt-get clean

COPY /conf/mdb_client.cnf /etc/mysql/my.cnf

# COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY conf/configure-wordpress.sh usr/local/bin/configure-wordpress.sh
RUN chmod +x usr/local/bin/configure-wordpress.sh
EXPOSE 9000

ENTRYPOINT ["configure-wordpress.sh"]
