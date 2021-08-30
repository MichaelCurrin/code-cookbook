---
title: GitHub Pages
description: Use plain Git to build and push `gh-pages` branch
---

Assumptions:

- You want to push to the root of the `gh-pages` branch.
- Your GitHub repo is configured to serve the root of your `gh-pages` branch.
- Your content to build against is in a subdirectory `book` - below for mdBook.
- Output directory is `build`.

Rather than adding to a `.sh` script, add to `Makefile`.

- `Makefile
    ```make
    deploy:
        git worktree add /tmp/book gh-pages

        rm -rf /tmp/book/*
        cp -rp book/* /tmp/book/

        cd /tmp/book \
            && git add -A \
            && git commit -m "ci: deploy on $(shell date) by ${USER}" \
            && git push origin gh-pages
    ```
    
Then run this either locally or your CI steps such as on GitHub Actions

```sh
$ make deploy
```

Based on [guide](https://rust-lang.github.io/mdBook/continuous-integration.html).
