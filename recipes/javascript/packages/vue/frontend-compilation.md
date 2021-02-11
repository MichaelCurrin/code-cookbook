---
title: Frontend compilation
description: Add Vue.js to your frontend - no CLI or build step needed
---

{% raw %}


## Approaches

If you want the full dev experience with Node and Vue CLI, then you would use [vue-loader](https://vue-loader.vuejs.org/) to process your `.vue` files. 

> vue-loader is a loader for webpack that allows you to author Vue components in a format called Single-File Components (SFCs):

See also [MichaelCurrin/vue-quickstart](https://github.com/MichaelCurrin/vue-quickstart).

But if you want to leave out a build tool and just want to add Vue to your frontend HTML, then follow the samples below. These don't need a server-side build step to compile SFC files.


## JSPM sample

One approach is to avoid SFCs altogether.

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

The reference to `container.innerHTML` operates on the element with `id="container"`.


## Vue3 SFC loader sample

This approach loads SFCs dynamically on the frontend.

Using the low-level [FranckFreiburger/vue3-sfc-loader](https://github.com/FranckFreiburger/vue3-sfc-loader) library. Note SFC is Single-File Component.

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
