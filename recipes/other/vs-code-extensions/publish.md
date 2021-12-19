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


## Create a token

1. Login to [Azure DevOps][].
1. Click _User Settings_ in the top right.
1. Click _Personal access tokens_.
1. Click _New Token_. 
    1. Give it a Name.
    1. Set Organization to _All accessible organizations_.
    1. Optionally extend its expiration date
    1. Set Scopes.
        1. Use Custom defined.
        1. Click _Show more scopes_.
        1. Under _Marketplace_, tick _Manage_ scope.
1. Copy the token value.


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
1. Use the login command. Paste your token from Azure DevOps. Keep this value secret.
    ```sh
    $ vsce login PUBLISHER_NAME
    ```
1. Use the publish command.
    - Increment a minor tag version and publish it. 
        ```sh
        vsce publish minor
        ```
    - Or to create a specific tag.
        ```sh
        vsce publish v1.2.3
        ```
    - Warning - if you use just `vsce publish` with no args, it will use the latest commit but publish under the latest tag (which could be some commits back).

Finall, verify your extension in the Marketplace.


[AzureDevOps]: https://dev.azure.com
