pushFunc(){
  git push || git push --set-upstream origin $(git branch | grep \* | cut -d ' ' -f2)
}

updateDotfiles() {
  if ping -q -c 1 -W 1 github.com > /dev/null 2>&1; then
    cd ~/.dotfiles; git fetch
    # % status=$(git status -sb)
    if [[ $(git status -sb) == *"behind"* ]]; then
      echo "Config files: Behind"
      git up
      source .bash_profile
      echo "Config files: Updated"
    fi
    cd
  fi
}

startingDir=$(pwd)

updateDotfiles
export TERM="xterm-256color" # This sets up colors properly
export EDITOR='vim'
export PATH=$PATH:$HOME/bin:$HOME/Github/schema_to_md:$HOME/.dotfiles/bin:$(go env GOPATH)/bin

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/Matt/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(rails zsh-autosuggestions zsh-syntax-highlighting chruby colored-man-pages jsontools colorize)
source $ZSH/oh-my-zsh.sh
if [ -d /usr/local/share/chruby ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

  RUBIES+=(~/.RVM/RUBIES/*)
  RUBIES+=(~/.RUBIES/*)
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

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

#Optionally to hide the “user@hostname” info when you’re logged in as yourself on your local machine, this should be at the bottom of the file
prompt_context(){}

# Prevent 'cd' from running if VS Code is launching the terminal
if [[ "$TERM_PROGRAM" != "vscode" && -z "$VSCODE_CWD" ]]; then
  cd ~/Github
else
  cd $startingDir
fi
export PATH="/usr/local/opt/maven@3.5/bin:$PATH"
if [ "$(uname)" = "Linux" ]; then
elif [ "$(uname)" = "Darwin" ]; then
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home"
fi
source ~/.dotfiles/zsh/aliases.zsh
