---
title: VS Code configuration
description: Setup a Deno project for use in VS Code.
---

## Extension

This page is based around this extension:

- [Deno for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=denoland.vscode-deno)
    > This extension adds support for using Deno with Visual Studio Code, powered by the Deno language server.
    
    
## Recommendation

Setup a file which means a user of your repo will get prompted to optional install the extensions listed.

- `.vscode/extensions.json`
    ```json
    {
      "recommendations": [
        "denoland.vscode-deno"
      ]
    }
    ```


## Settings

Use this in a project. The help for the extension's settings advise against setting these globally.

- `.vscode/settings.json`
    ```json
    {
      "deno.enable": true,
      "deno.lint": true,
      "deno.unstable": true,
      
      "deno.config": "tsconfig.json",
      "deno.importMap": "import_map.json"
    }
    ```
    
You can omit the last two settings if they are not needed.

