#!/usr/bin/env zsh

all:
	@stow --verbose --restow */

delete:
	@stow --verbose --delete */

init:
	@stow --verbose --adopt */

brew:
	@cd ~/.dotfiles/homebrew && brew bundle dump -f