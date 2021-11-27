# ReelGood shows

Get shows from the [ReelGood](https://reelgood.com) API. Using `axios` for requests, based on Netlify docs.

This is a simplified form of the Function I created in my [Netflix Assistant](https://github.com/MichaelCurrin/netflix-assistant) project.

It has [shows.js](https://github.com/MichaelCurrin/netflix-assistant/blob/master/functions/shows.js) using Node. This is a wrapper on an API which blocks cross domain requests from a browser but allows server side (or serverless) requests fine. Note the Netlify config in the root specifies `functions` as the directory instead of `.netlify/functions`.


## Files

<!-- Something is weird in Jekyll if trying to indent this script under a bullet point -->

`netlify/functions/shows/shows.js`

```javascript
const axios = require("axios");

const API_BASE_URL = "https://api.reelgood.com/v2";

exports.handler = async function(event) {
  const url = event.queryStringParameters.url;

  return {
    statusCode: res.status,
    body: JSON.stringify(res.data)
  };
};
```
    
`package.json`

```json
{
  "dependencies": {
    "axios": "^0.21.1"
  }
}
```

