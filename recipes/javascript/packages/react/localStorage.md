# localStorage

## Sample

Using plain JS to get and set a value `localStorage` as part of the browser's [Storage API](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/browser/storage.html).

{% raw %}

This component persists data in `localStorage` so it will remember values across a page refresh or restarting the browser.
          
If the key is _not_ present, the value will be `null`, so we use `??` to detect that and fallback to an empty string (to avoid a warning from `useState`).

```jsx
import React from "react";

function TextSample() {
  const persistedValue = localStorage.getItem("name") ?? "";
  const [value, setValue] = React.useState(persistedValue);

  const onInput = (event) => {
    setValue(event.target.value);
  };
  
  React.useEffect(() => {
    localStorage.setItem("name", target);
  };

  return (
    <div>
      <label hmltfor="name-input">Name: </label>

      <span> </span>

      <input
        id="name-input"
        value={value}
        onInput={onInput}
        placeholder="World"
      />

      <br />
      <br />

      <div>{value}</div>
    </div>
  );
}
```

I found it worked fine to put the `localStorage.setItem` bit in the `onInput` handler. But, from this [thread](https://stackoverflow.com/questions/64395991/adding-item-to-localstorage-then-retrieving-it-using-usestate-react) on StackOverflow, I decided to refactor use `useEffect` instead, as that it intended for managing side effects. See my [React Hooks](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/packages/react/hooks.html) cheatsheet for more info.


{% endraw %}
