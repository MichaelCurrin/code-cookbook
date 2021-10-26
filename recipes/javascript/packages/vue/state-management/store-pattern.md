---
title: Store pattern
description: Manage state in Vue using a central store and plain JS
---

You don't need a library like Vuex here - for simple cases you can implement your own store.

{% raw %}

## Resources

The example below is based on [Simple State Management from Scratch](https://v3.vuejs.org/guide/state-management.html#simple-state-management-from-scratch) in the Vue 3 docs.

> ... if you have a piece of state that should be shared by multiple instances, you can use a reactive method to make an object reactive

See also the [reactive](https://v3.vuejs.org/guide/reactivity-fundamentals.html) Vue method in the docs, as that is used below.


## Persist

If you want to persist values when revisiting the site, you can use local storage.

Then instead of getting and setting on `this.state`, you could use `localStorage`. And using the store pattern, the rest of the app won't care how it's stored and will just have to interact with the store wrapper.

## Example

- `store.js` - store in JavaScript. Set up a store object with a debug attribute, a state attribute with our data in it, and some methods that are used to set data on the state.
    ```javascript
    import { reactive } from 'vue'

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

    export default store
    ```
- `App.vue` - Vue file. Set up app using the store. Here we have two App components using the same store and mount them on different elements. These could be on the same or different pages.
    ```javascript
    import { createApp } from "vue"
    import store from "./store.js"

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
- HTML page:
    ```html
    <div id="app-a">
        {{ sharedState.message }}
    </div>

    <div id="app-b">
        {{ sharedState.message }}
    </div>
    ```
    
{% endraw %}
