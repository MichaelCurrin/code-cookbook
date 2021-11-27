# Redirect

[Article](https://www.w3schools.com/howto/howto_js_redirect_webpage.asp)

## Simulate a mouse click

```javascript
window.location.href = "/";
```

## Simulate an HTTP redirect

```javascript
window.location.replace("/");
```


## Example:

```javascript
function redirectToHome() {
  alert("This is a restriced page and you are not logged in. Please login from the homepage");

  window.location.href = "/";
}
```
