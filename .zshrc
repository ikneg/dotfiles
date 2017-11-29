# dir color
eval $(dircolors ~/.dircolors-solarized/dircolors.ansi-universal)

# alias
alias vi='vim'

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
zstyle :compinstall filename '/home/vagrant/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Path settings
PATH="/usr/local/heroku/bin:$PATH"
PATH="/usr/local/rbenv:$PATH"
PATH="/usr/pgsql-9.6/bin:$PATH"

# History settings
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Git settings
export GIT_EDITOR=/usr/bin/vim

# rbenv settings
export CC=/usr/bin/gcc

# git
setopt prompt_subst
if [[ $USER = "pi" ]]; then
  . /usr/lib/git-core/git-sh-prompt
else
  . /usr/share/git-core/contrib/completion/git-prompt.sh
fi;
export RPROMPT=$'$(__git_ps1 "%s")'

# peco
function peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# aws
export AWS_REGION=ap-northeast-1

autoload -U colors && colors
export PROMPT="[%n@${fg[green]}%m${reset_color}] %~ %% "
[ -f $HOME/.zshrc_${USER} ] && . $HOME/.zshrc_${USER}
