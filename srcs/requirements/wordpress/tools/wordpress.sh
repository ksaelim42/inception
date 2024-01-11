#!/bin/bash

if [ ! -e "/var/www/html/wordpress/wp-config.php" ]
then
	cd /var/www/html/wordpress
	cp wp-config-sample.php wp-config.php

	# Init Wordpress Databases
	sed -i "s/database_name_here/${DB_NAME}/g" wp-config.php
	sed -i "s/username_here/${DB_USER}/g" wp-config.php
	sed -i "s/password_here/${DB_PASSWORD}/g" wp-config.php
	sed -i "s/localhost/${DB_HOSTNAME}/g" wp-config.php

	# Certain for MariaDB has had time to launch correctly.
	sleep 10
	wp core install --url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${ADMIN_USER} \
		--admin_password=${ADMIN_PASS} \
		--admin_email=${ADMIN_EMAIL} --allow-root
	wp user create ${USER_USER} ${USER_EMAIL} --user_pass=${USER_PASS} --allow-root
fi

# run cmd in dockerfile 
exec "$@"