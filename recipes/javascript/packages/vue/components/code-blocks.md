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

### Styling

Remember to import the CSS styling, or you won't see colors rendered.

- `App.vue`
```vue
<script lang="ts">
import Vue from "vue";

import "highlight.js/styles/darcula.css";

// ...
</script>
```

Try out available themes on the [Demo](https://highlightjs.org/static/demo/) page of the docs.

You can use autocomplete in VS Code with Ctrl+Space to find more style names - just add `.css` yourself after.

Another one I like:

```javascript
import "highlight.js/styles/github-gist.css";
```

### Approaches

- Autodetect language and dynamic code:
    ```vue
    <highlightjs autodetect :code="code" />
    ```
- Fixed language and literal code:
    ```vue
    <highlightjs language='javascript' code="var x = 5;" />
    ```
- Dynamic language and code.
    ```vue
    <highlightjs :language="language" :code="code" />
    ```
    
I found that `autodetect` didn't handle markdown links well.
    
### Example

- `components/Code.vue` - dynamic language, with a default.
    ```vue
    <template>
      <highlightjs :language="language" :code="code" />
    </template>

    <script lang="ts">
    import Vue from "vue";
    import hljs from "highlight.js";

    Vue.use(hljs.vuePlugin);

    const defaultLanguage = "markdown";

    export default Vue.extend({
      name: "Code",
      props: {
        code: { type: String, required: true },
        language: { type: String, required: false, default: defaultLanguage },
        },
    });
    </script>
    ```

{% endraw %}
