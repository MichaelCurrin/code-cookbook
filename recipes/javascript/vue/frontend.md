# Frontend

Add Vue.js to your frontend only - no CLI or build step needed.

Sample from [CodePen](https://codepen.io) Vue template. Create your own here: https://codepen.io/pen/editor/vue

- `index.html`
    ```vue
    <template>
      <div id="app">
        <h1>{{ message }}</h1>

        <p>
          Learn more with the
          <a href="https://vuejs.org/" target="_blank" rel="noopener"
            >Vue Docs &amp; Resources</a
          >.
        </p>

        <button @click="doSomething">Say hello.</button>
      </div>
    </template>

    <script>
    export default {
      data() {
        return {
          message: "Welcome to Vue!"
        };
      },
      methods: {
        doSomething() {
          alert("Hello!");
        }
      }
    };
    </script>

    <!-- Use preprocessors via the lang attribute! e.g. <style lang="scss"> -->
    <style>
    #app {
      font-family: Avenir, Helvetica, Arial, sans-serif;
      text-align: center;
      color: #2c3e50;
      margin-top: 60px;
    }

    a,
    button {
      color: #4fc08d;
    }

    button {
      background: none;
      border: solid 1px;
      border-radius: 2em;
      font: inherit;
      padding: 0.75em 2em;
    }
    </style>
    ```
    
