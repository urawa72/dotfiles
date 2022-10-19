#!/usr/bin/sh

NVIM_NVB=~/.config/nvb
export NVB

rm -rf $NVIM_NVB

mkdir -p $NVIM_NVB/share
mkdir -p $NVIM_NVB/nvim

stow --restow --target=$NVIM_NVB/nvim .

alias nvb='XDG_DATA_HOME=$NVIM_NVB/share XDG_CONFIG_HOME=$NVIM_NVB nvim' 

export nvb
