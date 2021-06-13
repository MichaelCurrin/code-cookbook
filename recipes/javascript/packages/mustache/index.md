---
title: Mustache
---

{% raw %}

> Minimal templating with {{mustaches}} in JavaScript 

- [janl/mustache.js](https://github.com/janl/mustache.js) on GitHub
- [mustache](https://www.npmjs.com/package/mustache) on NPM


## Example

Here we fetch gists from the GitHub API and render the data in a list.

- `index.html`
    ```html
    <head>
        <script src="https://unpkg.com/mustache@latest"></script>
        <script src="assets/js/main.js"></script>
    </head>
      
    <body>
        <div id="target">
            <ol>
                <li>...</li>
                <li>...</li>
                <li>...</li>
                <li>...</li>
                <li>...</li>
                <li>...</li>
                <li>...</li>
                <li>...</li>
            </ol>
            <p><i>Loading...</i></p>
        </div>

        <script id="template" type="x-tmpl-mustache">
            <ol>
            {{ #gists }}
                <li>
                    <a href="{{ html_url }}">link</a> - <span>{{ description }}</span>
                </li>
            {{ /gists }}
            </ol>
        </script>

        <script>
            renderGists('MichaelCurrin');
        </script>
    </body>
    ```

The `renderTemplate` function here is generic and can be used across projects.

- `main.js`
    ```javascript
    function gistsUrl(username, limit = 100) {
      return `https://api.github.com/users/${username}/gists?per_page=${limit}`;
    }

    function renderTemplate(elId, data) {
      const template = document.getElementById('template').innerHTML;
      const rendered = Mustache.render(template, data);

      document.getElementById(elId).innerHTML = rendered;
    }

    async function renderGists(username) {
      const url = gistsUrl(username);
      console.debug(url);

      const resp = await fetch(url);
      const json = await resp.json();
      renderTemplate('target', { gists: json });
    }
    ```

{% endraw %}
