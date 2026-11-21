# zeekay/zsh

[![Open in Hanzo](https://hanzo.app/badges/open-in-hanzo.svg)](https://hanzo.app/dev/open?repo=github.com/zeekay/dot-zsh&ref=main&action=open) [![Edit with Hanzo](https://hanzo.app/badges/edit-with-hanzo.svg)](https://hanzo.app/dev/open?repo=github.com/zeekay/dot-zsh&ref=main&action=edit)

My zsh dotfiles, compatible with [ellipsis][ellipsis].

## Features
Uses my [zsh][zsh] framework, [zeesh!][zeesh] All sorts of advanced mumbo
jumbo. You'll probably want to disable the vim keybindings by removing
vi-mode from the list of `zeesh_plugins` in `~/.zshrc`.

## Install
Clone and symlink or install with [ellipsis][ellipsis]:

## Customization
#### `~/.zsh/local/after.zsh`
Will be sourced after default zshrc.

```
$ ellipsis install zeekay/zsh
```

[ellipsis]: http://ellipsis.sh
[zsh]:      http://www.zsh.org
[zeesh]:    https://github.com/zeekay/zeesh
