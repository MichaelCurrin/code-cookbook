---
title: HTML table

authors:
  - 'First name': John
    'Last name': Doe
    Age: 35
    Location: United States
  - 'First name': Jane
    'Last name': Doe
    Age: 29
    Location: France
  - 'First name': Jack
    'Last name': Hill
    Age: 25
    Location: Australia
---

Read a CSV and render as a table.

This works also with a Liquid variable or a YAML or JSON file in `_data` too. You just need to set up your data as rows.

See also [Tabulate CSV Data](https://jekyllrb.com/tutorials/csv-to-table/) on the Jekyll docs.

{% raw %}


## From CSV

This approaches uses Liquid to iterate through the rows of CSV data.

In the case of the _first_ row, that is the header, so the HTML `th` tag is used.

Otherwise use the `tablerow` tag, which makes generates `tr` with `td` inside it, saving you some code.

- `_data/authors.csv`
    First name,Last name,Age,Location
    John,Doe,35,United States
    Jane,Doe,29,France
    Jack,Hill,25,Australia
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

### HTML vs Markdown

Warning - you may have indention issues inside a Markdown file - where indented lines get turned into codeblocks instead of HTML. 

To solve this, either make sure your page is `.html`. Or for a `.md` page, makes sure your includes file HTML.

e.g.

- `index.md`
```
---
---

{% assign table_rows = site.data.authors %}

{% include table.html table_rows=table_rows %}

```

{% endraw %}


## From YAML

Here the data is set in the frontmatter as a variable. This could equally be in the Jekyll config or a YAML file in `_data` directory.

Set up your data like this:

```liquid

authors:
  - 'First name': John
    'Last name': Doe
    Age: 35
    Location: United States
  - 'First name': Jane
    'Last name': Doe
    Age: 29
    Location: France
  - 'First name': Jack
    'Last name': Hill
    Age: 25
    Location: Australia
---

{% assign table_rows = page.authors %}
```

Then the same templating code in previous section is used.
