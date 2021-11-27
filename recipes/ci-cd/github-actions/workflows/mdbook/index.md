# mdBook

{% raw %}

## Simple package management and generic deploy

Set up Rust, install with Rust, and use build and generic deploy 

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


## No Rust and use a generic deploy

Use curl to skip Rust and then do build and generic deploy.

Based on [webdevph2/resources](https://github.com/webdevph2/resources/blob/main/.github/workflows/main.yml).

- `main.yml`
    ```yaml
    name: GitHub Pages Deploy
    
    on:
      push:
        branches: [ main ]
      pull_request:
        branches: [ main ]

    env:
      MDBOOK_VERSION: v0.4.12
      
    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - name: heckout
            uses: actions/checkout@v2

          - name: Download mdBook
            run: |
              curl -L https://github.com/rust-lang/mdBook/releases/download/${MDBOOK_VERSION}/mdbook-${MDBOOK_VERSION}-x86_64-unknown-linux-gnu.tar.gz \
                > mdbook.tar.gz

          - name: Unzip
            run: tar -zxvf ./mdbook.tar.gz

          - name: Build
            run: ./mdbook build

          - name: Deploy to GH Pages
            if: ${{ github.event_name != 'pull_request' }}
            uses: peaceiris/actions-gh-pages@v3
            with:
              github_token: ${{ secrets.GITHUB_TOKEN }}
              publish_dir: book
        ```

{% endraw %}
