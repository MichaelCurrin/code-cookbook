# ReelGood shows

Get shows from the [ReelGood](https://reelgood.com) API. Using `axios` for requests, based on Netlify docs.

This is a simplified form of the Function I created in my [Netflix Assistant](https://github.com/MichaelCurrin/netflix-assistant) project.


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

