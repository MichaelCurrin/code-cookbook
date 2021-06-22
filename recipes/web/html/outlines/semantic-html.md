---
title: Semantic HTML
description: Here the focus is on HTML5 elements in the body, like `section` and `aside`
---


## Tags

Read more in [HTML Semantic Elements](https://www.w3schools.com/html/html5_semantic_elements.asp) guide.

- [Main](https://www.w3schools.com/tags/tag_main.asp)
    - The main content of the document. 
    - Only _one_ on the page.
    - The `main` element must NOT be a descendant of an `article`, `aside`, `footer`, `header`, or `nav` element.
- **Section** - A thematic grouping of content, typically with a heading. A web page could normally be split into sections for introduction, content, and contact information.
- **Article** - independent, self-contained content. It make sense on its own and it should be possible to distribute it independently of the site. e.g. forum post, blog post, newspaper article.
- **Aside** - Defines some content aside from the content it is placed in. Like a sidebar.


## Sample

- `index.html`
    ```html
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>My Title</title>
        <meta name="description" content="My description">

        <link rel="stylesheet" href="">

        <style>
            /* CSS styles */

        </style>

        <script src="/js/main.js"></script>

        <script>
            // JavaScript.

        </script>

    </head>

    <body>
        <header>
            <nav>
            </nav>
        </header>
        
        <main>
            <h1></h1>
            
            <section>
                <h2></h2>

                <p></p>
            </section>

            <section>
                <h2></h2>

                <p></p>
            </section>

            <article>
                <h2></h2>

                <p></p>
            </article>

            <article>
                <h2></h2>

                <p></p>
            </article>

            <aside>
            </aside>

            <footer>
            </footer>
        </main>
    </body>

    </html>
    ```
