---
title: Embed
description: How fetch a file by URL and insert as a code snippet
---


## Example

### Page containing content

Given a target page `about.md` in the root of of [jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo) repo. In this case, it a markdown page for a Jekyll site, but you could reference a file in any programming language.

That will have the following GitHub URLs:

- File URL for humans to browser: [github.com/MichaelCurrin/jekyll-blog-demo/blob/master/about.md](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/about.md).
- Raw content as a plain text for machines to read: [raw.githubusercontent.com/MichaelCurrin/jekyll-blog-demo/master/about.md](https://raw.githubusercontent.com/MichaelCurrin/jekyll-blog-demo/master/about.md).

### Target output
Setup the target code snippet element with empty text.

```html
<pre><code id="target"></code></pre>
```

Keep it on one line to avoid unnecessary whitespace.

### Script

Use JavaScript to fetch the content and insert it in the empty element.

```javascript
const USERNAME = 'MichaelCurrin'
const REPO_NAME = 'jekyll-blog-demo'

const path = 'about.md'
const url = `https://github.com/${USERNAME}/${REPO_NAME}/blob/master/${path}`
const resp = await fetch(url)
const content = await resp.text()

const target = document.getElementById('target')
target.innerText = content
```

Now the code block will look something like:

```html
<pre><code id="target">
---<br>title: About<br>layout: page<br>permalink: /about/<br>---<br><br>This is the base Jekyll theme...
</code></pre>
```

This could be worked into a function called and then used on pages as needed.

See [Fetch](https://javascript.info/fetch) tutorial.


## Extending

If you had multiple elements, you could use classes on them and use a JS `for` loop to process each, instead of relying on known an ID. 

Or you could even use a data attribute so the element knows what its file should be.

Or you could add a JS event on the HTML element:

```html
<code onload="codeblock('about.md')"></code>
```

Note that the example here only displays a code snippet in monospace but plain black and white. 

You'll want to use a library like [highlight.js](https://highlightjs.org/) if you want language-specific highlighting like:

```html
<pre><code id="target" class="markdown"></code></pre>
```

In the case of a Jekyll site, you might know the language when you setup your code fence blocks or `highlight` Liquid tag.

