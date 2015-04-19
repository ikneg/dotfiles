# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/genki/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# tmux
if [ "$TMUX" = "" ]; then
    tmux attach;

    # detachしてない場合
    if [ $? ]; then
        tmux;
    fi
fi

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
export GIT_EDITOR=/usr/bin/vim

# rbenv settings
export CC=/usr/bin/gcc

# prompt
# export PROMPT="$PROMPT""$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")"
