# React Leet example

Based on the React sample on Leetcode playground:

- [leetcode.com/playground/new/react](https://leetcode.com/playground/new/react)

### Files

- `.gitignore`
    ```
    node_modules/
    ```
- `index.js`
    ```jsx
    import React from "react";
    import ReactDOM from 'react-dom';

    import "./styles.css";

    function App() {
      return (
        <div className="App">
          <h1>Hello World</h1>
        </div>
      );
    }

    const rootElement = document.getElementById("root");
    ReactDOM.render(<App />, rootElement);
    ```
- `package.json`
    ```json
    {
      "title": "test",
      "main": "index.js",
      "dependencies": {
        "react": "latest",
        "react-dom": "latest"
      }
    }
    ```
- `styles.css`
    ```css
    .App {
      font-family: sans-serif;
      text-align: center;
    }
    ```
