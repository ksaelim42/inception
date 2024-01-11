FROM	debian:bullseye

# nginx
RUN	apt update && apt upgrade -y && \
	apt install -y nginx openssl

# SSL, TSL
RUN	mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes \
	-days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/ksaelim.key \
	-out /etc/nginx/ssl/ksaelim.crt \
	-subj "/C=TH/L=Bangkok/O=42/CN=ksaelim.42.fr"

#debug
RUN	apt install -y vim

RUN	rm -rf /etc/nginx/sites-enabled/default && rm -rf /etc/nginx/sites-available/default

COPY	./conf/nginx.conf ./etc/nginx/conf.d/

EXPOSE	443

CMD	[ "nginx", "-g", "daemon off;" ]
