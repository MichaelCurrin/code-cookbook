---
title: Frontend compilation
description: Add Vue.js to your frontend only - no CLI or build step needed
---

{% raw %}


## JSPM sample

From the Vue.js example in [JSPM Sandbox](https://jspm.org/sandbox).

This uses the module syntax so you can reference Vue by URL on JSPM CDN, rather than as a script tag.

- `index.html`
    ```html
    <!DOCTYPE html>

    <body style=margin:0>
      <div id="container"></div>
    </body>

    <script type="importmap">
    {
      "imports": {
        "vue": "https://jspm.dev/vue/dist/vue"
      }
    }
    </script>

    <script type="module">
    import Vue from 'vue';

    container.innerHTML = `<p>{{ message }}</p>`;

    new Vue({
      el: '#container',
      data: {
        message: 'Hello Vue.js!'
      }
    });

    </script>
    ```


## Vue3 SFC Loader sample

Based on README.md of [FranckFreiburger/vue3-sfc-loader](https://github.com/FranckFreiburger/vue3-sfc-loader).

- `index.html`
    ```html
    <html>
    <body>
      <div id="app"></div>
        
      <script src="https://unpkg.com/vue@next"></script>
      <script src="https://cdn.jsdelivr.net/npm/vue3-sfc-loader/dist/vue3-sfc-loader.js"></script>
        
      <script>
        const options = {

          moduleCache: {
            vue: Vue
          },

          async getFile(url) {

            const res = await fetch(url);
            if ( !res.ok )
              throw Object.assign(new Error(url+' '+res.statusText), { res });
            return await res.text();
          },

          addStyle(textContent) {

            const style = Object.assign(document.createElement('style'), { textContent });
            const ref = document.head.getElementsByTagName('style')[0] || null;
            document.head.insertBefore(style, ref);
          },
        }

        const { loadModule } = window['vue3-sfc-loader'];

        const app = Vue.createApp({
          components: {
            'my-component': Vue.defineAsyncComponent( () => loadModule('./myComponent.vue', options) )
          },
          template: '<my-component></my-component>'
        });

        app.mount('#app');

      </script>
    </body>
    </html>
    ```

{% endraw %}
