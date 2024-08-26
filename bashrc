export LANG="en_US.UTF-8"
export EDITOR='nvim'
export RIPGREP_CONFIG_PATH=${HOME}/code/personal/mongrelionrc/ripgrep
export PATH="${PATH}:${HOME}/.local/bin"

SYM="x"
PS1SYM="\[\e[0;33m\]$SYM\[\e[m\]"
PS1=" $PS1SYM "

# Set LS_COLORS os that ls can show nice colors
eval "$(dircolors -b)"

# Vi mode
set -o vi
bind -m vi-insert "\C-l.":clear-screen

# Git aliases
alias cm="git commit -v"
alias gs="git st"
alias gdf="git df"
alias gp="git pull"
alias amend="git commit --amend -C HEAD"
alias rc="git rebase --continue"
alias lg="lazygit"

alias ls="ls --color=always --block-size=M"
alias l="tree -L 1"
alias vim=nvim

# Docker
alias d="docker"
alias dc="docker-compose"
alias ld="lazydocker"

# Kubernetes
alias k="kubectl"
alias kg="kubectl get"
alias kx="kubectx"
alias dr="docker run --rm -it"

# Terraform
alias t="terraform"

alias py="source ~/.venv/bin/activate"



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

function _init_gpg_ssh_agent {
  export GPG_TTY=$(tty)
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  echo UPDATESTARTUPTTY | gpg-connect-agent > /dev/null
}

function _init_vanilla_ssh_agent {
  # check if the agent is not running already
  count=$(procs --no-header ssh-agent | wc -l)
  if [ "${count}" == 0 ]; then
    eval "$(ssh-agent)"
    ssh-add ~/.ssh/id_ed25519
  fi
}

function ohyeah {
  printf "8==========|D"; while true; do printf "~"; sleep 1; done
}


export SHELL=/usr/sbin/bash
source /usr/share/fzf/key-bindings.bash
source /opt/asdf-vm/asdf.sh
source /usr/share/bash-completion/completions/asdf
source /usr/share/bash-completion/completions/git

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"

_init_gpg_ssh_agent
# _init_vanilla_ssh_agent
