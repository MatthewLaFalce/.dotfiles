#.bash_profile

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

#function that gets the git branch if in a directory that is git controlled
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

updateDotfiles() {
  if ping -q -c 1 -W 1 github.com > /dev/null 2>&1; then
    cd .dotfiles; git fetch
    status=$(git status -sb)
    if [[ $status == *"behind"* ]]; then
      echo "Config files: Behind"
      git up
      source .bash_profile
      echo "Config files: Updated"
    fi
    cd
  fi
}
updateDotfiles
export $TERM=xterm-256color
export GOPATH=$HOME/go
export PATH="/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH=$PATH:$HOME/bin:$HOME/Github/schema_to_md:$HOME/.dotfiles/bin:$GOPATH/bin
export PATH="$PATH:$HOME/.composer/vendor/bin"
export GPG_TTY=$(tty)
export CLICOLOR=1
export EDITOR=vim
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export NVM_DIR="$HOME/.nvm"
export PS1="\[\033[36m\]\u\[\033[94m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[95m\]\$(parse_git_branch)\[\033[00m\]$ "

#These all help with psqlrc configuration
export YELLOW=`echo -e '\033[1;33m'`
export LIGHT_CYAN=`echo -e '\033[1;36m'`
export GREEN=`echo -e '\033[0;32m'`
export NOCOLOR=`echo -e '\033[0m'`
export LESS="-iMSx4 -FXR"
# export PAGER="sed \"s/^\(([0-9]\+ [rows]\+)\)/$GREEN\1$NOCOLOR/;s/^\(-\[\ RECORD\ [0-9]\+\ \][-+]\+\)/$GREEN\1$NOCOLOR/;s/|/$GREEN|$NOCOLOR/g;s/^\([-+]\+\)/$GREEN\1$NOCOLOR/\" 2>/dev/null | less"

HISTSIZE=1000                         # Set HISTSIZE length
HISTFILESIZE=2000                     # Set HISTFILESIZE length
HISTCONTROL=ignoreboth                # don't put duplicate lines or lines starting with space in the history.
SSH_ENV="$HOME/.ssh/environment"      # Set SSH ENV

bind 'set completion-ignore-case on'  # Ignore case during tab completion.
shopt -s histappend              # append to the history file, don't overwrite it

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                        # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"      # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Matt/google-cloud-sdk/path.bash.inc' ]; then . '/Users/Matt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Matt/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/Matt/google-cloud-sdk/completion.bash.inc'; fi

# The following line enables bash completion for the hub command
# Repo: https://github.com/github/hub
if [ -f ~/.dotfiles/bin/hub.bash_completion ]; then . ~/.dotfiles/bin/hub.bash_completion; fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -d /usr/local/share/chruby ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

  RUBIES+=(~/.RVM/RUBIES/*)
  RUBIES+=(~/.RUBIES/*)
fi

if [ -f .dotfiles/.bash_aliases ]; then
  source .dotfiles/.bash_aliases
fi

if [ -f .dotfiles/.bash-powerline.sh ]; then
  source .dotfiles/.bash-powerline.sh
fi

if [ -f .dotfiles/bin/bash_colors.sh ]; then
  source .dotfiles/bin/bash_colors.sh
fi

if [ "$(uname)" = "Linux" ]; then
  export LS_COLORS="rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:*.apk=00;92:*.sql=00;93:*.pdf=00;93:*.json=00;93:*vimrc=00;95:*bashrc=00;95:*bash_aliases=00;95:*profile=00;95:*gitconfig=00;95:*.txt=00;93:"
elif [ "$(uname)" = "Darwin" ]; then
  export LSCOLORS=GxFxBxDxCxegedabagacad
  export MANPATH=/opt/local/share/man:$MANPATH
fi

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
}
else
  start_agent;
fi

#Add shell completion for gh command (The offical Github CLI)
eval "$(gh completion -s bash)"

# Add shell completion for tasty-cli command
complete -F get_tasty_cli_targets tasty-cli
function get_tasty_cli_targets()
{
  COMPREPLY=(`tasty-cli help -c "${COMP_WORDS[@]:1}"`)
}

cd ~/Github;c
