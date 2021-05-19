# Text input

{% raw %}

A basic example of asking for a user's name.

See this in use at [React Frontend Quickstart](https://github.com/MichaelCurrin/react-frontend-quickstart).

```jsx
function TextSample() {
  const [value, setValue] = React.useState("");

  const onChange = (event) => {
    setValue(event.target.value);
  };

  const msg = value ? `Welcome, ${value}` : "Tell me your name";

  return (
    <div>
      <label hmltfor="name-input"> Name: </label>
      
      <span> </span>
      
      <input
        id="name-input"
        placeholder="World"
        value={value}
        onChange={onChange}
      />
      
      <br />
      <br />
      
      <div>{msg}</div>
    </div>
  );
}
```

{% endraw %
