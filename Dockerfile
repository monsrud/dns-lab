FROM alpine:3.12

RUN apk add --no-cache bind

VOLUME ["/etc/bind", "/var/lib/bind"]

COPY config/named.conf /etc/bind
COPY config/example.com /etc/bind
COPY config/1.168.192.in-addr.arpa /etc/bind

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named","-f","-g","-4"]
