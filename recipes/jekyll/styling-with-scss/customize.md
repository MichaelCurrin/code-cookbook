---
description: How to use SCSS to set and override styles
---
# Customize

In Jekyll, you can use SCSS as a preprocessor - this helps for nest styles, handling variables and allowing imports.

The way you apply it is using `.scss` files in the `assets/` and in `_sass/` (which is Jekyll's default SCSS directory). If you add an `@import` in assets, you'll get a compiled result that loads a file with `url()` and this loads as a separate request in the browser. If you do any imports within the `_sass` directory, you'll get your styling bundled in a single large file.

See [Assets](https://jekyllrb.com/docs/step-by-step/07-assets/) in step 7 of the tutorial in the Jekyll docs. And see my [Jekyll Blog Demo](https://github.com/MichaelCurrin/jekyll-blog-demo) repo which is the result of following the tutorial.

Instructions below are collected from themes.


## Minima theme

How to customize a site using the [Minima](https://github.com/jekyll/minima) theme.

### Version 2.5

Based on the README, create a file like this.


Note the filename, frontmatter, import and then custom content.

This will bundle the theme's SASS files with your own content to produce a single plain CSS `assets/main.css` file.


Example:

- `assets/main.scss`
  ```scss
  ---
  ---

  @import "minima";

  a {
    color: blue;
  }
  ```

Here is the doc reference for Minima's SASS files:

> Refers to `.scss` files within the `_sass` directory that define the theme's styles.
>
>  - `minima.scss` &mdash; The core file imported by preprocessed `main.scss`, it defines the variable defaults for the theme and also further imports sass partials to supplement itself.
>  - `minima/_base.scss` &mdash; Resets and defines base styles for various HTML elements.
>  - `minima/_layout.scss` &mdash; Defines the visual style for various layouts.
>  - `minima/_syntax-highlighting.scss` &mdash; Defines the styles for syntax-highlighting.


## Version 3.X

See this part of the Minima docs for customizing.

- [Usage](https://github.com/jekyll/minima#usage)

Overriding just color variables is covered here for `_sass` directory:

> In Minima 3.0, if you only need to customize the colors of the theme, refer to the subsequent section on skins. To have your CSS overrides in sync with upstream changes released in future versions, you can collect all your overrides for the Sass variables and mixins inside a sass file placed at `_sass/minima/custom-variables.scss` and all other overrides inside a sass file placed at path `_sass/minima/custom.scss`.

It is not clear from the docs, but it looks like in addition to the above, you must create a styles file under `assets`.

Example:

- `assets/css/styles.scss`
    ```
    ---
    ---

    @import "minima/skins/{{ site.minima.skin | default: 'classic' }}";
    @import "minima/initialize";
    ```

Description:

> - Front matter dashes at the very beginning (can be empty).
> - Directive to import a skin.
> - Directive to import the base styles (automatically loads overrides when available)


## Architect theme

### Latest


- `assets/css/style.scss`
    ```scss
    ---
    ---

    @import "{{ site.theme }}";
    ```

Add any custom CSS (or Sass, including imports) you'd like immediately after the `@import` line

_Note: If you'd like to change the theme's Sass variables, you must set new values before the `@import` line in your stylesheet._
