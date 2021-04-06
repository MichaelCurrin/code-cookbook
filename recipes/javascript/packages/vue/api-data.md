---
title: API data
description: Fetch API data and use it in your Vue app
---

{% raw %}

Point your Vue app at an API that is public, that you created, or at a static JSON file in your assets.

## Samples

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
