FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get install -y linux-source
COPY build.sh /build.sh
COPY query.sh /query.sh
COPY config-fragment /config-fragment
CMD ["/query.sh"]