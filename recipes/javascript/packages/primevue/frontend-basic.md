# Frontend basic

{% raw %}

## ES Module approach

See my PrimeVue project which uses ES Modules to allow `import` syntax. It doesn't use Node or build step.

[![MichaelCurrin - primevue-frontend-quickstart](https://img.shields.io/static/v1?label=MichaelCurrin&message=primevue-frontend-quickstart&color=blue&logo=github)](https://github.com/MichaelCurrin/primevue-frontend-quickstart)


## Docs sample

Here we add PrimeVue to the frontend using JavaScript and CSS.

Based on the [Setup](https://primefaces.org/primevue/showcase/#/setup) example from the docs. Using Vue 3 and PrimeVue 3.

- `index.html`
    ```html
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>PrimeVue Demo</title>

        <link href="https://unpkg.com/primevue@3.3.5/resources/themes/saga-blue/theme.css"
            rel="stylesheet">
        <link href="https://unpkg.com/primevue@3.3.5/resources/primevue.min.css" rel="stylesheet">
        <link href="https://unpkg.com/primeicons@4.1.0/primeicons.css" rel="stylesheet">

        <script src="https://unpkg.com/vue@next"></script>
        <script src="https://unpkg.com/primevue/inputtext/inputtext.min.js"></script>
    </head>

    <body>
        <div id="app">
            <p-inputtext v-model="val"></p-inputtext>

            <h6>{{ val }}</h6>
        </div>

        <script>
            const {
                createApp,
                ref
            } = Vue;

            const App = {
                setup() {
                    const val = ref(null);

                    return {
                        val
                    };
                },
                components: {
                    'p-inputtext': primevue.inputtext
                }
            };

            createApp(App).mount("#app");

        </script>
    </body>

    </html>
    ```

Notes:

- I got content type warnings in the browser on loading the CSS, unless I locked down to specific versions like `@3.3.5`.
- The component gets loaded from [inputtext.min.js](https://unpkg.com/primevue@3.4.0/inputtext/inputtext.min.js).
- The original code uses `primevue.inputtext` but that gives an error. Looking at the script, it sets up on `this` so therefore I used `this.primevue.inputtext` and that worked.
- Note that elements named like `Button` won't work because they get downcased in the DOM as `button`. Use `p-button` or `p-inputtext` works though and comes from the docs. 


## PrimeVue 2

Before I figured out how to use PrimeVue 3 and ES Modules together, I got this working for PrimeVue 2 and Vue 2.

Note that the variables get set up implicitly and not by name. The CSS

```html
<head>
    <meta charset="utf-8">
    <title>Button Demo</title>
    
    <link href="https://unpkg.com/primevue@2.4.1/resources/themes/saga-blue/theme.css"
        rel="stylesheet" />
    <link href="https://unpkg.com/primevue@2.4.1/resources/primevue.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/primeicons@4.1.0/primeicons.css" rel="stylesheet" />
</head>

<body>
    <div id="app">
        <button-styled label="Submit" />
    </div>
    
    <script type="module">
        import "https://unpkg.com/primevue@2.2.3/components/button/button.umd.js";
        import "https://unpkg.com/vue@2";

        new Vue({
          components: {
            'button-styled': button
          }
        }).$mount("#app");
    </script>
</body>
```


## Deps file

I had issues with the imports of ES Modules, unless I used import maps, which has limited support.

I tried using this as `deps.js`, based on Deno, loading it in `main.js`. But the `utils` import doesn't happen in time so the other imports always fail.

```javascript
import "https://unpkg.com/primevue@3.4.0/utils/utils.esm.js";
import "https://unpkg.com/primevue@3.4.0/ripple/ripple.esm.js";
export { default as Button } from "https://unpkg.com/primevue@3.4.0/button/button.esm.js";
```

{% endraw %}
