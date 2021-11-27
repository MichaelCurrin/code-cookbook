# TV Maze shows

Get shows from the TV Maze API. 

Based on a Serverless JWT example [here](https://github.com/sandrinodimattia/serverless-jwt/blob/master/examples/gatsby-auth0-netlify-functions/netlify/functions/shows/shows.js).

Here is my refactored [shows.js](https://github.com/MichaelCurrin/netlify-auth-quickstart/blob/main/netlify/functions/shows/shows.js) in my demo project.

The data here is not sensitive, but JWT auth is used here to demonstrate the concept.

Using `node-fetch` for requests.

- `netlify/functions/shows/shows.js`
    ```javascript
    /**
     * Get shows from the TV maze API.
     */
    const fetch = require("node-fetch");
    const { requireScope } = require("../../lib/auth");

    const SHOWS_SERVICE_URL = "https://api.tvmaze.com/shows";
    const SCOPE = "read:shows";

    async function request(url) {
      const resp = await fetch(url);
      const shows = await resp.json();

      return shows.map((s) => ({
        id: s.id,
        url: s.url,
        name: s.name,
      }));
    }

    async function shows(_event, _context) {
      let statusCode = 200;
      let payload;

      try {
        payload = await request(SHOWS_SERVICE_URL);
      } catch (err) {
        payload = { error_description: err.message };
        statusCode = 500;
      }

      return {
        statusCode,
        body: JSON.stringify(payload),
      };
    }

    exports.handler = requireScope(SCOPE, shows);
    ```
- `package.json`
    ```json
    {
      "name": "netlify-auth-quickstart",
      "dependencies": {
        "@serverless-jwt/netlify": "0.1.8",
        "node-fetch": "^2.6.1"
      }
    }
    ```
