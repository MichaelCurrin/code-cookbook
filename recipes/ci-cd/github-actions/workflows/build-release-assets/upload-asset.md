# Upload asset

{% raw %}

This is a generic flow to take an artifact like an archive file and attach it to a GitHub release.


## Sample

This uses the [Upload Release Asset](https://github.com/actions/upload-release-asset) action and the sample is based on the README file example.

If you need to compile for Windows, macOS and Linux separately, you could run this multiple times using `runs-on` or similar. Maybe your tool supports cross platform compilation on a single OS already.

- `release.yml`
    ```yaml
    name: Upload Release Asset
    
    on:
      push:
        tags:
        - 'v*'

    jobs:
      build:
        name: Upload Release Asset

        runs-on: ubuntu-latest

        steps:
          - name: Checkout code
            uses: actions/checkout@v2
            
          # This would actually build your project, here using zip for an example artifact.
          - name: Build project
            run: zip --junk-paths my-artifact README.md
              
          - name: Create Release
            id: create_release
            uses: actions/create-release@v1
            env:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
            with:
              tag_name: ${{ github.ref }}
              release_name: Release ${{ github.ref }}
              draft: false
              prerelease: false
              
          - name: Upload Release Asset
            id: upload-release-asset 
            uses: actions/upload-release-asset@v1
            env:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
            with:
              upload_url: ${{ steps.create_release.outputs.upload_url }} # This pulls from the CREATE RELEASE step above, referencing it's ID to get its outputs object, which include a `upload_url`. See this blog post for more info: https://jasonet.co/posts/new-features-of-github-actions/#passing-data-to-future-steps 
              asset_path: my-artifact.zip
              asset_name: my-artifact.zip
              asset_content_type: application/zip
    ```


{% endraw %}
