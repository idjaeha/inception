FROM alpine:3.15.0

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]