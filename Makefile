#!/usr/bin/env zsh

all:
	@stow --verbose --delete */
	@stow --verbose --restow --adopt git
	@stow --verbose --restow --adopt zsh
	@rm -f ~/Library/Application\ Support/Code/User/settings.json
	@ln -sf ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@rm -rf ~/.config/wezterm
	@ln -sf ~/.dotfiles/wezterm/modules/ ~/.config/wezterm
	@rm -f ~/.wezterm.lua
	@ln -sf ~/.dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

delete:
	@stow --verbose --delete */

# === Setup ===

brew:
	@cd ~/.dotfiles/homebrew && brew bundle dump -f

setup:
	@cd ~/.dotfiles/macos && sh .macos
	@cd ~/.dotfiles/homebrew && brew bundle Brewfile