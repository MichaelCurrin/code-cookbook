---
title: Basic
description: Setup minimum values
---


## Template

- `index.html`
    ```html
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>My Title</title>
        <meta name="description" content="My description">

        <link rel="stylesheet" href="styles.css">

        <script defer src="main.js"></script>
    </head>

    <body>
    </body>

    </html>
    ```


## Notes

- See info on the `html` tag's [lang](https://www.w3schools.com/tags/att_lang.asp) attribute.
- The character encoding set by `char` must appear as **early** as possible in `head` such as first. You'll get a browser warning if you omit it.
- No visible content yet.
- It has basic metadata and language settings.
- CSS and JS assets are setup.
- JS script tag.
    - Loading JS using `defer` attributes means it will get loaded **after** the body, even though it is setup in the `head`. You could take out `defer` attribute and put the `script` tag in the `body` rather.
    - Scripts setup with `defer` will load in a predictable order.
    - You could use `async` instead if you had something which can be loaded independently of the body (either before or after it) and independently of the other resources.
