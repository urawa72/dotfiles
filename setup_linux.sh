#!/bin/sh

echo Make sym links
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
ln -fs "$SCRIPT_DIR/bash/bashrc" "$HOME/.bashrc"
ln -fs "$SCRIPT_DIR/bash/bash_profile" "$HOME/.bash_profile"
ln -fs "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"
