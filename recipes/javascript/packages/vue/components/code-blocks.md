---
title: Code blocks
description: Render text as monospaced code block and also with highlighting
---

{% raw %}

## Basic

Using `pre` and `code` tags together. Note that this does not apply any syntax highlighting - it will all be one color.

- `components/Pre.vue`
    ```vue
    /* To reduce whitespace, make sure to keep everything on one line here. */
    <template>
      <pre><code><slot></slot></code></pre>
    </template>

    <script lang="ts">
    import Vue from "vue";

    export default Vue.extend({
      name: "Pre",
    });
    </script>
    ```


Then use as the `Pre` tag. Note we used `slot` above so we can pass content inside the element instead of a parameter.

- `App.vue`
    ```vue
    <template>
      <Pre>{{ content }}</Pre>
    </template>
    ```


## Highlight

Using `highlight.js`.

See [Usage](https://highlightjs.org/usage/) instructions. There is some low-level code, but if you use Vue then you can skip that and use the code below from the Vue section of that guide.

Remember to import the CSS styling or you won't see colors rendered.

- `components/Code.vue`
    ```vue
    <template>
      <div>
        <highlightjs autodetect :code="code" />
      </div>
    </template>
    
    <script lang="ts">
    import Vue from "vue";
    import hljs from "highlight.js";
    import "highlight.js/styles/darcula.css";
    
    Vue.use(hljs.vuePlugin);

    export default Vue.extend({
      name: "Code",
      props: {
        code: String,
      },
    });
    </script>
    ```

More examples:

```vue
<!-- bind to a data property named `code` -->
<highlightjs autodetect :code="code" />

<!-- or literal code works as well -->
<highlightjs language='javascript' code="var x = 5;" />
```

If you wanted more control, you could make `language` a property to be passed and used in the component, maybe with a default if not set.

{% endraw %}
