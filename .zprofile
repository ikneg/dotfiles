#export VTE_CJK_WIDTH=1
export PATH=/usr/local/bin:$PATH

user=`users`
case "$user" in
  *ec2-user* ) if [ -f /home/ec2-user/.nickname.sh ]; then
      source /home/ec2-user/.nickname.sh
  else
      echo "***************************"
      echo "***************************"
      echo "Not set nickname"
      echo "***************************"
      echo "***************************"
  fi
  ;;
  *vagrant* ) export NICKNAME=vagrant ;;
  *pi* ) export NICKNAME=pi ;;
esac

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export RBENV_ROOT=/usr/local/rbenv
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init -)"
