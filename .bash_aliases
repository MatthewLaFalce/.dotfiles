#.bash_aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

#basics
alias ll='ls -l'
alias l='ll -ah'
alias lh='l -d .?*'
alias ld='l -d */'
alias lhd='l -d .?*/'
alias cl='clear; l'
alias c='clear'
alias q='exit'
alias h='history'
alias t='time'
alias k='kill'

#directories
alias ..='cd ..'
alias ...='..; cd ..'
alias ....='...; cd ..'
alias .....='....; cd ..'

# Shortcuts to vimrc and bashrc
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'
alias loadbash='source ~/.bash_profile'
alias dotfile='cd; cd .dotfiles/'
alias vpdf='cd; cd vPDF; git up'
alias jek='bundle _1.16.0_ exec jekyll serve'
pushFunc(){
  git push || git push --set-upstream origin $(git branch | grep \* | cut -d ' ' -f2)
}

#git
alias gs='git status -sb'
alias gc='git commit'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
alias gp='pushFunc'
alias gt='git tree'

#rails
alias rails='bundle exec rails'
alias rs='rails s'
alias rc='rails c'
alias rj='bundle exec que ./config/environment.rb'
alias deploy='bundle exec cap production deploy'

#run script to tell a joke
alias joke='sh ~/.dotfiles/joke_generator.sh'

#start pgcli with io_development
alias db='pgcli io_development'
alias dev='pgcli vpdf_development'

#json tool
alias json="cat $1 | python -m json.tool"
