#!/bin/sh

git submodule update --init --recursive

pushd vim/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
popd
for d in $(ls); do
    stow $d;
done
