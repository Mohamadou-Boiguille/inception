#!/bin/bash
wait_for_mariadb() {
    while ! mysqladmin ping -h "mariadb" -u"root" -p"$SQL_RPASS"; do
        sleep 5
    done
}
wait_for_mariadb
echo "===WordPress Script==="
if wp-cli.phar core is-installed --path="${WP_PATH}" --allow-root --quiet; then
    echo "WordPress is already configured."
else
	echo "Start config."
	echo "===wp-cli.phar core download==="
	wp-cli.phar core download --path="${WP_PATH}" --allow-root
	echo "===wp-cli.phar config create==="
	wp-cli.phar config create --dbname="${SQL_DB}" --dbuser="${SQL_USER}" \
		 --dbhost="mariadb" --dbpass="${SQL_PASS}"\
		--path="${WP_PATH}" --allow-root
	echo "===wp-cli.phar core install==="
	wp-cli.phar core install --url="${DOMAIN_NAME}" --title="My Inception Site" \
		--admin_user="${WP_USER}" --admin_password="${WP_PASS}" \
		--admin_email="${EMAIL1}" --path="${WP_PATH}" --allow-root
	echo "===wp-cli.phar user create==="
	wp-cli.phar user create "${WP_USER2}" "${EMAIL2}" \
		--role=subscriber --user_pass="${WP_PASS2}" \
		--path="${WP_PATH}" --allow-root
	echo "===WordPress is now configured.==="
fi
cat << EOF > /var/www/wordpress/phpinfo.php
<?php
phpinfo();
?>
EOF
php-fpm7.3 -F
