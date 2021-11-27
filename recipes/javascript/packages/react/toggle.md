# Toggle


{% raw %}

## Functional component

Note from React 17 you don't need to import `React` at the top of the file.

```jsx
import { useState } from "react";

export default function Toggle(props) {
  const [isHidden, setIsHidden] = useState(false);

  const showHide = () => {
    setIsHidden(!isHidden);
  };

  return (
    <div>
      <h2>Toggle component</h2>

      <p>A simple functional component.</p>

      <button onClick={() => showHide()}>Toggle</button>

      <p>{!isHidden && props.text}</p>
    </div>
  )
}
```


## Class component

```jsx
import React from "react";

export default class Toggle extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      isHidden: false,
    };
  }

  showHide() {
    this.setState((currentState) => ({
      isHidden: !currentState.isHidden,
    }));
  }

  render() {
    return (
      <div>
        <h2>Toggle component</h2>

        <p>A simple class component.</p>

        <button onClick={() => this.showHide()}>Toggle</button>

        <p>{!this.state.isHidden && this.props.text}</p>
      </div>
    );
  }
}
```

{% endraw %}
