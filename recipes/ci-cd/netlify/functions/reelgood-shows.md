# ReelGood shows

Get shows from the [ReelGood](https://reelgood.com) API.

Using `axios` for requests.

This is based on a Function I created in my [Netflix](https://github.com/MichaelCurrin/netflix-assistant/tree/master/functions) project.

- `netlify/functions/shows/shows.js`
    ```javascript
    /**
     * Shows Function.
     *
     * Note use of cache of computed data, to improve performance and
     * reduce the number of hitss down against the external API we are consuming.
     */
    const axios = require("axios");

    const API_BASE_URL = "https://api.reelgood.com/v2";

    exports.handler = async function(event) {
      const url = event.queryStringParameters.url;

      if (!url) {
        return {
          statusCode: 400,
          body: "Missing param: 'url'",
        };
      }

      if (!API_BASE_URL.startsWith(API_BASE_URL)) {
        return {
          statusCode: 400,
          body: `Domain not allowed - only: ${API_BASE_URL}`,
        };
      }

      const res = await axios.get(url);

      return {
        statusCode: res.status,
        body: JSON.stringify(res.data),
        headers: { "Cache-Control": "public, s-maxage=1800" },
      };
    };
    ```
- `package.json`
    ```json
    {
      "dependencies": {
        "axios": "^0.21.1"
      }
    }
    ```
    
