# Vuex

{% raw %}

The docs around Vue state management then go on to say that for large applications you might need to use events to change the store, as in the Flux approach. which then leads to Vuex as the Vue approach.

See [Facebook Flux](https://facebook.github.io/flux/) library, which is known for its use with React, as with Redux.

> As we continue developing the convention, where components are never allowed to directly mutate state that belongs to a store but should instead dispatch events that notify the store to perform actions, we eventually arrive at the Flux architecture.
>
> The benefit of this convention is we can record all state mutations happening to the store and implement advanced debugging helpers such as mutation logs, snapshots, and history re-rolls / time travel.

See [Vuex](https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/vue/vuex.html) resources.


## Simple store

From the Vuex docs [Getting Started](https://next.vuex.vuejs.org/guide/) page.

> just provide an initial state object, and some mutations:

```javascript
import { createApp } from 'vue'
import { createStore } from 'vuex'

// Create a new store instance.
const store = createStore({
  state () {
    return {
      count: 0
    }
  },
  mutations: {
    increment (state) {
      state.count++
    }
  }
})

const app = createApp({ /* your root component */ })

app.use(store)
```

> Now, you can access the state object as `store.state`, and trigger a state change with the `store.commit` method:

```javascript
store.commit('increment')

console.log(store.state.count) // -> 1
```

> In a Vue component, you can access the store as this.$store. Now we can commit a mutation using a component method:

```javascript
methods: {
  increment() {
    this.$store.commit('increment')
    console.log(this.$store.state.count)
  }
}
```

{% endraw %}
