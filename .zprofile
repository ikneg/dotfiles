export PATH=/usr/local/bin:$PATH
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache

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

export PATH="$HOME/.cargo/bin:$PATH"
