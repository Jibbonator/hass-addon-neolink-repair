FROM ghcr.io/home-assistant/amd64-base-debian:bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
    jq \
    libgstreamer1.0-0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

ARG NEOLINK_VERSION=0.6.2

RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ASSET="neolink_linux_x86_64_ubuntu.zip"; \
    elif [ "$ARCH" = "aarch64" ]; then ASSET="neolink_linux_arm64.zip"; \
    else echo "Unsupported arch: $ARCH" && exit 1; fi && \
    curl -fsSL "https://github.com/QuantumEntangledAndy/neolink/releases/download/v${NEOLINK_VERSION}/${ASSET}" \
    -o /tmp/neolink.zip && \
    unzip /tmp/neolink.zip neolink -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/neolink && \
    rm /tmp/neolink.zip

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
