---
title: Hello World
description: The simplest app
---

From the [Hello World](https://reactjs.org/docs/hello-world.html) tutorial.

This leaves out `App.jsx` and rather sets up the app content directly in `render`.

- `index.jsx`
    ```jsx
    import ReactDOM from 'react-dom';

    ReactDOM.render(
      <h1>Hello, World!</h1>,
      document.getElementById('root')
    );
    ```

Refactored to use an app as an element (just a variable, not a function) with demonstration using of substitution.

- `index.jsx`
    ```jsx
    import ReactDOM from 'react-dom';
    
    const name = 'World';
    const element = <h1>Hello, { name }!</h1>;
    
    ReactDOM.render(
      element,
      document.getElementById('root')
    );
    ```
