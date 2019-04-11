#.bash_profile

export PATH=$PATH:$HOME/bin
export MANPATH=/opt/local/share/man:$MANPATH
export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
export GREP_OPTIONS=' — color=auto'
export EDITOR=vim
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

source ~/.dotfiles/.bash_aliases
source ~/.dotfiles/.bash-powerline.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Ignore case during tab completion.
bind 'set completion-ignore-case on'

#tell a random chucknorris joke
echo
YELLOW='\033[03;93m'
VALUE=$((1+ RANDOM % 3))

echo
case $VALUE in
  1)
  echo $(curl -s --request GET --url 'https://api.chucknorris.io/jokes/random' --header 'accept: (application/json|text/plain)' | python -c 'import sys, json; print "\n\n"+json.load(sys.stdin)["value"]+"\n\n"') | cowsay -f $(cowsay -l | tail -n +2 | tr ' ' '\n' | gshuf -n 1) | lolcat
    ;;
  2)
  echo $(curl -H "Accept: application/json" https://icanhazdadjoke.com/ | python -c 'import sys, json; print "\n\n"+json.load(sys.stdin)["joke"]+"\n\n"') | cowsay -f $(cowsay -l | tail -n +2 | tr ' ' '\n' | gshuf -n 1) | lolcat
    ;;
  3)
    echo $(fortune | cowsay -f $(cowsay -l | tail -n +2 | tr ' ' '\n' | gshuf -n 1) | lolcat)
    ;;
esac
echo

#parse_git_branch() {
#  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\[\033[36m\]\u\[\033[94m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[95m\]\$(parse_git_branch)\[\033[00m\]$ "
