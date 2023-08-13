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

sleep 5 
echo "===WordPress Script==="
if wp core is-installed --path="${WP_PATH}" --allow-root --quiet; then
    echo "WordPress is already configured."
else
    if mysqladmin ping -h "$HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; then 
		echo "Start config."
		echo "===wp core download==="
		wp core download --path="${WP_PATH}" --allow-root
		echo "===wp config create==="
		wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" \
			--dbpass="${MYSQL_PASSWORD}" --dbhost="${HOST}" \
			--path="${WP_PATH}" --allow-root
		echo "===wp db create==="
		wp db create --path="${WP_PATH}" --allow-root
		echo "===wp core install==="
		wp core install --url=localhost --title="My Inception Site" \
			--admin_user="${WP_USER}" --admin_password="${WP_PASS}" \
			--admin_email="${EMAIL1}" --path="${WP_PATH}" --allow-root
		echo "===wp user create==="
		wp user create "${WP_USER2}" "${EMAIL2}" \
			--role=subscriber --user_pass="${WP_PASS2}" \
			--path="${WP_PATH}" --allow-root

		echo "===WordPress is now configured.==="
	else
		echo "===WordPress config failed.==="
		exit 113
	fi
fi
php-fpm7.3 -F
