---
title: Low-level
description: How to save an output build directory for use on GH Pages, using steps without Actions
---

{% raw %}

You may want to rather use an Action covered in the other pages, as then you don't have to write and maintain the code yourself and the Action is easier to reuse across projects.

But these steps are useful to understand what that an action is doing. Maybe you want to use some of this flow or write your own action.


## Sample

Note this leaves out the step to actually build the site and just focuses on committing.

- `main.yaml`
    ```yaml
    steps:
        - name: Clone target branch
          run: |
            REMOTE_BRANCH="${REMOTE_BRANCH:-gh-pages}"
            REMOTE_REPO="https://${GITHUB_ACTOR}:${{ secrets.GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}.git"
            echo "Publishing to ${GITHUB_REPOSITORY} on branch ${REMOTE_BRANCH}"
            rm -rf _site/
            git clone --depth=1 --branch="${REMOTE_BRANCH}" --single-branch --no-checkout \
              "${REMOTE_REPO}" docs/_site/

        - name: Build site
          run: # ...

        - name: Deploy to GitHub Pages
          run: |
            SOURCE_COMMIT="$(git log -1 --pretty="%an: %B" "$GITHUB_SHA")"
            pushd _site &>/dev/null
            : > .nojekyll
            git add --all
            git -c user.name="${GITHUB_ACTOR}" -c user.email="${GITHUB_ACTOR}@users.noreply.github.com" \
              commit --quiet \
              --message "Deploy docs from ${GITHUB_SHA}" \
              --message "$SOURCE_COMMIT"
            git push
            popd &>/dev/null
    ```

{% endraw %}
