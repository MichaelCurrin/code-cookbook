# Toggle


{% raw %}

## Functional component

```jsx
import { useState } from "react";

export default function Toggle(props) {
  const [isHidden, setIsHidden] = useState(false);

  const showHide = () => {
    setIsHidden(!isHidden);
  };

  return (
    <>
      <h2>Toggle component</h2>

      <p>A simple functional component.</p>

      <button onClick={() => showHide()}>Toggle</button>

      <p>{!isHidden && props.text}</p>
    </>
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
      <>
        <h2>Toggle component</h2>

        <p>A simple class component.</p>

        <button onClick={() => this.showHide()}>Toggle</button>

        <p>{!this.state.isHidden && this.props.text}</p>
      </>
    );
  }
}
```

From [Handling events](https://reactjs.org/docs/handling-events.html) in the React docs tutorial.

```jsx
class Toggle extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isToggleOn: true };

    // This binding is necessary to make `this` work in the callback    
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(prevState => ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  render() {
    return (
      <button onClick={this.handleClick}>
        {this.state.isToggleOn ? 'ON' : 'OFF'}
      </button>
    );
  }
}


ReactDOM.render(
  <Toggle />,
  document.getElementById('root')
);
```

{% endraw %}
