# Event handling

{% raw %}

```javascript
const EventHandling = {
  data() {
    return {
      message: "Hello Vue.js!",
    };
  },
  methods: {
    reverseMessage() {
      this.message = this.message.split("").reverse().join("");
    },
  },
  template: `
    <div>
      <p>
        {{ message }}
      </p>

      <button v-on:click="reverseMessage">
        Reverse Message
      </button>
    </div>
  `,
};
```

```html
<h2>Event handling</h2>
<EventHandling></EventHandling>
```

{% endraw %}
