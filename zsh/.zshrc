typeset -U PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
path+=($HOME/go/bin)
path+=($HOMEBREW_PREFIX/opt/mysql-client/bin)

fpath+=("$HOME/.docker/completions")
fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
fpath+=("$HOMEBREW_PREFIX/share/zsh-completions")

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle :compinstall filename '/Users/alexisgeoffrey/.dotfiles/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=999999999999999999
SAVEHIST=$HISTSIZE
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# history substring search
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

setopt globdots

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# kube ps1
source "$HOMEBREW_PREFIX/opt/kube-ps1/share/kube-ps1.sh"

# custom scripts
source "$ZDOTDIR/aliases"
source "$ZDOTDIR/vcs"

# prompt
NEWLINE=$'\n'
PS1='%F{blue}%~%f ${vcs_info_msg_0_}$(kube_ps1)${NEWLINE}%0(?.%202F.%202K)λ%k%f '

# init bloat
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
source ~/.asdf/plugins/java/set-java-home.zsh

