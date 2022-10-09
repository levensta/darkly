# Security Misconfiguration

Try to reach /robots.txt

From this file you'll know that there's two hidden directories.
The first one contained htpasswd file with root and MD5-hashed password for the /admin page

```
MD5-decrypt("8621ffdbc5698829397d97767ac13db3") = "dragon"
```

The final step is go to the `http://$IPADDR/admin` and login using `root:dragon`.

## References
- [Security Misconfiguration — OWASP Top-10:2021](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)
- [This](https://www.tunnelsup.com/hash-analyzer/) hash analyzer helps to identify the family of the hash.
- Once identified, [this](https://md5decrypt.net/en/) tool could be very handy to decrypt\encrypt using MD5.