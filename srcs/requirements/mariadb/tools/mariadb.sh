#!/bin/bash

service mariadb start

if [ ! -d "/var/lib/mysql/$DB_NAME" ]
then
	# Secure Databases
	echo -e "\nY\nY\n$DB_ROOT\n$DB_ROOT\nY\nY\nY\nY" | mysql_secure_installation

	# Init Databases
	mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
	mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mariadb -e "FLUSH PRIVILEGES;"
fi

service mariadb stop

exec "$@"
