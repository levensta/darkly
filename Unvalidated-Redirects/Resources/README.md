# Unvalidated Redirects and Forwards

There are 3 link to social network pages at the bottom of each page.
```html
<a href="index.php?page=redirect&amp;site=facebook" class="icon fa-facebook"></a>
```
The href inside them has site parameter.

To exploit, change this parameter to some untrusted resource.

## References
- [Unvalidated Redirects and Forwards Cheatsheet — OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html)
- [CWE-601: URL Redirection to Untrusted Site ('Open Redirect')](https://cwe.mitre.org/data/definitions/601.html)