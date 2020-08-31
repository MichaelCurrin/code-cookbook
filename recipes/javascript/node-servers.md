# Node.js servers
> Using Node.js for dev servers

There are many ways to start a dev server for Node.js applications. Unfortunately this makes thing complicated to choose and configure it (such as for updating on file edits and hot-reloading the browser). 

Here are some to get you started. 

If you use React or Vue or similar, you might find there's a pattern to use a server that comes with the existing package's CLI.


## HTTP-Server

From [gist](https://gist.github.com/MichaelCurrin/1a6116a4e0918c8468dc7e1a701a5f95).

```sh
$ npm install http-server -g
$ http-server -a localhost
```


## Sirv

```sh
$ npm i --save-dev sirv
$ sirv build --port 8080 --cors --single
```


## Nodemon

The Node demon.

This is a web server with hot reloading (restart app on file changes). I don't know if it also refreshes frontend.

- `package.json`
    ```json
    {
      "scripts": {
        "start": "nodemon server.js"
      }
    }
    ```

```sh
$ npm i nodemon
```


## Express

This requires setting up a script in your repo.

- `server.js`
    ```javascript
    const express = require("express");
    const path = require("path");

    const app = express();

    app.use("/static", express.static(path.resolve(__dirname, "frontend", "static")));

    app.get("/*", (req, res) => {
        res.sendFile(path.resolve(__dirname, "frontend", "index.html"));
    });

    app.listen(process.env.PORT || 3000, () => console.log("Server running..."));
    ```
- `package.json`
    ```json
    {
      "scripts" {
        "start": "node server.js"
      }
    }
    ```

Run with:

```sh
$ npm start
```
