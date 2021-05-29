# Button

{% raw %}

A basic example of a button that changes state when pressed.

See this in use at [React Frontend Quickstart](https://github.com/MichaelCurrin/react-frontend-quickstart).

```jsx
function ButtonSample() {
  const [pressed, setPressed] = React.useState(false);

  const onClick = () => {
    setPressed(!pressed);
  };

  const msg = pressed ? "on" : "off";
  const className = pressed ? "green" : "";

  return (
    <div>
      <label>Status: </label>
      <br />
      <br />
      <button
        className={className}
        id="status-button-input"
        onClick={onClick}
      >
        {msg}
      </button>
    </div>
  );
}
```

{% endraw %}
