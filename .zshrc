# dir color
eval $(dircolors ~/.dircolors-solarized/dircolors.ansi-universal)

# alias
alias vim=/usr/local/bin/vim
alias vi='vim'
alias be='bundle exec'

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
PATH="/usr/local/rbenv:$PATH"
PATH="$HOME/.local/bin:$PATH"

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
if [[ $USER = "pi" ]]; then
  . /usr/lib/git-core/git-sh-prompt
else
  #. /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
  . /usr/share/git-core/contrib/completion/git-prompt.sh
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

export GOPATH=$HOME/go
export PATH=$PATH:$PATH/bin

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/var/nodebrew/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/var/nodebrew/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/var/nodebrew/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/var/nodebrew/node/v8.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

alias updatedb='sudo /usr/libexec/locate.updatedb'

export LESSCHARSET=utf-8

setopt nonomatch

source ~/.zsh-vimode-visual/zsh-vimode-visual.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/vagrant/google-cloud-sdk/path.zsh.inc' ]; then . '/home/vagrant/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/vagrant/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/vagrant/google-cloud-sdk/completion.zsh.inc'; fi

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/vagrant/work/bonx/bonx-io/bonx-ext-api/node_modules/tabtab/.completions/slss.zsh ]] && . /home/vagrant/work/bonx/bonx-io/bonx-ext-api/node_modules/tabtab/.completions/slss.zsh
