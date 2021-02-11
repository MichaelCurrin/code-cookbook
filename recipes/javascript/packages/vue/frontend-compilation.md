---
title: Frontend compilation
description: Add Vue.js to your frontend only - no CLI or build step needed
---

{% raw %}


## JSPM sample

From the Vue.js example in [JSPM Sandbox](https://jspm.org/sandbox).

This uses the ES Module syntax so you get to reference Vue by URL on JSPM CDN, rather than as a script tag.

- `index.html`
    ```html
    <!DOCTYPE html>
    <html>
    
    <head>
        <script type="importmap">
        {
          "imports": {
            "vue": "https://jspm.dev/vue/dist/vue"
          }
        }
        </script>
    </head>

    <body style=margin:0>
        <div id="container"></div>

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

    </body>
    </html>
    ```


## Vue3 SFC loader sample

Using [FranckFreiburger/vue3-sfc-loader](https://github.com/FranckFreiburger/vue3-sfc-loader)

>  Vue3 Single File Component loader. Load `.vue` files directly from your html/js. No node.js environment, no (webpack) build step. 

Based on the README.md and the linked [pen](https://codepen.io/franckfreiburger/project/editor/AqPyBr).

- `index.html`
    ```html
    <!DOCTYPE html>
    <html>
        
    <head>
      <script src="https://unpkg.com/vue@next"></script>
      <script src="https://cdn.jsdelivr.net/npm/vue3-sfc-loader"></script>
    </head>
        
    <body>
      <div id="app"></div>

      <script>
        const options = {
          moduleCache: {
            vue: Vue,
          },
          getFile(url) {
            return fetch(url).then(response => response.ok ? response.text() : Promise.reject(response));
          },
          addStyle(styleStr) {
            const style = document.createElement('style');
            style.textContent = styleStr;
            const ref = document.head.getElementsByTagName('style')[0] || null;
            document.head.insertBefore(style, ref);
          },
          log(type, ...args) {
            console.log(type, ...args);
          }
        };

        const { loadModule, version } = window["vue3-sfc-loader"];

        const app = Vue.createApp({
          components: {
            'my-component': Vue.defineAsyncComponent(() => loadModule('./myComponent.vue', options)),
          },
          template: `Hello <my-component></my-component> <sub>from vue3-sfc-loader v${ version }</sub>`
        });

        app.mount('#app');
      </script>
    </body>
    </html>
    ```
- `myComponent.vue`
    ```vue
    <template>
      <span class="example">{{ msg }}</span>
    </template>
    
    <script>
      export default {
        data () {
          return {
            msg: 'world!',
            color: 'blue',
          }
        }
      }
    </script>

    <style scoped>
      .example {
        color: v-bind('color');
      }
    </style>
    ```

{% endraw %}
