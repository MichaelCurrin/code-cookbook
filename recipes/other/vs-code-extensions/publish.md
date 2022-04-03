---
title: Publish

description: How to publish a VS Code extension to the Marketplace using Azure DevOps
---

## Set up project

1. Make a GitHub repo.
    - For structure, see VS Code's docs or see my [vsc-extension-quickstart](https://github.com/MichaelCurrin/vsc-extension-quickstart) template.
    - Make sure to include script commands in `package.json`.
1. Set up your extension in the Marketplace.
    1. Go to [Azure DevOps][].
    1. Sign up - use your GitHub account if you want.
    1. Create a new org or use the default one when registering.
    1. Create a publisher.

[Azure DevOps]: https://dev.azure.com


## Manage tokens

1. Login to [Azure DevOps][].
1. Click your icon.
1. Click the 3 dots menu to expand.
1. Click _User Settings_.
1. Click _Personal access tokens_.

Then edit an existing token or make a new one using steps below:

1. Click _New Token_. 
    1. Give it a _Name_.
    1. Set _Organization_ to **All accessible organizations**.
    1. Optionally extend the expiration date.
    1. Set _Scopes_.
        1. Use _Custom defined_.
        1. Click _Show more scopes_.
        1. Under _Marketplace_, tick the **Manage** scope.
    1. Click _Create_.
1. Copy the token value. **Keep this value secret**. If you need the token again, you have to make a whole _new_ token - you can't regenerate the value for an existing token.


## Create and publish release

Install `vsce`:

- Globally:
    ```sh
    $ npm install -g vsce
    $ vsce --version
    ```
- In the project:
    ```sh
    $ npm install -D vsce
    $ npx sce --version
    ```
    
Publish your extension using the CLI.

1. Check which files will be packaged.
    ```sh
    $ vsce ls
    ```
1. Use the login command. This won't have to be run again, until you generate a new token or the old one expires.
    1. Login with your publisher name.
        ```sh
        $ vsce login PUBLISHER_NAME
        ```
        e.g.
        ```sh
        $ vsce login MichaelCurrin
        ```
    1. Paste your token from Azure DevOps.
1. Use the publish command.
    - Increment a minor tag version. e.g. if you are on `v1.1.0` then `v1.2.0` will be created.
        ```sh
        $ vsce publish minor
        ```
    - Or, create a specific tag. Note _without a `v`_ to avoid error. 
        ```sh
        $ vsce publish 1.2.3
        ```
    - Publish an extisting tag. Note flags to avoid errors.
        ```sh
        $ vsce publish 1.2.3 --no-git-tag-version --no-update-package-json
        ```
    - Warning - if you use just `vsce publish` with _no args_, it will use the _latest commit_ but publish under the _latest tag_ (which could be some commits back).

Verify your extension in the Marketplace.

1. Go to [VS Code Marketplace](https://marketplace.visualstudio.com/).
1. Sign in.
1. Click _Publish extensions_. e.g. [marketplace.visualstudio.com/manage/publishers/MichaelCurrin](https://marketplace.visualstudio.com/manage/publishers/MichaelCurrin)
1. Click _More actions_ next to your extension name.
1. Click _View extension_. e.g. [marketplace.visualstudio.com/items?itemName=MichaelCurrin.auto-commit-msg](https://marketplace.visualstudio.com/items?itemName=MichaelCurrin.auto-commit-msg).


## Add CI/CD flow

The publishing could be done with CI.

Such as with GH Actions whenever a tag is made.

One would need a non-expiring token added to secrets.

And you'd still need to verify the extension in the Marketplace to see it looks good.

