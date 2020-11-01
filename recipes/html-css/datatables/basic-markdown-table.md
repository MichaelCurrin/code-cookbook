# Basic Markdown Table

See [Codepen demo](https://codepen.io/michaelcurrin/pen/ExKorNd)


## Setup steps

Based on [tutorial](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_tables.html#jquery-datatables) for Jekyll.

1. Add datatables CSS.
1. Add any custom CSS, like font-family.
1. Add jQuery JS.
1. Add jQuery datatable JS.
1. Add table (HTML, or Markdown with pre-processor in Codepen or your templating engine). No special class is needed, you just need to reference your table in the next step.
1. Add JS snippet to run jQuery DataTable setup your table.

You datatable will be generated. 


## Samples

- `styles.css`
    ```css
    body {
      font-family: Arial
    }
    ```
- `main.js` or inline `script` tag.
    ```javascript
    $(document).ready(function () {
      $("#example").DataTable();
    });
    ```
- `index.html` head tag:
    ```html
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    ```
- `index.html` body tag:
    ```html
    <h1>Datatables Markdown Demo</h1>
    
    <br>
    
    <div id="my-table">

    | Food    | Description                           | Category | Sample type |
    | ------- | ------------------------------------- | -------- | ----------- |
    | Apples  | A small, somewhat round ...           | Fruit    | Fuji        |
    | Bananas | A long and curved, often-yellow ...   | Fruit    | Snow        |
    | Kiwis   | A small, hairy-skinned sweet ...      | Fruit    | Golden      |
    | Oranges | A spherical, orange-colored sweet ... | Fruit    | Navel       |

    </div>
    ```
