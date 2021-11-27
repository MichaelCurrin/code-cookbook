# Create release

{% raw %}

Create a release in GitHub. A release is always associated with a tag, so the tag must exist or it will be created. 

The release can have a title, body, and optionally any assets you want to attach like compiled files for distribution.


## Create release 

This uses the [Create Release](https://github.com/actions/create-release) action and is based on the doc's example.

Warning- this action is archived. The docs recommend:

* [elgohr/Github-Release-Action](https://github.com/elgohr/Github-Release-Action)
* [marvinpinto/action-automatic-releases](https://github.com/marvinpinto/action-automatic-releases)
* [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
* [ncipollo/release-action](https://github.com/ncipollo/release-action)

Sample:

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
              draft: false
              prerelease: false
    ```

I don't know what the point is of setting the body as that will change each time. Maybe if you have some changelog text file to read from. Otherwise go and edit the body of the created release.

```yaml
            with:
              body: |
                Changes in this Release
                - First Change
                - Second Change
```

## GitHub Release Action

[link](https://github.com/elgohr/Github-Release-Action)

The docs and functionality are limited compared with the action covered above.

Sample:

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

The docs say this but probably not true as the other action uses the token fine.

> Please note, that you can't use ${{ secrets.GITHUB_TOKEN }} as it isn't allowed to publish releases.

{% endraw %}
