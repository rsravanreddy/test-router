#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

sleep 1
#bash /usr/src/app/src/create_user.sh

# Start sshd if we don't use the init system
if [ "$INITSYSTEM" != "on" ]; then
  /usr/sbin/sshd -p 22 &
fi

#chmod +x /usr/src/app/src/mastiff_ap.sh
#bash /usr/src/app/src/mastiff_ap.sh
chmod +x /usr/src/app/src/create_user.sh
bash /usr/src/app/src/create_user.sh

hostapd /etc/hostapd/hostapd.conf -B

echo "This is where your application would start..."
while : ; do
  echo "waiting"
  sleep 60
done
