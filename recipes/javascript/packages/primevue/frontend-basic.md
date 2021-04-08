# Frontend basic

{% raw %}

Here we add PrimeVue to the frontend using script and CSS.

Based on [Setup](https://primefaces.org/primevue/showcase/#/setup) example from the docs. I got warning loading the CSS unless I locked down to specific versions.

- `index.html`
    ```
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

            <h6>{{val}}</h6>
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

{% endraw %}
