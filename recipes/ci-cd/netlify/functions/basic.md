---
title: Basic
description: A greeting example of using Netlify Functions
---


## Function setup

Create these files then push to trigger a Netlify build.

- `netlify.toml`. The build command must be set - the docs recommend a comment if you have nothing else.
    ```toml
    [build]
      functions = "functions"
      command = "#"
    ```
- `functions/hello.js`. (Or at `functions/hello/index.js` Or `functions/hello/hello.js`.)
    ```javascript
    exports.handler = function (event) {
        const respData = {
          message: "Hello World"
          eventData: event
        }
        
        return {
            statusCode: 200,
            body: JSON.stringify(respData)
        };
    }
    ```

Use query parameters like `?myParam=foo`.

```javascript
const myParam = event.queryStringParameters.myParam;
```


## Testing

Then when deployed you query the Lambda at a path like `/.netlify/functions/hello`.

- `https://example.netlify.com/.netlify/functions/hello`
    ```json
    {"message": "Hello World"}
    ```

Breakdown of the URL:

- `/.netlify/functions` - this is a fixed path and cannot be configured.
- `hello` is based on the JS script name.

