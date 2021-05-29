# Counter

{% raw %}

See this in use at [React Frontend Quickstart](https://github.com/MichaelCurrin/react-frontend-quickstart).

```jsx
function Counter() {
  const [count, setCount] = React.useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>

      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  );
}
```

{% endraw %}
