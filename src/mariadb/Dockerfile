FROM	debian:bullseye

# Package Install
RUN	apt update && apt upgrade -y

# Mariadb Install
RUN	apt install -y mariadb-server

# debug
RUN     apt install -y vim

COPY    ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY    ./scripts/mariadb.sh /usr/local/bin/

RUN     chmod +x /usr/local/bin/mariadb.sh

RUN     mkdir -p /var/run/mysqld && \
        chmod -R 777 /var/run/mysqld

EXPOSE	3306

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD     [ "mysqld" ]
