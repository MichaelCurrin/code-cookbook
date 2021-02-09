---
description: Basic web servers with Deno
---
# Servers


Run the examples below using:

```sh
$ deno run server.ts --allow-net
```


## Using serve

Using the [serve](https://deno.land/std@0.86.0/http/server.ts) module from the standard lib.

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


## Using Oak

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


## Using ABC

From the `README.md` of the [abc](https://deno.land/x/abc) package.

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

See also the [examples](https://deno.land/x/abc@v1.2.4/examples) directory.
