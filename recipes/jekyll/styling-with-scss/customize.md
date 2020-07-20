# Jekyll SCSS styling
> How to use SCSS to set and override styles


## Minima 

How to customize a site using the Minima theme.

### Version 2.5

Based on the README, create a file like this. 


Note the filename, frontmatter, import and then custom content.

This will bundle the theme's SASS files with your own content to produce a single plain CSS `assets/main.css` file.

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
