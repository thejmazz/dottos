# modified from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/aws/aws.plugin.zsh

_homebrew-installed() {
  type brew &> /dev/null
}

_awscli-homebrew-installed() {
  brew list awscli &> /dev/null
}

export AWS_HOME=~/.aws

function agp {
  echo $AWS_DEFAULT_PROFILE
}

function awsp {
  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1
  export AWS_ACCESS_KEY_ID=`awk -F "=" '/aws_access_key_id/ {print $2}' $AWS_HOME/credentials | tr -d ' '`
  export AWS_SECRET_ACCESS_KEY=`awk -F "=" '/aws_secret_access_key_id/ {print $2}' $AWS_HOME/credentials | tr -d ' '`
}

function aws_profiles {
  reply=($(grep profile $AWS_HOME/config|sed -e 's/.*profile \([a-zA-Z0-9_-]*\).*/\1/'))
}

compctl -K aws_profiles awsp

if _homebrew-installed && _awscli-homebrew-installed ; then
  _aws_zsh_completer_path=$(brew --prefix awscli)/libexec/bin/aws_zsh_completer.sh
else
  _aws_zsh_completer_path=$(which aws_zsh_completer.sh)
fi

[ -x $_aws_zsh_completer_path ] && source $_aws_zsh_completer_path
unset _aws_zsh_completer_path
