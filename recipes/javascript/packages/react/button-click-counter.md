# Button click counter 

{% raw %}


## Resources

- [Using the State Hook](https://reactjs.org/docs/hooks-state.html) in React docs, which is what this was based on.


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


{% endraw %}
