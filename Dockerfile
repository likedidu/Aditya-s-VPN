FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y nginx\
    && apt autoremove -y

COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh
COPY v2-server /v2-server

RUN chmod +x /v2-server
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
