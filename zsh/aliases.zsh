#basic
alias ll='ls -l'
alias lh='l -d .?*'
alias ld='l -d */'
alias lhd='l -d .?*/'
alias zshconfig="vim ~/.zshrc"
alias zshload="source ~/.zshrc"
alias vimrc='vim ~/.vimrc'
alias q="exit"
alias c="clear"
alias cl="clear; ls -lah"
alias tree='c; tree --dirsfirst'
alias gw='git-worklist'
alias dotfile='cd ~/.dotfiles'
#git
alias gu='git up'
alias gs='git status -sb'
alias gc='git commit'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
alias gdd='c;gs;echo;echo;gd'
alias gp='pushFunc'
alias gt='git tree'
alias gtt='gt main..$(current_branch)'
alias github='open https://github.com/MatthewLaFalce'
alias pull-request='git pull-request -a MatthewLaFalce'
alias issues='git issue'
alias issue-create='git issue create -a MatthewLaFalce'
alias fs='foreman start'

# create a method that creates aliases for all of the ssh configs in ~/.ssh/config
# for example, if you have a config named "work", this will create an alias called "work"
# that will ssh into the server
function ssh-aliases() {
  local custom_prompt='\[\033[36m\]\u\[\033[94m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[00m\]$'

  for i in $(grep "^Host " ~/.ssh/config | awk '{print $2}')
  do
    alias $i="ssh $i "
  done
}
ssh-aliases
