---
description: Basic web servers with Deno
---
# Servers


### Web server

From [post](https://medium.com/@nikhilsharmarockstar21/getting-started-with-deno-js-fa2154f8657e).

- `server.ts`
    ```typescript
    import { serve } from "https://deno.land/std@0.58.0/http/server.ts";

    const s = serve({ port: 8000 });
    console.log("http://localhost:8000/");

    for await (const req of s) {
      req.respond({ body: "Hello, world\n" });
    }
    ```

Run:

```sh
$ deno run server.ts --allow-net
```


### Web serving routing

Add a `/users` endpoint to the server.

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
- `config.ts`
    ```typescript
    const APP_HOST = 'http://localhost',
      APP_PORT = 8000;
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

Run:

```sh
$ deno run server.ts --allow-net
```
