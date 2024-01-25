#!/usr/bin/env zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

source $HOME/.zshenv
source $HOME/.zshprompt
source $HOME/.aliases
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh