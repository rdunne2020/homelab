#!/bin/bash

usage() { echo "Usage: $0 [-h] [-v]" 1>&2; exit 0; }

VERBOSE=false
INTERFACE=eth0
while getopts ":hvi:" o; do
    case "${o}" in
        v)
            VERBOSE=true
            ;;
        i)
            INTERFACE="${OPTARG}"
            ;;
        h)
            usage
            ;;
        *)
            usage
            ;;
    esac
done

echo "|----------------------------|"
echo "|--------Raspberry PI--------|"
echo "|----------------------------|"

# Check EUID to account for SetUID with sudo
if [[ $EUID != 0 ]]; then
    echo "ERROR: To install these files you must be root. Exiting."
    exit 1
fi

pi_ip=$(ip a show "$INTERFACE" | grep -Eo "inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | cut -d ' ' -f 2)

echo "rules.v4 ---> /etc/iptables/rules.v4"
sleep 1
mkdir -p /etc/iptables
sed "s#%RASPBERRY_PI_IP%#${pi_ip}#" ./files/rules.v4 > /etc/iptables/rules.v4
[[ "$VERBOSE" = "true" ]] && cat /etc/iptables/rules.v4
iptables-restore /etc/iptables/rules.v4
[[ "$VERBOSE" = true ]] && iptables -t nat -L -v -n --line-numbers
sleep 1
echo "Complete"

