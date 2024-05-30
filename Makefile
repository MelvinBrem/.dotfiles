#!/usr/bin/env zsh

all:
	@stow --verbose --delete */
	@stow --verbose --restow --adopt git
	@stow --verbose --restow --adopt zsh

delete:
	@stow --verbose --delete */

# === Setup ===

brew:
	@cd ~/.dotfiles/homebrew && brew bundle dump -f

setup:
	@cd ~/.dotfiles/macos && sh .macos
	@cd ~/.dotfiles/homebrew && brew bundle Brewfile