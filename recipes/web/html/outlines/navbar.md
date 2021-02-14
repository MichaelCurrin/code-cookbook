# Navbar


## Samples

### Basic

```html
<nav>
    <a href="/html/">HTML</a> |
    <a href="/css/">CSS</a> |
    <a href="/js/">JavaScript</a> |
    <a href="/jquery/">jQuery</a>
</nav>
```

### Bullet list

See [CSS Navigation Bar](https://www.w3schools.com/Css/css_navbar.asp) guide, which recommends a bullet list for navbar.

```html
<nav>
    <ul>
        <li><a href="default.asp">Home</a></li>
        <li><a href="news.asp">News</a></li>
        <li><a href="contact.asp">Contact</a></li>
        <li><a href="about.asp">About</a></li>
    </ul>
</nav>
```

Styling:

```css
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
```

That removes the bullets and removes browser default spacing.
