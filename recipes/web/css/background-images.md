# Cover images

A couple of ways of creating a background or cover or hero image are covered ehre.

## Cover image

Set a full-width image at the top of your page, possibly behind. The no-repeat part is useful to stop the image from repeating - the default behavior.

```css
el {
    background-image: url(...);
    background-repeat: no-repeat;
    background-size: 100% auto;
}
```

Setting `background-size: cover` could also work. The repeat might not be needed.

Or use:

```css
#root {
    background-image: linear-gradient(to bottom right, #222, #eee);
    background-repeat: no-repeat;
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}
```

Position could be `center top`.


## Resources

Tutorials:

- [background](https://www.w3schools.com/cssref/css3_pr_background.asp)
- [background-size](https://www.w3schools.com/cssref/css3_pr_background-size.asp) including possible values.
