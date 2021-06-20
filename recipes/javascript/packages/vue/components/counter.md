# Counter

{% raw %}

```javasript
const Counter = {
  data() {
    return {
      counter: 0,
    };
  },
  mounted() {
    setInterval(() => {
      this.counter++;
    }, 1000);
  },
  template: `
    <div>
      Counter: {{ counter }}
    </div>
  `,
};
```

```html
<h2>Counter</h2>
<Counter></Counter>
```

{% endraw %}
