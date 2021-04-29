---
title: VS Code
description: Recipes for Visual Studio Code IDE
---


## Share settings

If you have VS Code and VS Code [Insiders](https://code.visualstudio.com/insiders/) installed but only want to manage one `settings.json` file:

### macOS

```sh
$ rm ~/Library/Application\ Support/Code\ -\ Insiders/User/settings.json
$ ln -s ~/Library/Application\ Support/Code/User/settings.json \
    ~/Library/Application\ Support/Code\ -\ Insiders/User/settings.json
```


## Preference

How to view and edit settings.


### UI

Open _Preferences_ from the menu in the top left of the window.

OR

Open the command-prompt and click _Preferences: Open Settings (UI)_.

### Global settings file

The location changes based on OS.

On macOS: `~/Library/Application Support/Code/User/settings.json`.

OR

Open the command-prompt and click _Preferences: Open User Settings (JSON)_.

### Project settings file

Add a file at this path: `.vscode/settings.json`.

OR

Open the command-prompt and click _Preferences: Open Settings (JSON)_.




## Change appearance

Open your _Settings_ from the menu in the top left.

### Color theme

#### UI

Go to _Workbench_, _Appearance_ and set _Color Theme_.

#### Config

The default is `Default Dark+` but there a lot to choose from.

```json
{
  "workbench.colorTheme": "Monokai"
}
```

### Color customizations

Install the [Window Colors](https://marketplace.visualstudio.com/items?itemName=stuart.unique-window-colors) extension.

Or set this in a settings file.

Override colors, regardless of the theme.

```json
{
  "workbench.colorCustomizations": {
    "activityBar.background": "#62b4a8",
    "titleBar.activeBackground": "#19423B",
    "titleBar.activeForeground": "#F6FBFB"
  }
}
```

If you only want to override colors for a specific theme.

```json
{
  "workbench.colorCustomizations": {
    "[Default Dark+]": {
      "activityBar.activeBackground": "#ff0000"
    }
  }
}
```

