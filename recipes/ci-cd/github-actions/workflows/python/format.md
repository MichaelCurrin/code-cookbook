# Format

This section uses a workflow to apply formatting with GitHub Actions and commit the results.

## Notes

Based on [post](https://dev.to/mritunjay394/how-to-automate-code-formatting-for-python-projects-with-github-actions-a-study-47g8).

It uses `yapf` - I prefer using `black` and `flake8`.

Also I prefer to apply formatting locally by hand or with a push hook and to check formatting and linting on a workflow run, without changing code in the cloud. And then the local code is more consistent with what is on the remote and also you don't have to pull after every push.

But I include this flow anyway for interest of the pieces.


## Sample

{% raw %}

```yaml
name: Format Python code

on:
- pull_request
    paths:
      - "**.py"

jobs:
  format:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@master
        with:
          ref: ${{ github.head_ref }}

      - name: Format
        uses: mritunjaysharma394/autoyapf@v2
        with:
          args: --style pep8 --recursive --in-place .

      - name: Check for modified files
        id: git-check
        run: echo ::set-output name=modified::$(if git diff-index --quiet HEAD --; then echo "false"; else echo "true"; fi)

      - name: Push changes
        if: steps.git-check.outputs.modified == 'true'
        run: |
          git config --global user.name 'abc'
          git config --global user.email 'abc123@users.noreply.github.com'
          git remote set-url origin https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}
          git commit -am "Apply format fixes"
          git push
```

The Format step can use Black or similar tools if you prefer.

Using [rickstaa/action-black](https://github.com/rickstaa/action-black/):

```yaml
steps:
  - name: Format
    uses: rickstaa/action-black@v1
    id: action_black
    with:
      black_args: "."
```

Then use conditional step for whether to commit or not.

```yaml
  - name: Commit
    if: steps.action_black.outputs.is_formatted == 'true'
```

{% endraw %}

You can change email and name to actions or your name or make it dynamic.
