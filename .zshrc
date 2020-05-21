# dir color
eval $(dircolors ~/.dircolors-solarized/dircolors.ansi-universal)

# alias
alias vim=nvim
alias vi='vim'
alias be='bundle exec'
alias vg='vagrant'

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_all_dups
setopt share_history
setopt autocd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep
setopt inc_append_history
setopt auto_list
setopt list_packed
setopt auto_menu
setopt auto_param_keys
setopt hist_reduce_blanks
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/gnk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Path settings
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="~/Library/Python/2.7/bin:$PATH"
export PATH="/Users/gnk/Library/Android/sdk/platform-tools:$PATH"
PATH="$HOME/local/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

# History settings
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Git settings
export GIT_EDITOR=nvim

# rbenv settings
export CC=/usr/bin/gcc

# git
setopt prompt_subst
if [[ $USER = "pi" ]]; then
  . /usr/lib/git-core/git-sh-prompt
else
  #. /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
  . /etc/bash_completion.d/git-prompt
fi;
export RPROMPT=$'$(__git_ps1 "%s")'

# peco
#function peco-history-selection() {
#    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
#    CURSOR=$#BUFFER
#    zle reset-prompt
#}

function peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

autoload -U colors && colors
export PROMPT="[%n@${fg[green]}%m${reset_color}] %~ %% "
[ -f $HOME/.zshrc_${USER} ] && . $HOME/.zshrc_${USER}

export LESSCHARSET=utf-8

setopt nonomatch

source ~/.zsh-vimode-visual/zsh-vimode-visual.zsh

export GO111MODULE=on
export PATH="$HOME/.anyenv/bin:$PATH"

eval "$(anyenv init -)"
