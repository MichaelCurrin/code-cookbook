# VS Code extension

This uses the standard Create Release and Upload Release actions.

Copied from [cschleiden/vscode-github-actions](https://github.com/cschleiden/vscode-github-actions/blob/master/.github/workflows/build-preview.yml).

- `build-preview.yml`
    ```yaml
    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v2
          
          - uses: actions/setup-node@v2-beta
            with:
              node-version: '12'
              
          - run: rm package-lock.json
          - run: npm --no-git-tag-version version 1.0.${{ github.run_number }}
          - run: npm install
          - run: npm run package
          
          - name: Create Release
            id: create_release
            uses: actions/create-release@v1
            env:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
            with:
              tag_name: build-${{ github.run_number }}
              release_name: Nightly Build ${{ github.run_number }}
              draft: false
              prerelease: false
              
          - name: Upload Release Asset
            id: upload-release-asset
            uses: actions/upload-release-asset@v1
            env:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
            with:
              upload_url: ${{ steps.create_release.outputs.upload_url }}
              asset_path: vscode-github-actions-1.0.${{ github.run_number }}.vsix
              asset_name: vscode-github-actions-1.0.${{ github.run_number }}.vsix
              asset_content_type: application/vsix
    ```

The Create Release section needs an underscore for the ID so it can be referenced in the last step.

The asset path and asset name part are both the same - perhaps there is a shorter way like only setting one or referencing one in the other.

Here are the script commands:

- `package.json`
    ```json
    {
      "scripts": {
        "clean": "rimraf dist out",
        "compile": "tsc -p .",
        "watch": "tsc -watch -p .",
        "package": "npm run clean && vsce package",
        "vscode:prepublish": "webpack --mode production",
        "webpack": "webpack --mode development",
        "webpack-dev": "webpack --mode development --watch",
        "test-compile": "tsc -p ."
      }
    }
    ```
