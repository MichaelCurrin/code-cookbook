# Basic

## Files

Create these files then push to trigger a Netlify build.

- `netlify.toml`. The build command must be set - the docs recommend a comment if you have nothing else.
    ```toml
    [build]
      functions = "functions"
      command = "#"
    ```
- `functions/hello.js`. (Or at `functions/hello/index.js` Or `functions/hello/hello.js`.)
    ```javascript
    exports.handler = async function (event, context) {
        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Hello World" })
        };
    }
    ```

## Testing

Then when deployed you query the Lambda at a path like `/.netlify/functions/hello`.

- `https://example.netlify.com/.netlify/functions/hello`
    ```json
    {"message": "Hello World"}
    ```

Breakdown of the URL:

- `/.netlify` - this is fixed.
- `functions` is the directory you configured and used above.
- `hello` is based on the JS script name.

