export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PGDATA=/usr/local/var/postgres

PS1SYM='\[\e[1;34m\]∴\[\e[m\]'

function git_branch {
  false && [ -e .git ] && echo "\[\e[1;32m\]`git rev-parse --abbrev-ref HEAD` $PS1SYM "
}

# Prompt theme.
function ps1 {
  echo " $PS1SYM `git_branch`"
}
PS1=`ps1`

# Vi mode
#set -o vi

# Autocomplete ignores case
set completion-ignore-case on

# Git autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Enable node via nvm
function en {
  source $(brew --prefix nvm)/nvm.sh
  echo "nvm enabled."
}

# Enable ruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
#chruby 2.1

# Aliases
alias td="tail -f log/development.log"
alias tt="tail -f log/test.log"
alias tp="tail -f log/production.log"
alias cl="echo '' > log/development.log; echo '' > log/test.log; clear"
alias rorig="rm **/*.orig"

# Git aliases
alias gm="git mergetool -t opendiff"
alias ga="git add"
alias gap="git add -p"
alias gs="git st"
alias gc="git ci"
alias gdf="git df"
alias br="git br"
alias cb="git co -b"
alias gf="git fetch origin"
alias b="git blame"

alias z="bundle exec zeus start"
alias g="bundle exec guard start"
alias c="zeus c"
alias t="zeus test"
alias f="foreman s -f Zeusfile"
alias ssl="bundle exec foreman run ssl -f Zeusfile"
alias solr="bundle exec foreman run solr -f Zeusfile"
alias web="bundle exec foreman run web -f Zeusfile"

alias l="ls -laG"
