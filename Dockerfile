FROM ubuntu

RUN apt-get update -y && apt-get install --assume-yes apt-utils libpcre3-dbg libpcre3-dev autoconf automake libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libmagic-dev libjansson-dev libjansson4 wget nano libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev net-tools  ethtool unzip -y  

RUN wget https://www.openinfosecfoundation.org/download/suricata-3.1.2.tar.gz  && tar -xvf suricata-3.1.2.tar.gz && cd suricata-3.1.2 &&  ./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var && make && make install && make install-conf && make install-rules 

RUN /usr/bin/suricata --list-runmodes

RUN /usr/bin/suricata -V

RUN echo 'alert icmp any any -> $HOME_NET any (msg:"PING ATTACK"; sid:10000001; rev:001;)' >>  /etc/suricata/rules/tls-events.rules

RUN chmod 755 /var/log/suricata

COPY /docker-entrypoint1.sh /

RUN ["chmod", "755", "/docker-entrypoint1.sh"]

VOLUME /var/log/suricata

#ENTRYPOINT ["/docker-entrypoint1.sh &"]
