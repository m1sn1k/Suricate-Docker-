#! /bin/sh
exec /usr/bin/suricata -c /etc/suricata/suricata.yaml -i enp0s5 --init-errors-fatal &
