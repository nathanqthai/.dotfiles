#!/bin/sh

# update submodules
git submodule update --init --recursive

# install YCM
pushd vim/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
popd

# install dotfiles
for d in $(ls); do
    stow $d;
done
