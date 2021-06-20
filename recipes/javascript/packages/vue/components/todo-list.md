# Todo list

{% raw %}

```javascript
const TodoItem = {
  props: {
    todo: { type: Object, required: true },
  },
  template: `<li>{{ todo.text }}</li>`,
};

const TodoList = {
  components: { TodoItem },
  data() {
    return {
      groceryList: [
        { id: 0, text: "Vegetables" },
        { id: 1, text: "Cheese" },
        { id: 2, text: "Whatever else humans are supposed to eat" },
      ],
    };
  },
  template: `
    <div>
      <ol>
        <todo-item v-for="item in groceryList" v-bind:todo="item" v-bind:key="item.id"></todo-item>
      </ol>
    </div>
  `,
};
```

```html
<h2>Todo list</h2>
<TodoList></TodoList>
```

{% endraw %}
