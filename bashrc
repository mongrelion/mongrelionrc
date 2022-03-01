export LANG="en_US.UTF-8"
export EDITOR='vim'
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/code/com/gv/platypus/scripts:$PATH"
export GTK_PATH=/usr/local/lib/gtk-2.0
export RIPGREP_CONFIG_PATH=${HOME}/code/personal/mongrelionrc/ripgrep

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
alias lg="lazygit"

alias l="tree -L 1"
alias vim=nvim

alias v=vagrant

# Docker
alias d="docker"
alias dc="docker-compose"

# Kubernetes
alias mk="minikube"
alias k="kubectl"
alias kg="kubectl get"
alias kx="kubectx"
alias dr="docker run --rm -it"

# Terraform
alias t="terraform"

alias ag=rg

alias py="source ~/.venv/bin/activate"

alias ts="npx ts-node"

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
  check=$(pidof gpg-agent)
  if [ "${check}" == "" ]
  then
    gpg-agent --version 2>&1 > /dev/null
  fi

  export GPG_TTY=$(tty)
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  echo UPDATESTARTUPTTY | gpg-connect-agent > /dev/null
}

_init_ssh_agent

function ohyeah {
  printf "8==========|D"; while true; do printf "~"; sleep 1; done
}


if [ "$(uname -o)" == "GNU/Linux" ]
then
  export SHELL=/bin/bash
  source /usr/share/fzf/key-bindings.bash
  source /opt/asdf-vm/asdf.sh
  source /usr/share/bash-completion/completions/asdf
  source /usr/share/bash-completion/completions/git
else
  export SHELL=/usr/local/bin/bash
  . $(brew --prefix)/etc/bash_completion
  source /usr/local/Cellar/fzf/0.27.2/shell/key-bindings.bash
  alias update="brew update && brew upgrade"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
