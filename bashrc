export LANG="en_US.UTF-8"
export EDITOR='vim'
export GOBIN=$HOME/code/os/go/bin
export GOPATH=/Users/mongrelion/code/personal/go
export PGDATA=/usr/local/var/postgres
export NVM_DIR=~/.nvm
export NOTESDIR=$HOME/.notes/
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$GOBIN"

# Git autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash

SYM="λ"
PS1SYM="\[\e[0;33m\]$SYM\[\e[m\]"

# Prompt theme.
function ps1 {
  echo " $PS1SYM "
}
PS1=`ps1`

# Vi mode
set -o vi

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
alias d="bundle exec cap production deploy"
alias rev="cap production deploy:check_revision"

alias td="tail -f log/development.log"
alias tt="tail -f log/test.log"
alias tp="tail -f log/production.log"
alias rorig="rm **/*.orig"

function cl {
  du -hs log/
  ls log/*.log | awk '{ print "echo \"\" > "$1 }' | sh
  du -hs log/
}

# Git aliases
alias such=git
alias wow=git
alias much=git
alias very=git
alias cm="git commit -v"
alias ga="git commit -a --amend -C HEAD"
alias gad="git add"
alias gap="git add -p"
alias gs="git st"
alias gdf="git df"
alias br="git br"
alias cb="git co -b"
alias gf="git fetch origin"
alias b="git blame"
alias up="git fetch origin && git rebase origin/master master"
alias stash="git stash save"
alias dfc="git df --cached"
alias reset="git reset HEAD"
alias mycommits="git log --author=Carlos"
alias elc="git rebase -i HEAD^"
alias amend="git commit --amend"
alias rc="git rebase --continue"
alias pull="git pull --rebase"

alias c="./bin/rails c"
alias t="./bin/rspec"
alias solr="./bin/rake sunspot:solr:run"
alias web="./bin/spring rails s"
alias sk="bundle exec sidekiq -C config/sidekiq.yml -c 1"
alias m="./bin/rake db:migrate"
alias mt="RAILS_ENV=test bundle exec rake db:migrate"
alias mc="bundle exec mailcatcher --foreground"

alias l="ls -laG"

alias motd="fortune | cowsay | lolcat"
alias db="pgcli springest_development"

# Clean Redis
alias credis="echo 'FLUSHALL' | redis-cli"

alias v=vagrant

# Edit hosts file
alias eh="sudo vim /etc/hosts"

# Start ElasticSearch
function es {
  minmem=256M
  maxmem=512M
  pidfile=/usr/local/var/run/elasticsearch.pid
  configfile=$(brew --prefix elasticsearch)/config/elasticsearch.yml
  ES_MIN_MEM=$minmem ES_MAX_MEM=$maxmem elasticsearch -d -p $pidfile $configfile
}

export VAGRANT_NO_PARALLEL=true
