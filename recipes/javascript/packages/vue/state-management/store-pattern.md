---
title: Store pattern
description: Manage state in Vue using a central store and plain JS
---

No library like Vuex is needed here.

{% raw %}

## Resources

The example below is based on [Simple State Management from Scratch](https://v3.vuejs.org/guide/state-management.html#simple-state-management-from-scratch) in the Vue 3 docs.

> ... if you have a piece of state that should be shared by multiple instances, you can use a reactive method to make an object reactive

See also the [reactive](https://v3.vuejs.org/guide/reactivity-fundamentals.html) Vue method in the docs, as that is used below.


## Example

- Store JavaScript - set up store object with a debug attribute, a state attribute with our data in it and some methods that are used to set data on the state.
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
- Vue file - Set up app using the store. Here we have two App components using the same store and mount them on different elements. These could be on the same or different pages.
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
- HTML:
    ```html
    <div id="app-a">{{ sharedState.message }}</div>

    <div id="app-b">{{ sharedState.message }}</div>
    ```
    
{% endraw %}
