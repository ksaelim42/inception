FROM	debian:bullseye

# Package Install
RUN	apt update && apt upgrade -y && \
	apt install -y wget php php-fpm php-mysql mariadb-client

# Wordpress Install
RUN	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
	mkdir -p /var/www/html && \
	tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html/ && \
	chown -R www-data:www-data /var/www/html/wordpress && \
	chmod -R 755 /var/www/html/wordpress

# Wordpress-CLI Install
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
		&& chmod +x wp-cli.phar\
		&& mv wp-cli.phar /usr/local/bin/wp

# debug
RUN	apt install -y vim

COPY	./conf/www.conf ./etc/php/7.4/fpm/pool.d/

EXPOSE	9000

COPY	./tools/wordpress.sh /home/

RUN		chmod +x /home/wordpress.sh

RUN		service php7.4-fpm start

ENTRYPOINT [ "/home/wordpress.sh" ]

CMD	[ "/usr/sbin/php-fpm7.4", "-F" ]
