#!/usr/bin/env zsh

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# === FNM ===
export PATH="$HOME/Library/Caches/fnm_multishells/29648_1712237561997/bin":$PATH
export FNM_COREPACK_ENABLED="false"
export FNM_DIR="$HOME/Library/Application Support/fnm"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_RESOLVE_ENGINES="false"
export FNM_ARCH="x64"
export FNM_MULTISHELL_PATH="$HOME/Library/Caches/fnm_multishells/29648_1712237561997"
export FNM_LOGLEVEL="info"
rehash

source $HOME/.zshenv
source $HOME/.precmd
source $HOME/.zshprompt
source $HOME/.aliases
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

for script in $HOME/.dotfiles/scripts/*.sh; do
    source $script;
done;