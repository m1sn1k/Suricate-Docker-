#! /bin/sh
exec /usr/bin/suricata -c /etc/suricata/suricata.yaml -i eth0 --init-errors-fatal &
