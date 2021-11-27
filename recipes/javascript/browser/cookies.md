# Cookies


## Read cookies

Here we convert a single string from `document.cookie` into an object of key-value pairs, aka a "hash" or "map".

Note we split on semicolon and space together.

```javascript
function getCookies() {
  const decodedCookie = decodeURIComponent(document.cookie);
  const cookiesArray = decodedCookie.split('; ')
    .map(v => v.split('='));

  const cookiesHash = {}
  for (const [k, v] of cookiesArray) {
      cookiesHash[k] = v
  }
  
  return cookiesHash
}
```

Example of use:

```javascript
// Set up of storage.
document.cookie = "__Foo-3PAPISID=mrva0w;SameSite=True;Path=/"
document.cookie = "Bazz=jwgwqfkwf;SameSite=True;Path=/"
document.cookie = "my_cookie=abcdef123;SameSite=True;Path=/"

document.cookie
// "__Foo-3PAPISID=mrva0w; Bazz=jwgwqfkwf; my_cookie=abcdef123"

// Retrieval.
const cookies = getCookies()
const myCookie = cookies["my_cookie"]
// abcdef123
```

If you prefer a Functional Programming style, you can use `reduce` to build `cookiesHash` in `getCookies`.

If you want to be more efficient, you could pass your cookie name to your function and return as soon as the cookie is found, or use some find or regex approach to get just your cookie.

```javascript
const myCookie = decodedCookie.split('; ')
  .filter(v => v.startsWith("my_cookie="
```
