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
stow --verbose=3 bash;
stow --verbose=3 git;
stow --verbose=3 vim;
stow --verbose=3 tmux;
