# Sticky
> How to make your elements sticky

### Navigation bar

A full-width navbar that sticks to the top of the page when you scroll.

```css
nav.navbar {
  position: fixed;
  top: 0;
  width: 100%;
}
```

Here is another way usning `sticky`.

```css
.site-header {
  position: sticky;
  top: 0px;
  z-index: 1;

  background: white;

  box-shadow: 0px 5px 10px -1px rgba(0, 0, 0, 0.2);
  -webkit-box-shadow: 0px 5px 10px -1px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0px 5px 10px -1px rgba(0, 0, 0, 0.2);
}
```

See also [Bulma navbar](https://bulma.io/documentation/components/navbar/) documentation.

### Footer

If your footer is tall, it might not look good fixed to the bottom of the screen especially on mobile.

Note that if your footer is not actually navbar, you cannot use the Bulma navbar above. Here is an approach.

```css
footer {
  position: fixed;
  bottom: 0;
  width: 100%;
}
```

See more approaches in this [Bulma issue](https://github.com/jgthms/bulma/issues/47).

Also see [StackOverflow](https://stackoverflow.com/questions/643879/css-to-make-html-page-footer-stay-at-bottom-of-the-page-with-a-minimum-height-b)

```css
footer {
    margin-top: auto;
    min-height: 20px;
    padding: 10px;
}
```
