---
title: Store pattern
description: Manage state in Vue using a central store and plain JS
---

You don't need a library like Vuex here - for simple cases you can implement your own store.

{% raw %}


## Store in state variable

This value will persist when switching views, that is it. The value will get lost if you do anything else. See [Persist in storage](#persist-in-storage) below for alternate approach.

### Repo username

Here a form is used to enter a username of a repo. This is stored in the state and accessed on multiple views.

- `src/store.js`
    ```javascript
    const DEFAULT_USERNAME = "MichaelCurrin"
    
    const store = {
      debug: true,

      state: reactive({
        repoUsername: DEFAULT_USERNAME,
      }),

      setRepoUsername(value: string) {
        if (this.debug) {
          console.debug(`Storing repo username: ${value}`);
        }

        this.state.repoUsername = value;
      },
    };

    export default store;
    ```
- `MyVue.vue` - some page on the site. Read a value using by getting it from `state` on the `store`. Or you could make and use `getRepoUsername` instead.
    ```vue
    <script>
    import store from "@/store";
    
    export default {
      data() {
        return {
          username: store.state.repoUsername,
        },
      },
      methods: {
        submit() {
          store.setRepoUsername(this.username);
        }
      }
    }
    </script>
    ```
    
From my testing, if you only have on App instance then you can leave out reactive:

```javascript
const store = {
  state: {
    repoUsername: DEFAULT_USERNAME,
  },
}
```
 
### Message

- `src/store.js` - Set up a store object with a debug attribute and a state attribute with our data in it. Plus some methods that are used to set data on the state.
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
- `App.vue` - Vue file. Set up app using the store. For demostration, here we actually have two App components using the same store and mount them on different elements. These could be on the same or different pages.
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
    
    
## Persist in storage

Here we store a value in local storage. This has the following benefits:

- Persist across page views (navigating)
- Persist across reloading the page or closing and opening the browser
- State is available across tabs and windows for the current browser, though only for the current domain.

Then instead of getting and setting on `this.state`, you could use `localStorage`. And using the store pattern, the rest of the app won't care how it's stored and will just have to interact with the store wrapper.

### Repo username

I found that when using a `state` attribute on `store`, there would be a lag that means that the value is not used when switching views.

Even when using `reactive`:

```javascript
const store = {
  state: reactive({
    repoUsername: localStorage.getItem("repoUsername")
  }),
  
  // setRepoUsername...
```

So I left out `state` completely and that works. It was also suggested on this [thread](https://stackoverflow.com/questions/51015101/how-to-make-data-from-localstorage-reactive-in-vue-js) to no try and make it reactive. I guess because Vue can't check when the value is updated - the value is only known when doing a `getItem` call.

```javascript
const store = {
  getRepoUsername() {
    return localStorage.getItem('repoUsername')
  },

  /**
   * Store a repository username. e.g. 'MyUsername'.
   */
  setRepoUsername(value: string) {
    if (this.debug) {
      console.debug(`Storing repo username: ${value}`);
    }

    localStorage.setItem('repoUsername', value)
  },
```

### TodoMVC

See also the [TodoMVC](https://v3.vuejs.org/examples/todomvc.html) example in the docs, which uses `localStorage`.

{% endraw %}
