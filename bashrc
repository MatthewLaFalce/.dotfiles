#.bashrc

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#basics
alias l='ls -lah'
alias ls='ls -l'
alias cl='clear; l'
alias c='clear'
alias q='exit'
alias h='history'
alias t='time'
alias k='kill'

#directories
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

# Shortcuts to vimrc and bashrc
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'
alias loadbash='source ~/.bash_profile'

# Let there be color in grep!
export GREP_OPTIONS=' — color=auto'

# Set Vim as my default editor
export EDITOR=vim

# Ignore case during tab completion.
bind 'set completion-ignore-case on'

#git
alias gs='git status'
alias gc='git commit'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
