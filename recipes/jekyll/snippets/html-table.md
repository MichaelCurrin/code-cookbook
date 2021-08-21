---
title: HTML table
---

Read a CSV and render as a table.

This works also with a Liquid variable or a YAML or JSON file in `_data` too. You just need to set up your data as rows.

See also [Tabulate CSV Data](https://jekyllrb.com/tutorials/csv-to-table/) on the Jekyll docs.

{% raw %}


## HTML vs Markdown

Warning - you may have indention issues inside a Markdown file - where indented lines get turned into codeblocks instead of HTML. 

To solve this, either make sure your page is `.html`. Or for a `.md` page, makes sure your includes file HTML.

e.g.

- `index.md`
    ```liquid
    ---
    authors:
      # ...
    ---

   {% include table.html table_rows = page.authors %}
    ```


## From CSV

This approaches uses Liquid to iterate through the rows of CSV data.

In the case of the _first_ row, that is the header, so the HTML `th` tag is used.

Otherwise use the `tablerow` tag, which makes generates `tr` with `td` inside it, saving you some code.

- `_data/authors.csv`
    ```
    First name,Last name,Age,Location
    John,Doe,35,United States
    Jane,Doe,29,France
    Jack,Hill,25,Australia
    ```
- `index.html`
    ```liquid
    ---
    title: Table test
    ---
    
   {% assign table_rows = site.data.authors %}

    <table>
        {% for row in table_rows %}
            {% if forloop.first %}
                <tr>
                    {% for pair in row %}
                        <th>
                            {{ pair[0] }}
                        </th>
                    {% endfor %}
                </tr>
            {% endif %}

            {% tablerow pair in row %}
                {{ pair[1] }}
            {% endtablerow %}
        {% endfor %}
    </table>
    ```

Or make it into an includes file which you pass table row data.


## From YAML

Here the data is set in the frontmatter as a variable. This could equally be in the Jekyll config or a YAML file in `_data` directory.

Set up your data like this:

- `index.md`
    ```liquid
    ---
    authors:
      # ...
    ---

   {% include table.html table_rows = page.authors %}
    ```

{% endraw %}

Then the same templating code in previous section is used.

See [Table demo](https://michaelcurrin.github.io/fractal/table-demo.html) in the Fractal theme's site for a working example.


## Code

If you want to add codeblocks in your table, use `<code>` tag. Don't use `<pre>`, as then you text will stay on one line and will **not** wrap, leading to the table going off screen to the right.

{% raw %}

```liquid
{% tablerow pair in row %}
   <code>{{ pair[1] }}</code>
{% endtablerow %}
```

{% endraw %}
