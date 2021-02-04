# Vim

Vim is a highly configurable text editor built to make creating and changing any kind of text very efficient. It is included as "vi" with most UNIX systems and with Apple OS X.

Vim is rock stable and is continuously being developed to become even better. Among its features are:

* persistent, multi-level undo tree
* extensive plugin system
* support for hundreds of programming languages and file formats
* powerful search and replace
* integrates with many tools

![vim - darknesscode](https://github.com/codedarkness/vim/blob/master/config-files/vim.png)

## Plugins

Plugin manager vim-plug

* nerdtree
* i3-vim-syntax
* vim-devicons
* vim-markdown
* html5
* php
* python-syntax
* vimwiki
* ultisnips
* lightline
* Ale
* vim-surround
* vim-rainbow
* hakell-vim
* vim-fugitive
* vim-taglist
* nerdcommenter

To install the plugins, open vim and run:

```
:PlugInstall
```

To update installed plugin run:

```
:PlugUpdate
```

To remove unlisted plugins run:

```
PlugClean
```

To upgrade vim-plug itself run:

```
:PlugUpgrade
```

Plugins included in this repo:

* vim-plug

## Keybindings

Some useful keybindings for this custom build:

Leader key = SpaceBar

| Key      | Action             |
| :------- | :------------------ |
| Leader+n | NerdTree            |
| Leader+f | Ranger File Manager |
| Leader+v | Split Horizontal    |
| Leaver+h | Split Vertical      |
| Ctrl+h   | Change Split Left   |
| Ctrl+j   | Change Split Down   |
| Ctrl+k   | Change Split Up     |
| Ctrl+l   | Change Split Right  |
| ii       | Normal Mode	 |
| i        | Insert Mode   	 |

