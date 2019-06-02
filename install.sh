#!/bin/bash

# TODO: Check operating system
# TODO: Check dependencies and install them

# update submodules
echo "[-] Updating Git submodules..."
git submodule update --init --recursive
echo "[+] Done!"

echo "[?] Checking if initial install already performed..."
if [ ! -f ./.installed ]; then
    echo "[-] Performing initial install..."

    # install YCM
    pushd vim/.vim/bundle/YouCompleteMe
    python3 install.py --clang-completer
    popd

    # add a aliases if not already there
    if [ ! -f ${HOME}/.bash_aliases ]; then
        touch .bash_aliases
    fi

    touch .installed
    echo "[+] Done!"
else
    echo "[!] Already installed!"
    date >> .installed
fi

# install dotfiles
echo "[-] Symlinking dotfiles..."
stow --restow --verbose=1 --target=${HOME} bash;
stow --restow --verbose=1 --target=${HOME} git;
stow --restow --verbose=1 --target=${HOME} vim;
stow --restow --verbose=1 --target=${HOME} tmux;
echo "[+] Done!"
