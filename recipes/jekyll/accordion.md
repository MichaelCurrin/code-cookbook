# Accordion

{% raw %}

## Details HTML tag

Use the `details` and `summary` tags - these work on Github markdown, Jekyll, Docsify and others. No CSS or JS need.


### Simple use


**Code**

```html
<details>
<summary><b>My title</b></summary>
My expanded details
</details>
```

**Result**

<details>
<summary><b>My title</b></summary>
My expanded details
</details>

---


## Nesting

You can nest accordion items.

**Code**

```html
<details>
<summary><b>Outer title</b></summary>
Outer details
<details>
    <summary><b>Inner title</b></summary>
    Inner details
    </details>
</details>
```

**Result**

<details>
<summary><b>Outer title</b></summary>
Outer details
    <details>
    <summary><b>Inner title</b></summary>
    Inner details
    </details>
</details>

---
Just be sure to not use indenting for the inner item, or just make sure there are no empty lines as above. Otherwise your indented HTML becomes markdown code blocks.

If you need to style the inner and outer items differently, you can add divs or classes or a CSS selector which only applies to details inside details.


### Jekyll templating use

Create an includes file and use it on a page.

- `_includes/accordion.html` - or whatever name you like.
    ```html
    <details>
       <summary>
           <b>{{ include.title }}</b>
       </summary>
       {{ include.description }}
    </details>
    ```
- `index.md`
    ```markdown
    ---
    layout: null
    ---

    # Accordion test

    {% include accordion.html
        title="This is my title"
        description="This is my description"
    %}
    ```
    

## Plugin

See also [Creating an Accordion Plugin for Jekyll - No TV and No Beer 6](http://mikelui.io/2018/07/22/jekyll-nested-blocks.html) - this is a heavier approach which involves writing two Ruby plugins.


## Custom CSS approach

This is similar to using the [Details tag](#details-tag) but uses HTML tags with custom CSS - which is a lot heavier but allows more customization. This approach can be used with an includes files too.

From [Implementing A Pure CSS Collapsible](https://alligator.io/css/collapsible/)

- `accordion.html`
    ```html
    <div class="wrap-collapsible">
        <input id="collapsible" class="toggle" type="checkbox">
       
        <label for="collapsible" class="lbl-toggle">
            {{ include.title }}
        </label>

        <div class="collapsible-content">
            <div class="content-inner">
                <p>
                    {{ include.description }}
                </p>
            </div>
        </div>
    </div>
    ```
- `index.md`
    ```markdown
    ---
    layout: null
    ---

    # Accordion test

    {% include accordion.html
        title="This is my title"
        description="This is my description"
    %}
    ```
- `styles.css`
    ```css
    .wrap-collabsible {
      margin-bottom: 1.2rem 0;
    }

    input[type='checkbox'] {
      display: none;
    }

    .lbl-toggle {
      display: block;

      font-weight: bold;
      font-family: monospace;
      font-size: 1.2rem;
      text-transform: uppercase;
      text-align: center;

      padding: 1rem;

      color: #A77B0E;
      background: #FAE042;

      cursor: pointer;

      border-radius: 7px;
      transition: all 0.25s ease-out;
    }

    .lbl-toggle:hover {
      color: #7C5A0B;
    }

    .lbl-toggle::before {
      content: ' ';
      display: inline-block;

      border-top: 5px solid transparent;
      border-bottom: 5px solid transparent;
      border-left: 5px solid currentColor;
      vertical-align: middle;
      margin-right: .7rem;
      transform: translateY(-2px);

      transition: transform .2s ease-out;
    }

    .toggle:checked + .lbl-toggle::before {
      transform: rotate(90deg) translateX(-3px);
    }

    .collapsible-content {
      max-height: 0px;
      overflow: hidden;
      transition: max-height .25s ease-in-out;
    }

    .toggle:checked + .lbl-toggle + .collapsible-content {
      max-height: 100vh;
    }

    .toggle:checked + .lbl-toggle {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .collapsible-content .content-inner {
      background: rgba(250, 224, 66, .2);
      border-bottom: 1px solid rgba(250, 224, 66, .45);
      border-bottom-left-radius: 7px;
      border-bottom-right-radius: 7px;
      padding: .5rem 1rem;
    }
    ```

{% endraw %}
