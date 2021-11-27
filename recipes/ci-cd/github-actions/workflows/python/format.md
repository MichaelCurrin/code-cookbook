# Format

This section uses a workflow to apply formatting with GitHub Actions and commit the results.

## Notes

Based on [post](https://dev.to/mritunjay394/how-to-automate-code-formatting-for-python-projects-with-github-actions-a-study-47g8).

It uses `yapf` - I prefer using `black` and `flake8`.

Also I prefer to apply formatting locally by hand or with a push hook and to check formatting and linting on a workflow run, without changing code in the cloud. And then the local code is more consistent with what is on the remote and also you don't have to pull after every push.

But I include this flow anyway for interest of the pieces.


## Sample

```yaml
name: Format Python code
on:
  push:
    paths:
    - '**.py'

jobs:
  format:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@master
        with:
          ref: ${{ github.head_ref }}

      - name: autoyapf
        uses: mritunjaysharma394/autoyapf@v2
        with:
          args: --style pep8 --recursive --in-place .

      - name: Check for modified files
        id: git-check
        run: echo ::set-output name=modified::$(if git diff-index --quiet HEAD --; then echo "false"; else echo "true"; fi)

      - name: Push changes
        if: steps.git-check.outputs.modified == 'true'
        run: |
          git config --global user.name '...'
          git config --global user.email '...@users.noreply.github.com'
          git remote set-url origin https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}
          git commit -am "Apply autoyapf fixes"
          git push
```

You can change email and name to actions or your name or make it dynamic.
