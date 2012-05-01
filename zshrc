# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true" # screen behaves dodgy when this is set to false

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rbenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Screen bad behaves when no LANG is set, so...
export LANG="en_US.UTF-8"

# PostgreSQL data directory
export PGDATA=/usr/local/Cellar/postgresql/9.0.4/data

# Run JRuby with support for 1.9
export JRUBY_OPTS=--1.9

# Pick up node libraries
export NODE_PATH=/usr/local/lib/node_modules

# - Aliases - #
alias bx='bundle exec'
alias rs=bundle exec rails s -b 127.0.0.1

# - rbenv - #
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
