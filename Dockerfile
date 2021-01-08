FROM alpine:3.12

RUN apk add --no-cache bind; \
mkdir -p /var/lib/bind; \
chown named:named /var/lib/bind; \
mkdir -p /etc/bind; \
chown -R named:named /etc/bind

VOLUME ["/etc/bind", "/var/lib/bind"]

COPY config/named.conf /etc/bind
COPY config/zones/example.lab /etc/bind
COPY config/zones/1.168.192.in-addr.arpa /etc/bind

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named","-f","-g","-4","-u","named"]
