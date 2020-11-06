# Commit
> How to use a generic Action to commit files during the CI flow.


## Use-cases

When you might want to create and persist changes in CI:

- Binary files for distribution
    - Compiled file for C, Go, Rust, etc.
    - Archive file for a Ruby gem or VS Code Extension.
    - A `dist` directory of JS files.
- Static assets for serving on GH Pages 
    - Built with a static site generator like Jekyll.
    - Build wih `npm run build`.
- Doc changes in `README.md`
    - Update list of contributors.
    - Update table of contents.


## Sample

### Publish to GitHub Action

This uses an action maintained by GitHub - [actions/push-new-files-back-to-master](https://github.com/marketplace/actions/push-new-files-back-to-master).

- `main.yml`
    ```yaml
    steps:
      - run: # Build site...

      - uses: mikeal/publish-to-github-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    ```

If you don't want to commit to master, you can specify a branch in `env` like so:

```
BRANCH_NAME: my-branch
```

If you look at the code in the action, this is what is does (excluding validating variables and working with GitHub LFS).

I've refactored it.

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


### Notes on the shell script

This action works on the root and doesn't let you target a build directory like `_site`. So this is not a good idea for GH Pages. Even if you switch from `master` to `gh-pages` and your `.md` files are gone, your unversioned files (cache and gems) won't be ignored properly and would be committed unnecessarily.

It looks like the clone is built into the standard workflow itself, so this doesn't have a clone step.

The rebase might not do be useful if you are already up to date, unless there is something that gets committed between the start of the run and that pull step. Maybe the pull should be done before the commit? Note that you can't do a pull with a rebase unless you stage changes first.

This will only work if the branch already exists, as it does not use `-b` in checkout.
