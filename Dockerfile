FROM alpine:latest
LABEL maintainer="Habil <habil@arkadiacorp.com>"

RUN apk add --update nginx && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /tmp/ngix/

COPY files/nginx.conf /etc/nginx/nginx.con
COPY files/default.conf /etc/nginx/conf.d/default.conf
ADD files/html.tar.gz /usr/share/nginx/

EXPOSE 80/tcp

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
