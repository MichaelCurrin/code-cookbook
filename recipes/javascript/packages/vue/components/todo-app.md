# Todo app

{% raw %}

Sample from a [pen][] which is linked to from the [Single-File Component][] docs.

[pen]: https://codesandbox.io/s/vue-todo-list-app-with-single-file-component-vzkl3?file=/src/App.vue:0-1551
[Single-File Component]: https://v3.vuejs.org/guide/single-file-component.html#what-about-separation-of-concerns

- `App.vue`
    ```vue
    <template>
      <div class="wrapper">
        <h1>My Todo List</h1>
        
        <form @submit.prevent="addTodo">
          <input type="text" name="todo-text" v-model="newTodoText" placeholder="New todo">
        </form>
        
        <ul v-if="todos.length">
          <TodoItem v-for="todo in todos" :key="todo.id" :todo="todo" @remove="removeTodo"/>
        </ul>
        
        <p class="none" v-else>Nothing left in the list. Add a new todo in the input above.</p>
      </div>
    </template>

    <script>
    import TodoItem from "./TodoItem.vue"

    let nextTodoId = 1

    const createTodo = text => ({
      text,
      id: nextTodoId++
    })

    export default {
      components: {
        TodoItem
      },

      data() {
        return {
          todos: [
            createTodo("Learn Vue"),
            createTodo("Learn about single-file components"),
            createTodo("Fall in love ❤️")
          ],

          newTodoText: ""
        }
      },

      methods: {
        addTodo() {
          const trimmedText = this.newTodoText.trim()

          if (trimmedText) {
            this.todos.push(createTodo(trimmedText))
          }

          this.newTodoText = ""
        },

        removeTodo(item) {
          this.todos = this.todos.filter(todo => todo !== item)
        }
      }
    }
    </script>

    <style lang="stylus">
    *, *::before, *::after 
      box-sizing border-box

    html, body
      font 16px/1.2 BlinkMacSystemFont, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif
      padding 10px

    .wrapper
      width 75%
      margin 0 auto

    form
      margin-bottom 20px

    input[type="text"]
      width 100%
      padding 10px
      border 1px solid #777

    ul, li
      margin 0
      padding 0

    p.none
      color #888
      font-size small
    </style>
    ```

{% endraw %}
