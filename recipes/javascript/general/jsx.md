# JSX

See also [JSX][] in my Dev Cheatsheets.

[JSX]: https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/general/jsx.html


## Add JSX support to an app

### Server-side conversion

Use Node with Babel from NPM and possibly Webpack.

From React docs, we install Babel.

```sh
$ npm install babel-cli@6 babel-preset-react-app@3
```

Run this against a `src` directory. This also works _without_ Babel installed, as it will download.

```sh
$ npx babel \
  --watch src \
  --out-dir . \
  --presets react-app/prod
```

Or use Deno, which handle JSX syntax already.

### Add Babel standalone

From [React docs](https://reactjs.org/docs/add-react-to-a-website.html).

You can add Babel Standalone as a package on your frontend. 

When it loads, it will **compile your JSX code in place**. No server-side compile step needed.

1. Add this `<script>` tag to your page:
    ```html
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
    ```
2. Set up your JS to be recognized by Babel by setting `type`.
    ```html
    <script src="main.js" type="text/babel"></script>

    <!-- OR -->

    <script type="text/babel">
        console.log('Your JSX here');
    </script>
    ```

### Add HTM

Here we use [htm](https://www.npmjs.com/package/htm) NPM package.

> HTM (Hyperscript Tagged Markup)
>
> htm is JSX-like syntax in plain JavaScript - no transpiler necessary.

This works on the frontend -  we use that package to render the a JSX-like string to plain JS, without actually using JSX. Note use of backticks. If you are used to JSX, it can be switch to this style, but you get used to it in an app you are working on without JSX.

- [main.js](https://github.com/MichaelCurrin/preact-frontend-quickstart/blob/main/main.js) of Preact project, as per Preact docs.

From HTM docs:

- Preact sample.
    ```javascript
    import { render } from 'preact';
    import { html } from 'htm/preact';

    render(
      html`<a href="/">Hello!</a>`, 
      document.body
    );
    ```
- React sample.
    ```javascript
    import ReactDOM from 'react-dom';
    import { html } from 'htm/react';

    ReactDOM.render(
      html`<a href="/">Hello!</a>`,
      document.body
    );
    ```
- Generic sample.
    ```javascript
    import htm from 'htm';

    function h(type, props, ...children) {
      return { type, props, children };
    }

    const html = htm.bind(h);

    console.log( html`<h1 id=hello>Hello world!</h1>` );
    ```

Note that you can get just `html`, or use `htm/react` to get HTM and React together.

e.g. [dev.jspm.io/htm/react](https://dev.jspm.io/htm/react) or [dev.jspm.io/htm@3.0.4/react](https://dev.jspm.io/htm@3.0.4/react).

Currently React 17 is out but the URLs above only go to `react@16`.

Look at available browser modules, with a forward slash, [here](https://dev.jspm.io/htm/react).

For Preat, there is a highly-optimized single file version with both `htm` and `react`, as mentioned in the docs.

```javascript
import { html, render } from 'https://unpkg.com/htm/preact/standalone.module.js'
```
