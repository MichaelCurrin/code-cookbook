# Functions


### Cache

Add caching to a Function.

```javascript
const result = {
  statusCode: res.status,
  body: JSON.stringify(res.data),
  headers: { "Cache-Control": "public, s-maxage=1800" },
}
```
