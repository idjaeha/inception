FROM alpine:3.15

RUN	apk update && \
        apk upgrade && \
        apk add --no-cache \
        nginx \
        openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/jayi.pem \
        -keyout /etc/nginx/ssl/jayi.key \
        -subj "/C=IT/ST=Rome/L=Rome/O=42 School/OU=jayi/CN=jayi/"

EXPOSE 443

# nginx config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/http.d/default.conf
COPY tools/configure.sh /tmp/nginx_configure.sh

# # Start nginx
ENTRYPOINT ["sh", "/tmp/nginx_configure.sh"]
