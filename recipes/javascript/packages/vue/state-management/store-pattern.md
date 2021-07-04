---
title: Store pattern
description: Manage state in Vue using a central store and plain JS
---

No library like Vuex is needed here.

{% raw %}

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

Set up app using the store:

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

{% endraw %}
