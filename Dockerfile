FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xorg \
    xserver-xorg-core \
    xserver-xorg-video-dummy \
    dbus \
    dbus-x11 \
    wget \
    curl \
    ca-certificates \
    gnupg \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY \
       -o /etc/apt/keyrings/keys.anydesk.com.asc \
    && chmod a+r /etc/apt/keyrings/keys.anydesk.com.asc \
    && echo "deb [signed-by=/etc/apt/keyrings/keys.anydesk.com.asc] https://deb.anydesk.com all main" \
       > /etc/apt/sources.list.d/anydesk.list \
    && apt-get update \
    && apt-get install -y anydesk \
    && rm -rf /var/lib/apt/lists/*

COPY xorg.conf /etc/X11/xorg.conf

COPY start-desktop.sh /usr/local/bin/start-desktop

RUN chmod +x /usr/local/bin/start-desktop
