#.bash_profile

export PATH=$PATH:$HOME/bin
export MANPATH=/opt/local/share/man:$MANPATH
export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
export GREP_OPTIONS=' — color=auto'
export EDITOR=vim

source ~/.bash_aliases
source ~/.bash-powerline.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Ignore case during tab completion.
bind 'set completion-ignore-case on'

#parse_git_branch() {
#  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\[\033[36m\]\u\[\033[94m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[95m\]\$(parse_git_branch)\[\033[00m\]$ "