---
title: State management
---

{% raw %}


## Store pattern

Using plain Vue - no extra packages

Based on [Simple State Management from Scratch](https://v3.vuejs.org/guide/state-management.html#simple-state-management-from-scratch) in the Vue 3 docs.

> ... if you have a piece of state that should be shared by multiple instances, you can use a reactive method to make an object reactive

See [reactive](https://v3.vuejs.org/guide/reactivity-fundamentals.html#declaring-reactive-state) method.


Example:

```html
<div id="app-a">{{ sharedState.message }}</div>

<div id="app-b">{{ sharedState.message }}</div>
```

Set up store object with a debug attribute, a state attribute with our data in it and some methods that are used to set data on the state.

```javascript
const store = {
  debug: true,

  state: reactive({
    message: 'Hello!'
  }),

  setMessageAction(newValue) {
    if (this.debug) {
      console.log('setMessageAction triggered with', newValue)
    }

    this.state.message = newValue
  },

  clearMessageAction() {
    if (this.debug) {
      console.log('clearMessageAction triggered')
    }

    this.state.message = ''
  }
}
```

Set up app using the store.

```javascript
const appA = createApp({
  data() {
    return {
      privateState: {},
      sharedState: store.state
    }
  },
  mounted() {
    store.setMessageAction('Goodbye!')
  }
})
appA.mount('#app-a')

const appB = createApp({
  data() {
    return {
      privateState: {},
      sharedState: store.state
    }
  }
})
appB.mount('#app-b')
```


## Vuex

The docs around Vue state management then go on to say that for large applications you might need to use events to change the store, as in the Flux approach. which then leads to Vuex as the Vue approach.

See [Facebook Flux](https://facebook.github.io/flux/) library, which is known for its use with React, as with Redux.

> As we continue developing the convention, where components are never allowed to directly mutate state that belongs to a store but should instead dispatch events that notify the store to perform actions, we eventually arrive at the Flux architecture.
>
> The benefit of this convention is we can record all state mutations happening to the store and implement advanced debugging helpers such as mutation logs, snapshots, and history re-rolls / time travel.

See [Vuex](https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/vue/vuex.html) resources.


{% endraw %}
