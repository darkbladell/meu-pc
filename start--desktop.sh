#!/bin/bash

export DISPLAY=:0

sudo mkdir -p /run/dbus

sudo dbus-daemon --system --fork 2>/dev/null || true

sudo Xorg :0 \
    -config /etc/X11/xorg.conf \
    -noreset \
    -nolisten tcp \
    >/tmp/xorg.log 2>&1 &

sleep 4

startxfce4 >/tmp/xfce.log 2>&1 &

sleep 6

echo ""
echo "================================"
echo "      LINUX DESKTOP INICIADO"
echo "================================"
echo ""

echo "AnyDesk:"
anydesk --version

echo ""
echo "ID do AnyDesk:"
anydesk --get-id || true

echo ""
echo "Status:"
anydesk --get-status || true

echo ""
echo "Display: :0"
echo "Resolucao: 1280x720"
echo ""
