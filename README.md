# Suricate-Docker (work on 14/01/2018)

Create image:

docker build -t suricata .

Change config suricata:

docker run -it suricata  bash (Change ip config suricata.yaml)

docker commit 654601e52674(it suricata id) suricata_f

1. Start docker and script(with bash):

docker run --net=host -v /var/log/suricata:/var/log/suricata -it suricata_f  bash

./docker-entrypoint1.sh &

2. Start docker and script:

cd /etc/suricata && wget https://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz && tar xzvf emerging.rules.tar.gz 

docker run --net=host -v /var/log/suricata:/var/log/suricata -t -d --name suricata_f suricata_f

docker exec suricata_f /docker-entrypoint1.sh


