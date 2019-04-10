# .dotfiles

### Prerequisites
- MacOS
- VimPlug Installed
- Powerline Fonts

### Installation
- Clone this project into your home directory

```bash
git clone git@github.com:MatthewLaFalce/.dotfiles.git
```

- Create symbolic links to .bash_profile, .vimrc, .gitconfig

``` bash
ln -s .dotfiles/.bash_profile
ln -s .dotfiles/.gitconfig
ln -s .dotfiles/.vimrc
```

- Close and reopen terminal

#### Vim Plug Installation

``` bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
