#!/bin/bash

if [ ! -f ./.installed ]; then
    # update submodules
    git submodule update --init --recursive

    # install YCM
    pushd vim/.vim/bundle/YouCompleteMe
    python3 install.py --clang-completer
    popd

    touch .installed
fi

# install dotfiles
stow --restow --verbose=2 --target=${HOME} bash;
stow --restow --verbose=2 --target=${HOME} git;
stow --restow --verbose=2 --target=${HOME} vim;
stow --restow --verbose=2 --target=${HOME} tmux;
