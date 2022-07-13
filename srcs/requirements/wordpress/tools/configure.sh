#!/bin/sh
until mysql --host=$MYSQL_HOST --user=$WP_DATABASE_USR --password=$WP_DATABASE_PWD -e '\c'; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 1
done

cd /var/www/html
wp core download --locale=ko_KR --allow-root
wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm8 -F -R