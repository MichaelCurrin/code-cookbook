# Branches

## Move content across branches

Here there is work on a feature branch `my-feat` which is not related to the feature. And this work is brought into the `main` branch, but without doing a merge or adding commits.

```sh
$ git checkout main
```

Point the main branch at the feature branch. Using `--hard` for a clean state, otherwise you'll have changes which would reverse the changes of the branch.

```sh
$ git reset --hard my-feature
```

Point main back at the pushed main, but keeping the changes from `my-feat`.

```sh
$ git reset origin/main
```

Now any code you like from the feature branch you can stage and commit.

```sh
$ git commit # ...
```

And then you can get remove any changes you don't want which belong on the feature branch still.

```sh
$ git checkout .
```

Finally, push your changes and bring the main changes into to the feature branch. The feature branch should have a small diff when viewed in a PR.
