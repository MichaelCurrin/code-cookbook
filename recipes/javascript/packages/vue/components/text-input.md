# Text input

{% raw %}


## Related

- [Two-way binding cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/packages/vue/events/two-way-binding.html)
- [v-model cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/packages/vue/directives/v-model.html)


## Resources

- [v-model - Vue 3 syntax](https://v3.vuejs.org/guide/migration/v-model.html#_3-x-syntax) docs
- [Form input bindings](https://v3.vuejs.org/guide/forms.html) docs


## Examples

Here we set up a variable `name` which is updated through user-input and then use it in a greeting.

### Basic

This is a simple case where the input and the output is in the same component.

```javascript
const TextInput = {
  name: "TextInput",
  data() {
    return {
      name: "Vue",
    };
  },
  template: `
    <div>
      <label for="name-input">
        Message:
      </label>
      <input id="name-input" type="text" v-model="name" />

      <p>
        Hello, {{ name }}!
      </p>
    </div>
  `,
};
```

Use the component:

```html
<h2>Input</h2>

<TextInput></TextInput>
```

### Use in subcomponent

Here the outer component is the `App` vue.

The input is not a component and rather directly in the `App` - this makes it easy to handle `name` without needing events, as `name` is defined in the app, receives inputs, and passed as property, all in the same scope.

The output is handled in `Display` component, which has `name` as a property.

```javascript
const Greet = { 
  name: "Greet",
  props: {
    name: { type: String, required: true },
  },
  template: `
    <p>
      Hello, {{ name }}!
    </p>
  `,
}

const App = createApp({
  components: {
    Greet,
  },
  data() {
    return {
      name: "Vue",
    };
  },
  template: `
    <div>
      <div>
        <label for="name-input">
          Message:
        </label>
        <input id="name-input" type="text" v-model="name" />
      </div>
      
      <Greet :name="name"></Greet>
    </div>
  `,
)};
```

### Pass values between components

Here we set up `TextInput` but this time using `modelValue` and events, rather than `data`.

We use `Greet` again.

On `App`, we set up `name`, which is controlled by `TextInput` and displayed by `Greet`.

We have to define `name` in the outer app scope and handle it with events, so that `TextInput` in the lower scope can safely change the value in the `App` scope. A basic binding would have `App` and `TextInput` trying to control the same value and that causes problems. And then we pass the value to `Greet`.

```javascript
const TextInput = {
  name: "TextInput",
  props: [
    'modelValue'
  ],
  emits: [
    'update:modelValue'
  ],
  template: `
    <div>
      <label for="name-input">
        Name:
      </label>

      <input :value="modelValue" @input="$emit('update:modelValue', $event.target.value)">
    </div>
  `
}

const Greet = { 
  name: "Greet",
  props: {
    name: { type: String, required: true },
  },
  template: `
    <p>
      Hello, {{ name }}!
    </p>
  `,
}

const app = createApp({
  components: {
    TextInput,
    Greet,
  },
  data() {
    return {
      name: '',
    };
  },
  template: `
   <TextInput v-model="name"></TextInput>

   <Greet :name="name"></Greet>
  `
}
```


{% endraw %}
