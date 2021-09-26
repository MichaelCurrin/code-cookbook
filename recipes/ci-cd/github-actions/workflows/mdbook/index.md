# mdBook


## Generic

- [main.yml](https://github.com/MichaelCurrin/mdbook-quickstart/blob/main/.github/workflows/main.yml) in `MichaelCurrin/mdbook-quickstart`.

That will

1. Set up Rust.
1. Install the package using a `make` command that does this:
    ```sh
    $ cargo install mdbook
    ```
1. Build the site using a `make` command that does this:
    ```sh
    $ mdbook build
    ```
1. Then the output is committed to the the `gh-pages` branch with a generic GitHub Pages action. It doesn't care what tools were used before it, as long as there is static content for it to use.


