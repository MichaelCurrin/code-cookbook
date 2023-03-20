---
title: HTML5 Boilerplate
description: A more thorough `head` tag to cover modern browsers and sharing
---

See the HTML5 Boilerplate website - [html5boilerplate.com](https://html5boilerplate.com/).

The page below is based on [dist/index.html](https://github.com/h5bp/html5-boilerplate/blob/master/dist/index.html) of the `html5-boilerplate` repo.

- `index.html`
    ```html
    <!DOCTYPE html>
    <html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <title>My title</title>
        <meta name="description" content="My description">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta property="og:title" content="My title">
        <meta property="og:type" content="">
        <meta property="og:url" content="">
        <meta property="og:image" content="">

        <link rel="manifest" href="site.webmanifest">
        <link rel="apple-touch-icon" href="icon.png">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/style.css">

        <meta name="theme-color" content="#fafafa">
    </head>

    <body>
    </body>

    </html>
    ```


## Notes

- Place `favicon.ico` in the root directory. Can be picked up without a tag here, though some recommend to be explicit. See my [Favicon](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/web/html/favicon.html) cheatsheet.
- Assets are in [dist](https://github.com/h5bp/html5-boilerplate/tree/master/dist). See [dist/css](https://github.com/h5bp/html5-boilerplate/tree/master/dist/css).
- See also [Normalize.css](https://necolas.github.io/normalize.css/) homepage.
- See the [OG](https://ogp.me/) homepage for og tags.


## Extended

Here is the above with suggestions added by ChatGPT.

```html
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <title>My title</title>
    <meta name="description" content="My description">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="My author">
    <meta name="application-name" content="My application name">
    <meta name="application-version" content="My application version">
    <meta property="og:title" content="My title">
    <meta property="og:type" content="">
    <meta property="og:url" content="">
    <meta property="og:image" content="">

    <link rel="manifest" href="site.webmanifest">
    <link rel="apple-touch-icon" href="icon.png">
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/webfont.css">
    <link rel="stylesheet" href="css/customfont.css">

    <script src="js/script.js"></script>

    <meta name="theme-color" content="#fafafa">
    <meta name="language" content="english">
    <meta name="copyright" content="My copyright">
    <script type="application/ld+json">
    {
      "@context": "http://schema.org",
      "@type": "WebPage",
      "name": "My title",
      "url": ""
    }
    </script>
</head>

<body>
</body>

</html>
```
