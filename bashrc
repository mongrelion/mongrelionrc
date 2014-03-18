# Prompt theme.
PS1=' \[\e[1;34m\]∴\[\e[m\] '

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

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

# Enable ruby via chruby
function er {
  source /usr/local/share/chruby/chruby.sh
  chruby 2.0.0-p353
  echo "chruby enabled."
}

# Automatically enable ruby
er

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

alias z="bundle exec zeus start"
alias g="bundle exec guard start"
alias c="zeus c"
alias t="zeus test"
alias f="foreman s -f Zeusfile"
alias ssl="bundle exec foreman run ssl -f Zeusfile"
alias solr="bundle exec foreman run solr -f Zeusfile"

alias l="ls -laG"
