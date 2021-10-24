# Two-way binding


## Related

- [Two-way binding cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/packages/vue/events/two-way-binding.html)
- [v-model cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/packages/vue/directives/v-model.html)


## Resources

- [v-model - Vue 3 syntax](https://v3.vuejs.org/guide/migration/v-model.html#_3-x-syntax) docs
- [Form input bindings](https://v3.vuejs.org/guide/forms.html) docs


## Example

{% raw %}

Here we set up a variable `message` which is updated through user-input and the result displays below.

JavaScript:

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

Using the component:

```html
<h2>Two-way binding</h2>
<TwoWayBinding></TwoWayBinding>
```

{% endraw %}
