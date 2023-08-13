#!/bin/bash
      # WP_DB_HOST: mariadb
      # WP_DB_PATH: ${WP_PATH}
      # WP_DB_NAME: ${WP_NAME}
      # WP_DB_USER: ${WP_USER}
      # WP_DB_PASS: ${WP_PASS}
      # WP_DB_USER2: ${WP_USER2}
      # WP_DB_PASS2: ${WP_PASS2}
      # MYSQL_ROOT_PASSWORD: ${SQL_RPASS}
      # MYSQL_PASSWORD: ${SQL_PASS}
      # MYSQL_DATABASE: ${SQL_DB}
      # MYSQL_USER: ${SQL_USER}

HOST="mariadb"

if wp core is-installed --allow-root; then
    echo "WordPress is already configured."
else
    until mysqladmin ping -h "$HOST" -u"$WP_DB_USER" -p"$WP_DB_PASS" --silent; do
        echo "Waiting for MariaDB to be ready..."
        sleep 2
    done
    wp core download --allow-root
    wp config create --dbname="$WP_DB_NAME" --dbuser="$WP_DB_USER" \
		--dbpass="$WP_DB_PASS" --dbhost="$HOST" --allow-root
    wp db create --allow-root
    wp core install --url=localhost --title="My Inception Site" \
		--admin_user="$WP_DB_USER" --admin_password="$WP_DB_PASS" \
		--admin_email="$WP_DB_USER@example.com" --allow-root
    wp user create "$WP_DB_USER2" "$WP_DB_USER2@example.com" \
        --role=subscriber --user_pass="$WP_DB_PASS2" --allow-root

    echo "WordPress is now configured."
fi
php-fpm7.3
