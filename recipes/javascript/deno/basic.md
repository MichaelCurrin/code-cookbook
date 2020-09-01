# Basic

See also this [deno-quickstart](https://github.com/resir014/deno-quickstart) I found.


## Samples

### Greeting

Hello world with colors.

From [post](https://dev.to/wuz/getting-started-with-deno-e1m)

- `hello-world.ts`
    ```typescript
    import { bgBlue, red, bold } from "https://deno.land/std/colors/mod.ts";

    const sayHello = (name: string = "world") => {
      console.log(bgBlue(red(bold(`Hello ${name}!`))));
    }

    sayHello();

    sayHello("fellow dev");
    ```
    
Run:

```sh
$ deno hello-world.ts
```

