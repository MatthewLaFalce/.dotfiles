#.bash_aliases

# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=tty'
  alias grep='grep --color=tty'
# fi

pushFunc(){
  git push || git push --set-upstream origin $(git branch | grep \* | cut -d ' ' -f2)
}

openFunc(){
  open $1 2>/dev/null || start $1
}

currentBranch(){
  git branch | grep \* | cut -d ' ' -f2
}

#basics
alias ll='ls -l --group-directories-first'
alias l='ll -ah'
alias lh='l -d .?*'
alias ld='l -d */'
alias lhd='l -d .?*/'
alias cl='clear; l'
alias c='clear'
alias q='exit'
alias open='openFunc'
alias tree='c; tree --dirsfirst'
alias gw='git-worklist'
alias gen-issue-report='git-worklist -s | clean-issues'
alias dash='sampler -c ~/.dotfiles/sampler_config.yml'

#directories
alias ..='cd ..'
alias ...='..; cd ..'
alias ....='...; cd ..'
alias .....='....; cd ..'

# Shortcuts to vimrc and bashrc
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'
alias bashalias='vim ~/.bash_aliases'
alias loadbash='source ~/.bash_profile'
alias dotfile='cd; cd .dotfiles/'
alias jek='bundle _1.16.0_ exec jekyll serve'

#git
alias git='hub'
alias gu='git up'
alias gs='git status -sb'
alias gc='git commit'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
alias gdd='c;gs;echo;echo;gd'
alias gp='pushFunc'
alias gt='git tree'
alias gtt='gt master..$(currentBranch)'
alias github='open https://github.com/MatthewLaFalce'
alias pull-request='git pull-request -a MatthewLaFalce'
alias issues='git issue'
alias issue-create='git issue create -a MatthewLaFalce'

#rails
# alias rails='bundle exec rails'
# alias rs='rails s'
# alias rc='rails c'
alias rj='bundle exec que ./config/environment.rb'
alias rc='rails console'
alias rcs='rails console --sandbox'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rdc='rake db:create'
alias rdd='rake db:drop'
alias rdm='rake db:migrate'
alias rdms='rake db:migrate:status'
alias rdmtc='rake db:migrate db:test:clone'
alias rdr='rake db:rollback'
alias rdrs='rake db:reset'
alias rds='rake db:seed'
alias rdsl='rake db:schema:load'
alias rdtc='rake db:test:clone'
alias rdtp='rake db:test:prepare'
alias rgen='rails generate'
alias rgm='rails generate migration'
alias rlc='rake log:clear'
alias rmd='rake middleware'
alias rn='rake notes'
alias rp='rails plugin'
alias rr='rake routes'
alias rrg='rake routes | grep'
alias rs='rails server'
alias rsd='rails server --debugger'
alias rsp='rails server --port'
alias rsts='rake stats'
alias rt='rake test'
alias ru='rails runner'

alias sshconfig='vim ~/.ssh/config'
alias grouper='ssh grouper'
alias vextractor='ssh vextractor'
alias sgrouper='sftp grouper'

#json tool
alias json="cat $1 | python -m json.tool"

if [ "$(uname)" = "Darwin" ]; then
  eval "$(thefuck --alias)"
fi
