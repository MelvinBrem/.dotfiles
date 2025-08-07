#!/usr/bin/env zsh

skip_global_compinit=1

# === Misc path stuff
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$(pyenv root)/shims:${PATH}"
export PATH="/opt/homebrew/opt/mysql@8.2/bin:$PATH"

# === FNM
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

# === PyEnv

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# === Other

# Prevent issues with yarn package pruning
export NODE_ENV=development

# === Scripts n stuff

source $HOME/.zsh/inc/variables.sh
source $HOME/.zsh/inc/helpers.sh
source $HOME/.zsh/inc/lfcd.sh
source $HOME/.zsh/inc/wpessh.sh

source $HOME/.zsh/lwp/lwpController.sh

source $HOME/.zsh/.zshprompt
source $HOME/.zsh/.aliases

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
