# Two-way binding

{% raw %}

```javascript
const TwoWayBinding = {
  data() {
    return {
      message: "Hello Vue!",
    };
  },
  template: `
    <div>
      <label for="message-input">
        Message:
      </label>
      {{ }}
      <input id="message-input" type="text" v-model="message" />

      <p>
        {{ message }}
      </p>
    </div>
  `,
};
```

```html
<h2>Two-way binding</h2>
<TwoWayBinding></TwoWayBinding>
```

{% endraw %}
