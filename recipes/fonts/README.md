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

The Menlo for Powerline font was identified as a font to help VS Code show properly in the terminal in Linux Lite.

Copy font downloaded from [repo](https://github.com/abertsch/Menlo-for-Powerline).

```sh
cp "Menlo for Powerline.ttf" ~/.fonts
```

Update font cache.

```sh
fc-cache -vf ~/.fonts
```

This may have been a bad idea as on a system restart the font still looks bad after it was working.

The config approach below solved the terminal issue immediately without even restarting VS Code.

Add to user settings:

```json
{
    "terminal.integrated.fontFamily": "Menlo for Powerline",
}
```


## Yakuake

The shell looks broken on Linux Lite. Regardless of whether using the Powerline prompt.

Edit profiles and make sure to edit current profile and reselect a mono font.

Or create a new profile, select a font and make it default.

Whether using the system Default or a custom made a default, either way you can preview changes immediately.
