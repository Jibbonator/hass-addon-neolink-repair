ARG BUILD_FROM
FROM ghcr.io/jibbonator/neolink-fixed:0.6.3 AS source

FROM ${BUILD_FROM}

COPY --from=source /usr/local/bin/neolink /usr/local/bin/neolink
COPY rootfs /
RUN chmod a+x /etc/services.d/neolink/run
