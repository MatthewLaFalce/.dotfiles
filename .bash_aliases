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

defaultBranch(){
  git remote show origin | grep 'HEAD' | cut -d':' -f2 | sed -e 's/^ *//g' -e 's/ *$//g'
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
alias gu='git up'
alias gs='git status -sb'
alias gc='git commit'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
alias gdd='c;gs;echo;echo;gd'
alias gds='c;gs;echo;echo;gd --cached'
alias gp='pushFunc'
alias gt='git tree'
alias gtt='gt $(defaultBranch)..$(currentBranch)'
alias github='open https://github.com/MatthewLaFalce'
alias issues='gh issues'

#rails
alias rails='bundle exec rails'
alias rj='bundle exec que ./config/environment.rb'
alias rc='rails console'
alias rcs='rails console --sandbox'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rdc='rails db:create'
alias rdm='rails db:migrate'
alias rdms='rails db:migrate:status'
alias rdmtc='rails db:migrate db:test:clone'
alias rdr='rails db:rollback'
alias rdrs='rails db:reset'
alias rds='rails db:seed'
alias rdsl='rails db:schema:load'
alias rdtc='rails db:test:clone'
alias rdtp='rails db:test:prepare'
alias rgen='rails generate'
alias rgm='rails generate migration'
alias rlc='rails log:clear'
alias rmd='rails middleware'
alias rn='rails notes'
alias rp='rails plugin'
alias rr='rails routes'
alias rrg='rails routes | grep'
alias rs='rails server'
alias rsd='rails server --debugger'
alias rsp='rails server --port'
alias rsts='rails stats'
alias rt='rails test'
alias ru='rails runner'

alias sshconfig='vim ~/.ssh/config'
alias grouper='ssh grouper'
alias vextractor='ssh vextractor'
alias sgrouper='sftp grouper'

#json tool
alias json="cat $1 | python -m json.tool"

# alias colors="source bash_colors.sh; colors"
# alias colorTest="source bash_colors; colortest"

if [ "$(uname)" = "Darwin" ]; then
  eval "$(thefuck --alias)"
fi
