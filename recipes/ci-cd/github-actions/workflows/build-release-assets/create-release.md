# Create release

{% raw %}

Create a release in GitHub. A release is always associated with a tag, so the tag must exist or it will be created. The release can have a title, description, and optionally any assets you want to attach like compiled files for distribution.

## Create release 

This uses the [Create Release](https://github.com/actions/create-release) action and is based on the doc's example.

- `main.yml`
    ```yaml
    name: Create Release
    
    on:
      push:
        tags:
          - 'v*'

    jobs:
      build:
        name: Create Release

        runs-on: ubuntu-latest
        
        steps:
          - name: Checkout code
            uses: actions/checkout@v2
            
          - name: Create Release
            id: create_release
            uses: actions/create-release@v1
            env:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
            with:
              tag_name: ${{ github.ref }}
              release_name: Release ${{ github.ref }}
              body: |
                Changes in this Release
                - First Change
                - Second Change
              draft: false
              prerelease: false
    ```

## GitHub Release Action

[link](https://github.com/elgohr/Github-Release-Action)

```yaml
    name: Create Release
    
    on:
      push:
        tags:
          - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Create a release
        uses: elgohr/Github-Release-Action@master
        env:
          GITHUB_TOKEN: ${{ secrets.RELEASE_TOKEN }}
        with:
          args: MyReleaseMessage

> Please note, that you can't use ${{ secrets.GITHUB_TOKEN }} as it isn't allowed to publish releases.

{% endraw %}
