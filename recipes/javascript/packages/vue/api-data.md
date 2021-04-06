---
title: API data
description: Fetch API data and use it in your Vue app
---

{% raw %}

Point your Vue app at an API that is public, that you created, or at a static JSON file in your assets.

## Samples

### Vue Router

From [Data fetching](https://router.vuejs.org/guide/advanced/data-fetching.html) in the Vue Router docs.

Fetching after navigating to page.

Using `created` - we fetch the data when the view is created and the page is being viewed.

Using `watch` - we call the method again if the route changes.

The `if` statement with in the `getPost` callback is to make sure this request is the last one we did, discard otherwise

```vue
<template>
  <div class="post">
    <div v-if="loading" class="loading">
      Loading...
    </div>

    <div v-if="error" class="error">
      {{ error }}
    </div>

    <div v-if="post" class="content">
      <h2>{{ post.title }}</h2>
      <p>{{ post.body }}</p>
    </div>
  </div>
</template>
```

```javascript
export default {
  data () {
    return {
      loading: false,
      post: null,
      error: null
    }
  },
  created () {
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      this.error = this.post = null
      this.loading = true
      const fetchedId = this.$route.params.id
      
      // Your fetching logic here.
      getPost(fetchedId, (err, post) => {
        if (this.$route.params.id !== fetchedId) {
          return
        }
        this.loading = false
        if (err) {
          this.error = err.toString()
        } else {
          this.post = post
        }
      })
    }
  }
}
```

### Bitcoin

Here we use a Bitcoin prices API, from the Vue 2 docs cookbook on [Using Axios to Consume APIs](https://vuejs.org/v2/cookbook/using-axios-to-consume-apis.html). Except using the browser's builtin `fetch` function.

For Node, you'll need to install a library - see [JS Request](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/general/request/) cheatsheet.

We set the appearance of the app to say "Loading...". Then replace it with results on success, or an error message on an error.

```javascript
const PRICES_API_URL = "https://api.coindesk.com/v1/bpi/currentprice.json";

const ConsumeApi = {
  data() {
    return {
      info: null,
      loading: true,
      errored: false,
    };
  },
  async mounted() {
    try {
      const resp = await fetch(PRICES_API_URL);
      const data = await resp.json();
      this.info = data.bpi;
    } catch (err) {
      console.error(`Unable to fetch currency data. Error: ${err}`);
      this.errored = true;
    } finally {
      this.loading = false;
    }
  },
  template: `
    <h3>Bitcoin Price Index</h3>

    <section v-if="errored">
      <p>We're sorry, we're not able to retrieve this information at the moment, please try back later</p>
    </section>

    <section v-else>
      <div v-if="loading">Loading...</div>

      <div v-else v-for="currency in info" class="currency">
        {{ currency.description }}:

        <span>
          <b>
            <span v-html="currency.symbol"> </span>
            {{ currency.rate_float.toFixed(2) }}
          </b>
        </span>
      </div>
    </section>
  `,
};

export default ConsumeApi;
```

{% endraw %}
