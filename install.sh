#!/bin/bash

cd $HOME/.dotfiles
git pull --force
git submodule update --init --recursive
./create_symlinks.sh
