#!/bin/bash

IPADDR=192.168.64.4

# curl --user-agent 'ft_bornToSec'\
#      --referer 'https://www.nsa.gov/'\
# "http://$IPADDR/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c" > index.html

wget --user-agent='ft_bornToSec' \
     --referer 'https://www.nsa.gov/' \
     --output-document='./index.html' \
"http://$IPADDR/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"