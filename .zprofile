export VTE_CJK_WIDTH=1
export AWS_REGION=ap-northeast-1
export RBENV_ROOT=/usr/local/rbenv
export PATH=$RBENV_ROOT/bin:$PATH
export GOPATH=$HOME/work/go
eval "$(rbenv init -)"
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
  *vagrant* ) if [ -f /home/vagrant/.nickname.sh ]; then
      source /home/vagrant/.nickname.sh
  else
      echo "***************************"
      echo "***************************"
      echo "Not set nickname"
      echo "***************************"
      echo "***************************"
  fi
  ;;

esac
if [[ $user =~ "ec2-user" ]]; then
fi
