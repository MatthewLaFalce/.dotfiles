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

# Initiailize dynamic variables
startingDir=$(pwd)

updateDotfiles
export TERM="xterm-256color" # This sets up colors properly
export EDITOR='vim'
export PATH=$PATH:$HOME/bin:$HOME/Github/schema_to_md:$HOME/.dotfiles/bin:$(go env GOPATH)/bin

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
alias ls='gls --color=auto' # GNU ls for colors on macOS to match linux
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

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
source ~/.dotfiles/zsh/aliases.zsh

# Set up Android SDK environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Added by Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Symlink all scripts from work_utils to ~/bin
ln -sf "$HOME/Github/work_utils/bin/*" "$HOME/bin/"

if [ -d "$HOME/.dotfiles/.claude/skills" ] && [ -d "$HOME/.claude" ]; then
  mkdir -p "$HOME/.claude/skills"
  for skill in "$HOME/.dotfiles/.claude/skills"/*/; do
    ln -sfn "$skill" "$HOME/.claude/skills/$(basename "$skill")"
  done
fi


export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export LS_COLORS="rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:*.apk=00;92:*.sql=00;93:*.pdf=00;93:*.md=01;32:*.json=00;93:*vimrc=00;95:*bashrc=00;95:*bash_aliases=00;95:*profile=00;95:*gitconfig=00;95:*.txt=00;93:"

. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/mysql-8.0.45-macos15-arm64/bin:$PATH"

alias claude-mem='bun "/Users/icsdev0/.claude/plugins/cache/thedotmack/claude-mem/10.5.2/scripts/worker-service.cjs"'

alias pClaude="CLAUDE_CONFIG_DIR=~/.claude-personal /Users/icsdev0/.local/bin/claude"
alias pswarm='CLAUDE_CONFIG_DIR=~/.claude-personal claude-swarm orchestrate'
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000

export SSH_AUTH_SOCK=/Users/icsdev0/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
