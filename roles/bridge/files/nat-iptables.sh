#!/bin/sh

PATH="/sbin"
PUBLIC="wlan0"
PRIVATE="eth0"

# Flush any existing tables
iptables -F

# Setup masquerading NAT
iptables -t nat -A POSTROUTING -o "$PUBLIC" -j MASQUERADE  
iptables -A FORWARD -i "$PUBLIC" -o "$PRIVATE" -m state --state RELATED,ESTABLISHED -j ACCEPT  
iptables -A FORWARD -i "$PRIVATE" -o "$PUBLIC" -j ACCEPT
