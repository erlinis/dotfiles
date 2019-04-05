#!/bin/bash

source ./helpers.sh;

title ZSH;

installing "Oh-My-Zsh plugins"

ZSH=~/.oh-my-zsh
zsh_plugins_path=$ZSH/custom/plugins

installing "zsh-autosuggestions ..."
autosuggestions_path=$zsh_plugins_path/zsh-autosuggestions
if [ -d $autosuggestions_path ]; then
  echo "zsh-autosuggestions already installed."
else
  git clone git://github.com/zsh-users/zsh-autosuggestions $autosuggestions_path
fi

installing "zsh-syntax-highlighting ..."
syntax_highlighting_path=$zsh_plugins_path/zsh-syntax-highlighting
if [ -d $syntax_highlighting_path ]; then
  echo "zsh-syntax-highlighting already installed."
else
  mkdir -p $zsh_plugins_path
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $syntax_highlighting_path
fi
