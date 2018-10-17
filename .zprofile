export VTE_CJK_WIDTH=1
export AWS_REGION=ap-northeast-1
export PATH=/usr/local/bin:$PATH
#export RBENV_ROOT=/usr/local/rbenv
#export PATH=$RBENV_ROOT/bin:$PATH
#export GOPATH=$HOME/work/go
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
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
