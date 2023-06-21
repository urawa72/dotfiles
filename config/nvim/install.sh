#!/usr/bin/env bash

NEW_NVIM=~/.config/nnv
export NNV

rm -rf $NEW_NVIM

mkdir -p $NEW_NVIM/share
mkdir -p $NEW_NVIM/nvim

stow --restow --target=$NEW_NVIM/nvim .

alias nnv='XDG_DATA_HOME=$NEW_NVIM/share XDG_CONFIG_HOME=$NEW_NVIM nvim' 

export nnv
