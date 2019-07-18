export VTE_CJK_WIDTH=1
export AWS_REGION=ap-northeast-1
export PATH=/usr/local/bin:$PATH
export RBENV_ROOT=$HOME/.rbenv
export GOPATH=/usr/local/go
export PATH=$RBENV_ROOT/bin:$PATH
export PATH=/usr/local/opt/mysql@5.7/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH
USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin
eval "$(rbenv init -)"

NODEBREW_HOME=/usr/local/var/nodebrew/current
export NODEBREW_HOME
export NODEBREW_ROOT=/usr/local/var/nodebrew

export PATH=$PATH:$NODEBREW_HOME/bin

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
