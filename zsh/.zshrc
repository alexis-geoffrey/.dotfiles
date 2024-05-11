eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit
export PURE_PROMPT_SYMBOL=λ
prompt pure
zstyle :prompt:pure:prompt:success color 202

# history substring search
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

setopt globdots

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# custom scripts
source "$HOME/.dotfiles/zsh/aliases.sh"
