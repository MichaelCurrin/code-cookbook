# localStorage

## Sample

Using plain JS to get and set a value `localStorage`.

If the key is not present, the value will be `null`, so we use `??` to detect that and fallback to an empty string (to avoid a warning from `useState`).

{% raw %}

```jsx
function TextSample() {
  const persistedValue = localStorage.getItem("name") ?? "";
  const [value, setValue] = React.useState(persistedValue);

  const onInput = (event) => {
    setValue(event.target.value);
    localStorage.setItem("name", event.target.value);
  };

  return (
    <div>
      <label hmltfor="name-input">Name: </label>

      <span> </span>

      <input
        id="name-input"
        value=${value}
        onInput=${onInput}
        placeholder="World"
      />

      <br />
      <br />

      <div>${value}</div>
    </div>
  );
}
```

{% endraw %}
