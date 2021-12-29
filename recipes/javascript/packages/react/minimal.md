# Minimal


## Sample

Based on the React template on [CodeSandbox](https://codesandbox.io).

- `App.jsx`
    ```jsx
    import "./styles.css";

    export default function App() {
      return (
        <div className="App">
          <h1>My heading</h1>
          <p>My content</p>
        </div>
      );
    }
    ```
- `index.js`
    ```jsx
    import { StrictMode } from "react";
    import ReactDOM from "react-dom";

    import App from "./App";

    ReactDOM.render(
      <StrictMode>
        <App />
      </StrictMode>,
      document.getElementById("root");
    );
    ```
- `styles.css`
    ```css
    .App {
      font-family: sans-serif;
      text-align: center;
    }
    ```
- `public/index.html`
    ```html
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="theme-color" content="#000000">

      <link rel="manifest" href="%PUBLIC_URL%/manifest.json">
      <link rel="shortcut icon" href="%PUBLIC_URL%/favicon.ico">

      <title>React App</title>
    </head>

    <body>
      <noscript>
        You need to enable JavaScript to run this app.
      </noscript>

      <div id="root"></div>
    </body>

    </html>
    ```
- `package.json`
    ```json
    {
      "name": "react-minimal-quickstart",
      "version": "0.1.0",
      "scripts": {
        "start": "react-scripts start",
        "build": "react-scripts build",
        "test": "react-scripts test --env=jsdom"
      },
      "dependencies": {
        "react": "17.0.2",
        "react-dom": "17.0.2",
        "react-scripts": "4.0.0"
      },
      "devDependencies": {
        "@babel/runtime": "7.13.8",
        "typescript": "4.1.3"
      },
      "browserslist": [">0.2%", "not dead", "not ie <= 11", "not op_mini all"]
    }
    ```
    
