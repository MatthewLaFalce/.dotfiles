# Zsh Installation Process

## Installing oh-my-zsh


## Installing AutoJump

> https://github.com/wting/autojump#automatic

```bash
brew install autojump
```

## Installing zsh-autosuggestions

> https://github.com/zsh-users/zsh-autosuggestions

```bash
#Clone this repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
plugins=(zsh-autosuggestions)
```

## Installing zsh-syntax-highlighting

> https://github.com/zsh-users/zsh-syntax-highlighting

```bash
#Clone this repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
plugins=( [plugins...] zsh-syntax-highlighting)
```
