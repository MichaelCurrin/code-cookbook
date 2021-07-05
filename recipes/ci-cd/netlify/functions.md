# Functions


## Sample

### Files

Create these files then push to trigger a Netlify build.

- `netlify.toml`. The build command must be set - the docs recommend a comment if you have nothing else.
    ```toml
    [build]
      functions = "functions"
      command = "#"
    ```
- `functions/hello.js`. Or at `functions/hello/index.js` Or `functions/hello/hello.js`.
    ```javascript
    exports.handler = async function (event, context) {
        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Hello World" })
        };
    }
    ```

### Testing

Then when deployed you query the Lambda at a path like `/.netlify/functions/hello`.

- https://example.netlify.com/.netlify/functions/hello
    ```json
    {"message":"Hello World"}
    ```

Breakdown of the URL:

- `/.netlify` - this is fixed.
- `functions` is the directory you configured and used above.
- `hello` is based on the JS script name.


## Resources

Netlify Functions in the docs:

- [Overview](https://docs.netlify.com/functions/overview/)
- [Configure and deploy Functions](https://docs.netlify.com/functions/configure-and-deploy/)
- [Build with JavaScript](https://docs.netlify.com/functions/build-with-javascript/)

Netlify Functions site

- [functions.netlify.com](https://functions.netlify.com/)
- [Function Examples](https://functions.netlify.com/examples/)


## Limitations

> By default, all serverless functions are deployed with:
>
> - us-east-1 AWS Lambda region
> - 1024MB of memory
> - 10 second execution limit


## Cache

Add caching to a Function.

```javascript
const result = {
  statusCode: res.status,
  body: JSON.stringify(res.data),
  headers: { "Cache-Control": "public, s-maxage=1800" },
}
```
