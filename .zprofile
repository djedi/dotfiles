eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv init --path)"
export PATH="/Users/dustin/.pyenv/shims:${PATH}"
eval "$(pyenv virtualenv-init -)"