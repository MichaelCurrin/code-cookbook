# HTML table

Read a CSV and render as a table.

This works also with a Liquid variable or a YAML or JSON file in `_data` too. You just need to set up your data as rows.

See also [Tabulate CSV Data](https://jekyllrb.com/tutorials/csv-to-table/) on the Jekyll docs.

{% raw %}

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

    <table>
        {% for row in site.data.authors %}
            {% if forloop.first %}
                <tr>
                    {% for pair in row %}
                    <th>{{ pair[0] }}</th>
                    {% endfor %}
                </tr>
            {% endif %}

            {% tablerow pair in row %}
                {{ pair[1] }}
            {% endtablerow %}
        {% endfor %}
    </table>
    ```

Or make it into an includes file.

{% endraw %}
