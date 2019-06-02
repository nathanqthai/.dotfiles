#!/bin/bash

# update submodules
git submodule update --init --recursive

if [ ! -f ./.installed ]; then

    # install YCM
    pushd vim/.vim/bundle/YouCompleteMe
    python3 install.py --clang-completer
    popd

fi

# install dotfiles
stow --restow --verbose=2 --target=${HOME} bash;
stow --restow --verbose=2 --target=${HOME} git;
stow --restow --verbose=2 --target=${HOME} vim;
stow --restow --verbose=2 --target=${HOME} tmux;

touch .installed
date >> .installed
