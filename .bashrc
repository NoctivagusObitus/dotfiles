#!/bin/bash
# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
  # Shell is non-interactive.  Be done now!
  return
fi

# Put your fun stuff here.
export HISTSIZE=3000
export HISTFILESIZE=3000
export HISTCONTROL=ignoreboth:erasedups

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export ENV_FILE_PATH=$HOME/scripts/env.sh

export PASSWORD_STORE_DIR=/mnt/magenta/Dokumente/pass

# move disturbing go folder away from home folder
export GOPATH=$HOME/.local/go
export PATH=$GOPATH/bin:$PATH
# same for node_modules (only for npm global -> npm -g)
export NPM_CONFIG_PREFIX=$HOME/.local/node_modules
export PATH=$NPM_CONFIG_PREFIX/bin:$PATH

alias als='aws s3 ls --human-readable'
alias trino=~/git/libs/sc-tools/trino-cli/trino-cli.sh
alias compose=~/git/libs/sc-tools/compose/compose.sh
alias ls='ls --color=auto'
alias new='(&>/dev/null foot -D "$PWD" &)'
