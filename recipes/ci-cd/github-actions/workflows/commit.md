---
title: Commit
description: How to commit files during the CI flow - using a generic Action
---


## Related 

- [Create Pull Request][] workflows - some will commit for you so you don't need a separate commit step.

[Create Pull Request]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/create-pull-request.md %}


{% raw %}


## Use-cases

Some situations when you might want to add/edit and commit files all during a single CI run.

- Binary files for distribution.
    - Compiled file for C, Go, Rust, etc.
    - An archive file for a Ruby gem or VS Code Extension.
    - A `dist` directory of JS files.
- Static assets for serving on GH Pages.
    - Build with a static site generator like Jekyll, Hugo or Gatsby.
    - Build your Node app with `npm run build`.
- Doc changes in `README.md`.
    - Update a list of contributors. (A GH bot can handle this for you)
    - Update a table of contents.
- Code changes.
    - Perform lint fixes. 
    - Perform package upgrades.


## Samples

A placeholder step is used to modify files in the workspace. Replace it with something more suitable. Such as building your app or applying lint and formatting fixes.

### No action

A simple way to commit any changes on the current branch. This is slightly verbose but not too long. You know exactly what it is doing and it is easy to customize.

- `main.yml`
    ```yaml
    steps:
      - name: Checkout
        # uses: ...
        
      - name: Build
        # run: ...

      - name: Check for modified files
        id: git-check
        run: echo ::set-output name=modified::$(if git diff-index --quiet HEAD --; then echo "false"; else echo "true"; fi)

      - name: Commit changes
        if: steps.git-check.outputs.modified == 'true'
        run: |
          git config --global user.name 'Automated Publisher'
          git config --global user.email 'actions@users.noreply.github.com'
          git commit -am "Commit message..."
          
          git remote set-url origin "https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}"
          git push
    ```

The commit step will commit _all_ file changes - both modified files and previously untracked files that got created for the first time.

```
    -a, --all             commit all changed files
```

This uses a branch that already exists (whether a feature branch or `master`), so you don't need give extra options to `git push`.

### Use the Publish to GitHub action

Use this action to commit and push your changes to either the current branch or a given branch. If on another branch, you'll need an action to make a [Pull Request][Create Pull Request].

See [push-new-files-back-to-master](https://github.com/marketplace/actions/push-new-files-back-to-master) Action in the GH Marketplace.

> A GitHub Action to push any local file changes, including new files, back to supplied branch name.
>
> This action is useful to put after other actions that modify files in the local checkout that you'd then like to persist back into the repository.

- `main.yml`
    ```yaml
    steps:
      - name: Checkout
        # uses: ...
        
      - name: Build
        # run: ...

      - name: Commit changes
        uses: mikeal/publish-to-github-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    ```

Currently there's only a `1.0.0` tag of the Action - I don't know if `@v1` will work here. But it is worth locking rather than the floating `@master`.

Specify another branch of yours, instead of the `master` default.

```yaml
BRANCH_NAME: main
```

If you look at the code in the action, this is what is does (excluding validating variables and working with GitHub LFS).

I've refactored it and added below:

- `entrypoint.sh`
    ```sh
    # Initialize git.
    REMOTE_REPO="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

    git config http.sslVerify false
    git config user.name "Automated Publisher"
    git config user.email "actions@users.noreply.github.com"
    git remote add publisher "${REMOTE_REPO}"
    git show-ref  # Useful for debugging
    git branch --verbose

    # Publish any new files.
    git checkout ${BRANCH_NAME}
    git add -A
    TIMESTAMP=$(date -u)
    git commit -m "Automated publish: ${TIMESTAMP} ${GITHUB_SHA}" || exit 0
    git pull --rebase publisher ${BRANCH_NAME}
    git push publisher ${BRANCH_NAME}
    ```

#### Notes on the shell script

This action works on the root and doesn't let you target a build directory like `_site`. So this is not a good idea for GH Pages. Even if you switch from `master` to `gh-pages` and your `.md` files are gone, your unversioned files (cache and gems) won't be ignored properly and would be committed unnecessarily.

It looks like the clone is built into the standard workflow itself, so this doesn't have a clone step.

The rebase might not do be useful if you are already up to date, unless there is something that gets committed between the start of the run and that pull step. Maybe the pull should be done before the commit? Note that you can't do a pull with a rebase unless you stage changes first.

This will only work if the branch already exists, as it does not use `-b` in checkout.

For comparison, there is a similar action dedicated to GitHub Pages, but it uses TypeScript and has a lot more files.

- [peaceiris/actions-gh-pages](https://github.com/peaceiris/actions-gh-pages)

{% endraw %}
