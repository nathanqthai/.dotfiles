# README
My dotfiles.

Install using `install.sh`.

## Requirements
global
  * `git`
  * `vim` (>8.0 +python3)
  * `tmux`
  * `date`

vim
  * `python3`
  * `cmake`

bash
  * `encrypt` and `decrypt` function:
    * `openssl`

## Features
A summary of added features.

### `.bash_profile`
* `ls` always has color and shows hidden files in list view
* `mdlive` command allows live updating markdown preview in the cli
* `bedit` and `bsource` aliases for `.bash_profile` editing
* `encrypt` and `decrypt` functions for quick file crypt with `openssl`
* `pub_ip` and `inf_ip` commands for checking public and interface IPs
* macOS only
  * Custom `PS1`
  * Corrected Homebrew paths
* non-macOS
  * Setup for `git` aware `PS1`

### `.bashrc`
* non-macOS
  * Custom `PS1` with `git` awareness

### `.gitconfig`
* `vim` as default editor
* `supdate` command for updating submodules

### `.tmux.conf`
* Custom colors
* New windows and panes open in the `cwd`
* Windows and panes indexed from 1

### vim
Just read the files.
