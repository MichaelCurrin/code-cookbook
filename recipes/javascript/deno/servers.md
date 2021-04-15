---
description: Basic web servers with Deno
---
# Servers


Run the examples below using network permissions allowed.

```sh
$ deno run --allow-net server.ts
```

Note the flag must be _before_ the path, not at the end.


## Using http module

Using the [serve](https://deno.land/std@0.86.0/http/server.ts) function from the `http` module of the standard lib.

From [post](https://medium.com/@nikhilsharmarockstar21/getting-started-with-deno-js-fa2154f8657e).

- `server.ts`
    ```typescript
    import { serve } from "https://deno.land/std@0.58.0/http/server.ts";

    const APP_PORT = 8000;

    const s = serve({ port: APP_PORT });
    console.log(`http://localhost:${APP_PORT}/`);

    for await (const req of s) {
      req.respond({ body: "Hello, world\n" });
    }
    ```


## Using Oak module

Using the [oak](https://deno.land/x/oak) package.

Web server with routing - we add a `/users` endpoint.

- `config.ts`
    ```typescript
    const APP_HOST = 'http://localhost',
      APP_PORT = 8000;
    ```
- `server.ts`
    ```typescript
    import { Application } from "https://deno.land/x/oak/mod.ts";

    import { APP_HOST, APP_PORT } from "./config.ts";
    import router from "./routing.ts";

    const app = new Application();

    app.use(router.routes());
    app.use(router.allowedMethods());

    console.log(`Listening on ${APP_PORT}...`);

    await app.listen(`${APP_HOST}:${APP_PORT}`);
    ```
- `routing.ts` - note that `db.ts` and `user.ts` need to be defined too.
    ```typescript
    import { Router } from "https://deno.land/x/oak/mod.ts";

    import getUsers from "./handlers/getUsers.ts";
    import { fetchData } from "./db.ts";
    import { User } from "../models/user.ts";

    const router = new Router();

    export const getUsers = async (): Promise<User[]> => {
      const users = await fetchData();

      // Order by name.
      return users.sort((a, b) => a.name.localeCompare(b.name));
    };

    router.get("/users", async ({ response }) => {
      response.body = await getUsers();
    });

    export default router;
    ```


## Using ABC module

### Basic

Simple server from the `README.md` of the [abc](https://deno.land/x/abc) package.

- `server.ts`
    ```typescript
    import { Application } from "https://deno.land/x/abc@v1.2.4/mod.ts";

    const APP_PORT = 8080;
    const app = new Application();

    console.log(`http://localhost:${APP_PORT}/`);

    app.get("/hello", (c) => {
        return "Hello, Abc!";
      })
      .start({ port: APP_PORT });
    ```

Below are adapted from the [examples](https://deno.land/x/abc@v1.2.4/examples) directory.

### Static

This set up serves file in the static `build` directory.

You can leave out the `cors` section if you don't need it.

- `static.ts`
    ```typescript
    import { cors } from "https://deno.land/x/abc@v1.2.4/middleware/cors.ts";
    import { Application } from "https://deno.land/x/abc@v1.2.4/mod.ts";

    const APP_PORT = 8080;

    const app = new Application();

    app.static("/", "build", cors())
      .start({ port: APP_PORT });

    console.log(`Server listening on http://localhost:${APP_PORT}`);
    ```

In the case of `app.static`, you must as file permissions.

```sh
$ deno run --allow-net --allow-read static.ts
```

Then view as:

- `http://localhost:8080/js/main.js`
- `http://localhost:8080/index.html` (not just `/`).

Notes based on [Static files](https://deno.land/x/abc/docs/static_files.md) in ABC docs.

- Static directory
    - Serve `public` directory as `/index.html`, `about.html` and nested paths like `/assets/js/main.js`.
    - Code
        ```typescript
        app.static("/static", "public");
        ```
- Static file
    - Make `index.html` available as `/`.
    - Code
        ```typescript
        app.file("/", "public/index.html");
        ```
- Combine both of the above.
    - Serve both a directory of static assets and a short path for the `index.html` page as `/`.
    - Code
        ```typescript
        app.file("/", "public/index.html")
          .static("/", "public")
        ```
