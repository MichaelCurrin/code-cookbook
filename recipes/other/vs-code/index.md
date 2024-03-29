---
title: VS Code
logo: visualstudiocode
description: Recipes for Visual Studio Code IDE
---


## Share settings

If you have VS Code _and_ [VS Code Insiders](https://code.visualstudio.com/insiders/) installed, but only want to manage one `settings.json` file, you can delete the Insiders on and point it at the main one.

### macOS

```sh
$ rm "$HOME/Library/Application Support/Code - Insiders/User/settings.json"
$ ln -s "$HOME/Library/Application Support/Code/User/settings.json" \
   "$HOME/Library/Application Support/Code - Insiders/User/settings.json"
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

Here is a setup for orange activity bar and tile bar, with black text.

```json
{
  "workbench.colorCustomizations": {
    "activityBar.background": "#e4b533",
    "activityBar.foreground": "#0c1616",
    "titleBar.activeBackground": "#e4b533",
    "titleBar.activeForeground": "#0c1616"
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

OR

Install the [Window Colors](https://marketplace.visualstudio.com/items?itemName=stuart.unique-window-colors) extension.

> This extension gives each new VS Code window a unique color based on a hash of the root directory name when it is opened. It does this by immediately writing three colors to the following settings in .vscode/settings.json...
