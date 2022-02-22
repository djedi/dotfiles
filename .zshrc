# Path to your oh-my-zsh installation.
declare -x ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# bira, fino, robbyrussell, reandom, fletcherm
ZSH_THEME="fino"

# zsh aliases
alias zshconfig="code ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
declare -ix UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git macos autopep8 bower brew colored-man-pages fabric github npm pip python tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/usr/local/share/npm/bin:/Users/dustin/bin:/Users/dustin/.poetry/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Secrets should go in this file so they are not on github
source ~/sd/secrets/.secrets
source ~/init/.functions
source ~/init/.media_functions
source ~/init/.aliases

# Python
# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PIP_REQUIRE_VIRTUALENV=true
eval "$(pyenv init -)"
# eval "$(pyenv init --path)"
export PATH="/Users/dustin/.pyenv/shims:${PATH}"
eval "$(pyenv virtualenv-init -)"

autoload bashcompinit
bashcompinit


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# Maximum number of history lines in memory
export HISTSIZE=50000
# Maximum number of history lines on disk
export HISTFILESIZE=50000
# Ignore duplicate lines
export HISTCONTROL=ignoredups:erasedups

# Flutter
export PATH="$PATH:/Users/dustin/src/flutter/bin"

# Go
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

# Python2
# export PYTHON2PATH="$HOME/Library/Python/2.7/bin"
# export PATH=$PATH:$PYTHON2PATH
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# OpenSSL
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# For compilers to find openssl@1.1 you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# For pkg-config to find openssl@1.1 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"


# Fix numeric keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dustin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dustin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dustin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dustin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
