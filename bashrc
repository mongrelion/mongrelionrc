export EDITOR='vim'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PGDATA=/usr/local/var/postgres

# Git autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Pass autocompletion
source /usr/local/etc/bash_completion.d/password-store

PS1SYM='\[\e[1;34m\]∴\[\e[m\]'

# Prompt theme.
function ps1 {
  echo " $PS1SYM "
}
PS1=`ps1`

# Autocomplete ignores case
set completion-ignore-case on

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
alias d="cap production deploy"
alias rev="cap production deploy:check_revision"

alias td="tail -f log/development.log"
alias tt="tail -f log/test.log"
alias tp="tail -f log/production.log"
alias cl="du -h log/; echo '' > log/development.log; echo '' > log/test.log; echo 'Logs reset!'; du -h log/"
alias rorig="rm **/*.orig"

# Git aliases
alias cm="git cm"
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
alias up="git fetch origin && git rebase origin/master master"
alias stash="git stash save"

alias z="bundle exec zeus start"
alias g="bundle exec guard start"
alias c="zeus c"
alias t="zeus test"
alias f="foreman s -f Zeusfile"
alias ssl="bundle exec foreman run ssl -f Zeusfile"
alias solr="bundle exec foreman run solr -f Zeusfile"
alias web="bundle exec foreman run web -f Zeusfile"
alias m="RAILS_ENV=test bundle exec rake db:migrate"
alias mc="bundle exec mailcatcher --foreground"
alias rs="bundle exec rspec"

alias l="ls -laG"
export GOPATH=/Users/mongrelion/code/personal/go
