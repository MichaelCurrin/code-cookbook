# Butto click counter 

{% raw %}


## Resources

- [Using the State Hook](https://reactjs.org/docs/hooks-state.html) in React docs


## Component code

A simple component which a button that increments the value that is displayed.

```jsx
// Counter.jsx
import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <>
      <p>You clicked {count} times</p>

      <button onClick={() => setCount(count + 1)}>Click me</button>
    </>
  );
}
```

See the component in use here as code and a live demo:

- [React Quickstart](https://github.com/MichaelCurrin/react-quickstart)
- [React Frontend Quickstart](https://github.com/MichaelCurrin/react-frontend-quickstart)


{% endraw %}
