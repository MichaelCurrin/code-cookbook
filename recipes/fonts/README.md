# Fonts

Guide for Linux.


## Resources

- [How to Manually Install, Update, and Uninstall Fonts on Linux](https://medium.com/source-words/how-to-manually-install-update-and-uninstall-fonts-on-linux-a8d09a3853b0)


## FC

Recommended path to put fonts:

```
~/.local/share/fonts
```

`fc-cache` utility

```
NAME
       fc-cache - build font information cache files

SYNOPSIS
       fc-cache  [  -EfrsvVh  ]   [ --error-on-no-fonts ]  [ --force ]  [ --really-force ]  [  [ -y dir ]  [ --sysroot dir ]  ]  [
       --system-only ]  [ --verbose ]  [ --version ]  [ --help ]  [ dir... ]

DESCRIPTION
       fc-cache scans the font directories on the system and builds font information cache files for applications using fontconfig
       for their font handling.
```

e.g.

```sh
fc-cache -vf

fc-cache -vf PATH
```

List fonts.

```sh
fc-list
```

Or

```sh
fc-list | grep Menlo
/home/michael/.local/share/fonts/Menlo for Powerline.ttf: Menlo for Powerline:style=Regular
```


## VS Code

When using Powerline prompt such as for Linux Lite or for ZSH, you may have issues in VS Code terminal. This can be solved with steps below.

1. Copy binary font downloaded from [repo](https://github.com/abertsch/Menlo-for-Powerline).
       ```sh
       mkdir -p ~/.local/share/fonts
       cp "Menlo for Powerline.ttf" ~/.local/share/fonts
       ```
1. Update font cache.
       ```sh
       fc-cache -vf ~/.local/share/fonts
       ```
1. The update VS Code user settings to actually apply the font.
       ```json
       {
           "terminal.integrated.fontFamily": "Menlo for Powerline",
       }
       ```

To uninstall:

1. Remove the file from the fonts directory.
1. Run:
       ```sh
       fs-cache
       ```


## Yakuake

The shell looks broken on Linux Lite. Regardless of whether using the Powerline prompt.

Edit profiles and make sure to edit current profile and reselect a mono font.

Or create a new profile, select a font and make it default.

Whether using the system Default or a custom made a default, either way you can preview changes immediately.
