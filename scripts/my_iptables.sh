#!/bin/bash
nbdip=$(/usr/local/bin/oc-metadata | grep VOLUMES_0_EXPORT_URI=nbd:// | sed "s/VOLUMES_0_EXPORT_URI=nbd:\/\///" | awk -F ":" '{ print $1 }')

iptables -P INPUT ACCEPT
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -s $nbdip -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    
#--- règles perso ici ----
iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
#-------------------------------

iptables -P INPUT DROP