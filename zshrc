# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

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
plugins=(git rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Load RVM
[[ -s "/Users/mongrelion/.rvm/scripts/rvm" ]] && source "/Users/mongrelion/.rvm/scripts/rvm"

# GCC Hack for compiling Ruby in Lion
export CC=gcc-4.2

# Screen bad behaves when no LANG is set, so...
export LANG="en_US.UTF-8"

# PostgreSQL data directory
export PGDATA=/usr/local/Cellar/postgresql/9.0.4/data

# Run JRuby with support for 1.9
export JRUBY_OPTS=--1.9

# Pick up node libraries
export NODE_PATH=/usr/local/lib/node_modules
