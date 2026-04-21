FROM ghcr.io/jibbonator/neolink-fixed:0.6.3 AS source

FROM ghcr.io/home-assistant/amd64-base-debian:bookworm

COPY --from=source /usr/local/bin/neolink /usr/local/bin/neolink
COPY rootfs /
RUN chmod a+x /etc/services.d/neolink/run
