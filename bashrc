export SHELL=/usr/local/bin/bash
export LANG="en_US.UTF-8"
export EDITOR='vim'
export GOPATH=~/code/go
export NOTESDIR=~/code/personal/mongrelionrc/notes/
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export GTK_PATH=/usr/local/lib/gtk-2.0

SYM="x"
PS1SYM="\[\e[0;33m\]$SYM\[\e[m\]"

PS1=" $PS1SYM "

# Vi mode
set -o vi

alias tm="tmux"

# Git aliases
alias cm="git commit -v"
alias gs="git st"
alias gdf="git df"
alias gp="git pull"
alias amend="git commit --amend -C HEAD"
alias rc="git rebase --continue"

alias l="tree -L 1"
alias vim=nvim

alias v=vagrant

# Docker
alias d="docker"
alias dc="docker-compose"


# Kubernetes
alias mk="minikube"
alias kg="kubectl get"

# Terraform
#alias t="terraform"
function t {
  case "$1" in
    "yolo")
      terraform apply -auto-approve
      ;;
    "ws")
      terraform workspace $@
      ;;
    *)
      terraform $@
      ;;
  esac
}

function k {
  case "$1" in
    "get-contexts")
      k_get_contexts
      ;;
    "use-context")
      k_use_context $2
      ;;
    *)
      kubectl $@
      ;;
  esac
}

function k_get_contexts {
  current=$(kubectl config view -o json | jq -r '."current-context"')
  for context in $(kubectl config view -o json | jq -r .contexts[].name)
  do
    declare out
    if [ "${context}" == "${current}" ]
    then
      out="${context} (current)"
    else
      out="${context}"
    fi
    echo "${out}"
  done
}

function k_use_context {
  kubectl config use-context $1
}


alias py="source ~/.venv/bin/activate"

alias update="brew update && brew upgrade"

bind -m vi-insert "\C-l.":clear-screen

# color for man pages
man() {
  env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

function tri {
  tree -L $1 $2
}
export -f tri

function regserver {
  ssh-keyscan -t rsa $1 >> ~/.ssh/known_hosts
  echo done
}

function en {
  export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
}

_cli_bash_autocomplete() {
     local cur opts base
     COMPREPLY=()
     cur="${COMP_WORDS[COMP_CWORD]}"
     opts=$( ${COMP_WORDS[@]:0:$COMP_CWORD} --generate-bash-completion )
     COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
     return 0
 }

complete -F _cli_bash_autocomplete notes

function _init_ssh_agent {
  count=$(ps aux | ag ssh-agent | wc -l)
  if [ "${count}" == 1 ]
  then
    eval `ssh-agent`
    ssh-add
  fi
}

_init_ssh_agent
