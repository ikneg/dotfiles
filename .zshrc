# dir color
eval $(dircolors ~/dircolors-solarized/dircolors.ansi-universal)

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
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/genki/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Path settings
PATH="/usr/local/heroku/bin:$PATH"
PATH="/usr/local/rbenv:$PATH"

# History settings
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Git settings
export GIT_EDITOR=/usr/local/bin/vim

# rbenv settings
export CC=/usr/bin/gcc

# git
setopt prompt_subst
. /usr/share/git-core/contrib/completion/git-prompt.sh
export RPROMPT=$'$(__git_ps1 "%s")'
