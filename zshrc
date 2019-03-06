 export TERM="xterm-256color"

# ----------
# ZSH Config
# ----------
# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# -----------------
# Theme & UI Config
# -----------------
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_NODE_VERSION_BACKGROUND='28'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='15'
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M  %m.%d.%y}"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs root_indicator context dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git autopep8 ruby common-aliases zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# --------------
# SSH Config
# --------------

ssh-es-indexer-1() {
  ssh -i ~/.ec2/twenty20-dev-keypair.pem ubuntu@54.211.71.136
}

# --------------
# Custom Aliases
# --------------

function f() { find . -iname "*$1*" ${@:2} }
function f() { grep "$1" ${@:2} -R . }

alias vim='/usr/local/bin/vim'
alias emacs='/usr/local/Cellar/emacs/25.3/Emacs.app/Contents/MacOS/Emacs -nw'
alias be='bundle exec'
alias l='ls -laFh'
alias post='postgres -D /usr/local/var/postgres'

# Allows for batch rename
autoload -U zmv
alias zmv='noglob zmv -w'

alias devapi='RACK_ENV=development bundle exec puma --port=5000'

# ---------------------------------------------
# Git Aliases
# ---------------------------------------------

alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gl='git log'

# ---------------------------------------------
# Path Shortcuts
# ---------------------------------------------

# System shortcuts
hash -d shell="${HOME}/.shell_config"
hash -d subt="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"

# Twenty20 shortcuts
hash -d t20="${HOME}/Documents/twenty20"
hash -d re="${HOME}/Documents/reshot"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
