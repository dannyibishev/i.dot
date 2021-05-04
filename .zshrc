# Use the .zshenv file for appending to the PATH. Do not Export Path changes here!
#####  ZSH THEME  #####
ZSH_THEME="agnoster-overide"

#####  PLUGINS  #####
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.terraform-docs-completion

eval "$(pipenv --completion)"

#Github Tags ~ Retag
function rt() {
  if [ -z $1 ]
  then
    echo "Tag Name Required"
  else
    git tag -d $1 && git push origin :$1;
  fi
  git tag -a $1 -m $1 && git push origin $1;
} 

#Github Tags ~ Delete
function dl() {
  if [ -z $1 ]
  then
    echo "Tag Name Required"
  else
    git tag -d $1;
    git push origin :$1;
  fi
}

#Remove Cached Python libs/files
function pyclean () {
        find . -type f -name "*.pyc" -delete
        find . -type d -name "__pycache__" -delete
}

function new-ssh() {
   ssh-keygen -t ecdsa -a 500 -b 521
}

##### LANGUAGE SELECTOR

function switch_languagse() {

  case $1 in
    bg)
      export LANG=bg_BG.UTF-8
      ;;

    uk)
      export LANG=en_GB.UTF-8
      ;;
    *)
      export LANG=bg_BG.UTF-8
      ;;
  esac
}

##### SCRIPTS #####
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

#####  HANDY ALIAS'  #####
alias reload='source ~/.zshrc; clear; echo RELOADED'
alias ll='ls'

#Timestamp
RPROMPT="%{$fg[yellow]%}[%D{%f/%m/%y|%T}]"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

