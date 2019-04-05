#!/bin/bash

set -e
set encoding=utf-8

#EMOJIS
GEAR="\xE2\x9A\x99\xEF\xB8\x8F"
SMALL_BLUE_DIAMOND="\xF0\x9F\x94\xB9"

#COLORS
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
GREY='\e[90m'
NC='\e[0m' # No Color

function title {
  TITLE=$1
  printf "\n${GEAR}  SETTING UP ${TITLE}\n"
  printf -- "··············································\n"
}

function installing {
  printf "${SMALL_BLUE_DIAMOND}  Installing ${1}... "
}

# Sysmlink dotfiles to HOME directory and renaming existing file with .old suffix
function symlink_or_skip {
  local file=$1
  local link_path=$2
  local link_dir_path=$(dirname "${link_path}")
  local dotfile_path="${dir}/${file}"
  # If file exists and it's a symlink
  if [ -L "${link_path}" ]; then
    printf "${YELLOW}Skipped. It already exists${NC}\n"
  else
    # If file exists
    if [ -f "${link_path}" ]; then
      mv "${link_path}" "${link_path}.old"
      printf "${YELLOW}(Renaming ${file} to ${file}.old)${NC}\t"
    fi
    mkdir -p $link_dir_path
    ln -fs "${dotfile_path}" "${link_path}"
    printf "${GREEN}Symlinked ${file} to ${link_path}${NC}\n"
  fi
}

