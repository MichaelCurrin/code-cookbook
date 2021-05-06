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

{% endraw %}
