SHELL := /bin/bash
ROOT_PATH=$(dirname $(realpath $0))

setup: dotfiles vim zsh

dotfiles:
	@./scripts/dotfiles.sh

vim:
	@./scripts/vim.sh

zsh:
	@./scripts/zsh.sh
