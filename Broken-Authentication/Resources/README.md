# Broken Authentication

There are several problems with the cookies on the site:
- Missing flag `HTTP-only`, that prevents reading cookies from the JavaScript.
- Missing flag `Secure`.
- The app is not using `https`, but `http` that makes the app vulnerable to MITM attacks.
- The name of the cookie related with its role in the app.
- The value encrypted using MD5, which is insecure and could be easily decrypted.

Here is the pair of the cookie:
```
I_am_admin=68934a3e9455fa72420237eb05902327
```

Let's decrypt it:
```
MD5-decrypt("68934a3e9455fa72420237eb05902327") = false
```
As we can see, decrypted hash is a boolean value `false`.

To exploit this vulnerability, change the cookie with MD5-encrypted value of `true`:
```
MD5-encrypt("true") = "b326b5062b2f0e69046810717534cb09"
```

## References
- [Identification and Authentication Failures — OWASP Top 10:2021](https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/)
- [Session hijacking attack — OWASP](https://owasp.org/www-community/attacks/Session_hijacking_attack)
- [CWE-1004: Sensitive Cookie Without 'HttpOnly' Flag
](https://cwe.mitre.org/data/definitions/1004.html)
- [Man-in-the-middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)
- [Cryptographic Failures — OWASP TOP 10:2021](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/)
- [Cryptographic Storage Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html)
- [This](https://www.tunnelsup.com/hash-analyzer/) hash analyzer helps to identify the family of the hash.
- Once identified, [this](https://md5decrypt.net/en/) tool could be very handy to decrypt\encrypt using MD5.