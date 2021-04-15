---
title: No build step
description: How to add Vue to your frontend as plain JS and HTML
---

{% raw %}

Here is how to add Vue to your site - without a build step. You don't need Vue CLI, Webpack or even Node.


## Loading Production Vue

From [Without Build Tools](https://v3.vuejs.org/guide/tooling/deployment.html#without-build-tools) on the Production deployment gude on the Vue docs.

> If you are using the full build, i.e. directly including Vue via a script tag without a build tool, make sure to use the minified version for production. This can be found in the Installation guide.

- Development mode: `https://jspm.dev/vue/dist/vue.js` - with dev tools.
- Production mode: `https://jspm.dev/vue/dist/vue.min.js` - minified build.


## Approaches

If you want the full dev experience with Node and Vue CLI, then you would use [vue-loader](https://vue-loader.vuejs.org/) to process your `.vue` files.

> vue-loader is a loader for webpack that allows you to author Vue components in a format called Single-File Components (SFCs):

See also [MichaelCurrin/vue-quickstart](https://github.com/MichaelCurrin/vue-quickstart).

But if you want to leave out a build tool and just want to add Vue to your frontend HTML, then follow some samples below. These don't need a server-side build step to compile SFC files.

Note that the setup for the examples below are not modern. This is the way in Vue 3 from [docs](https://v3.vuejs.org/api/application-api.html#component).

```javascript
import { createApp } from 'vue'

const app = createApp({})
```

## Templates and performance

A warning on performance from the [Production deployment](https://v3.vuejs.org/guide/tooling/deployment.html#pre-compiling-templates) doc.

> When using in-DOM templates or in-JavaScript template strings, the template-to-render-function compilation is performed on the fly.
>
> This is usually fast enough in most cases, but is best avoided if your application is performance-sensitive.



## Examples

### Set template in script tag

Normally you set `template` tag in a `.vue` file.

You can set `template` on a Vue object and it will be compiled for you.

```javascript
export default {
   name: "Foo",
   template: "<span>{{ message }}</span>",
};
```

### JSPM sample

One approach is to avoid SFCs altogether. The component is set as HTML + Vue syntax on an element and then Vue is initialized against that element.

From the Vue.js example in [JSPM Sandbox](https://jspm.org/sandbox), which is no longer there.

This uses the ES Module syntax so you get to reference Vue by URL on JSPM CDN, rather than as a script tag.

An [import map](https://wicg.github.io/import-maps/) is used to set CDNs and possibly lock versions. But I found the import did not actually work as `vue` when I ran this myself.

- `index.html`
    ```html
    <!DOCTYPE html>
    <html>

    <head>
        <script type="importmap">
        {
          "imports": {
            "vue": "https://jspm.dev/vue/dist/vue.js"
          }
        }
        </script>
    </head>

    <body style=margin:0>
        <div id="container"></div>

        <script type="module">
        import Vue from 'vue';

        container.innerHTML = '<p>{{ message }}</p>';

        new Vue({
          el: '#container',
          data() {
            return {
              message: 'Hello Vue.js!'
            }
          }
        });

        </script>

    </body>
    </html>
    ```

The reference to `container.innerHTML` operates on the element with `id="container"`.

I recommend against this and rather doing this, which is the Vue way.

```javascript
new Vue({
  template: `<p>{{ message }}</p>`
})
```

Also, using `app.mount` as below it more typical for mounting on an element than setting `el`. And means the app can be created without that element existing. See [Getting Started](https://v3.vuejs.org/guide/introduction.html#getting-started) and [Root component](https://v3.vuejs.org/guide/instance.html#the-root-component).

### Vue3 SFC loader sample

This approach loads SFCs dynamically on the frontend. Note use of `.vue` file in a callback function.

Using the low-level [FranckFreiburger/vue3-sfc-loader](https://github.com/FranckFreiburger/vue3-sfc-loader) library. Note SFC is Single-File Component.

>  Vue3 Single File Component loader. Load `.vue` files directly from your html/js. No node.js environment, no (webpack) build step.

Based on the README.md and the linked [pen](https://codepen.io/franckfreiburger/project/editor/AqPyBr). Warning `@next` is even more bleeding-edge than `@latest` and to so avoid risk of buggy releases, I've changed to `@latest`.

#### HTML

- `index.html`
    ```html
    <!DOCTYPE html>
    <html>

    <head>
      <script src="https://unpkg.com/vue@latest"></script>
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
            return fetch(url).then(resp =>
              resp.ok ? resp.text() : Promise.reject(resp)
            );
          },
          addStyle(styleStr) {
            const style = document.createElement("style");
            style.textContent = styleStr;
            const ref = document.head.getElementsByTagName("style")[0] || null;
            document.head.insertBefore(style, ref);
          },
          log(type, ...args) {
            console.log(type, ...args);
          },
        };

        const { loadModule, version } = window["vue3-sfc-loader"];

        const app = Vue.createApp({
          components: {
            "my-component": Vue.defineAsyncComponent(() =>
              loadModule("./myComponent.vue", options)
            ),
          },
          template: `Hello <my-component></my-component> <sub>from vue3-sfc-loader v${version}</sub>`,
        });

        app.mount("#app");

      </script>

    </body>
    </html>
    ```

It is weird to set `version` using `${version}` here - rather make `version` set under `data` and then use it as `{{ version }}`.

#### Component

Here we bind two data fields - one two HTML and one to CSS.

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
