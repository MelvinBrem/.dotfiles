#!/usr/bin/env zsh

all:
	@stow --verbose --delete */
	@stow --verbose --restow --adopt git
	@stow --verbose --restow --adopt zsh
	@ln -s ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

delete:
	@stow --verbose --delete */

# === Setup ===

brew:
	@cd ~/.dotfiles/homebrew && brew bundle dump -f

setup:
	@cd ~/.dotfiles/macos && sh .macos
	@cd ~/.dotfiles/homebrew && brew bundle Brewfile