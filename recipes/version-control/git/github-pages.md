---
title: GitHub Pages
description: Use plain Git to build and push `gh-pages` branch
---

Assumptions:

- You want to push to the root of the `gh-pages` branch.
- Your GitHub repo is configured to serve the root of your `gh-pages` branch.
- Output directory is `build`.

Rather than adding to a `.sh` script, add to `Makefile`.

- `Makefile
    ```make
    deploy:
        git worktree add /tmp/build gh-pages

        rm -rf /tmp/build/*
        cp -rp build/* /tmp/build/

        cd /tmp/build \
            && git add -A \
            && git commit -m "ci: deploy on $(shell date) by ${USER}" \
            && git push origin gh-pages
    ```
    
Then run this either locally or your CI steps such as on GitHub Actions.

```sh
$ make deploy
```

Based on [guide](https://rust-lang.github.io/mdBook/continuous-integration.html).
