export SHELL=/usr/local/bin/bash
export LANG="en_US.UTF-8"
export EDITOR='vim'
#export GOROOT=~/code/os/google/go
export GOPATH=/usr/local/opt/go
export NOTESDIR=~/code/personal/mongrelionrc/notes/
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/bin"
export PATH="$PATH:$GOPATH/bin"
export GTK_PATH=/usr/local/lib/gtk-2.0

SYM="~[👾 ]~"
PS1SYM="\[\e[0;33m\]$SYM\[\e[m\]"

# Prompt theme.
function ps1 {
  echo " $PS1SYM "
}
#PS1=`ps1`
PS1=" $SYM "

# Vi mode
set -o vi

# Aliases
alias todo="ag TODO"

# Ansible
alias ap="ansible-playbook"

# Git aliases
alias cm="git commit -v"
alias gs="git st"
alias gdf="git df"
alias b="git blame"
alias dfc="git df --cached"
alias mycommits="git log --author=Carlos"
alias elc="git rebase -i HEAD^"
alias amend="git commit --amend"
alias rc="git rebase --continue"
alias pull="git pull --rebase"

alias l="ls -laG"

alias motd="fortune | cowsay | lolcat"

alias v=vagrant

alias d="docker"
alias dc="docker-compose -f system-test/src/test/resources/mesos-es/docker-compose.yml"
alias t="terraform"

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
