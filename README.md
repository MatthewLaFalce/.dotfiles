<h1 align="center">Welcome to .dotfiles 👋</h1>
<p>
  <img src="https://img.shields.io/badge/version-2.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/MatthewLaFalce/.dotfiles/blob/master/README.md">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" target="_blank" />
  </a>
  <a href="https://github.com/MatthewLaFalce/.dotfiles/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/MatthewLaFalce/.dotfiles.svg?logo=apache"/>
  </a>
</p>

> Collection of Awesome and Practical Configuration Files.

### 🏠 [Homepage](https://github.com/MatthewLaFalce/.dotfiles)

## Prerequisites
- MacOS/Linux
- [VimPlug](https://github.com/junegunn/vim-plug)
- [Powerline Fonts](https://github.com/powerline/fonts)
- [iTerm2](https://github.com/gnachman/iTerm2)
- [coreutils](https://formulae.brew.sh/formula/coreutils)
- [cowsay](https://formulae.brew.sh/formula/cowsay)
- [lolcat](https://formulae.brew.sh/formula/lolcat)


## Install

```bash
##Clone this git repo
git clone git@github.com:MatthewLaFalce/.dotfiles.git

##Create symbolic links to master files
ln -s .dotfiles/.bash_profile
ln -s .dotfiles/.gitconfig
ln -s .dotfiles/.vimrc
```

## Screen Shots
bash prompt

![alt text](images/bash_prompt.png)

  vim editor

![alt text](images/vim_editor.png)

## Sample Install Series

  ```bash
##Install vim plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

##Powerline Fonts
#Clone
  git clone https://github.com/powerline/fonts.git --depth=1
#Install
  cd fonts
  ./install.sh
#Clean-up a bit
  cd ..
  rm -rf fonts
#May need to do other configurations to make the fonts visible in the terminal

##Install packages for bash welcome message
  brew install coreutils
  brew install cowsay
  brew install lolcat
  gem install lolcat

##Clone this git repo
  git clone git@github.com:MatthewLaFalce/.dotfiles.git

##Create symbolic links to master files
  ln -s .dotfiles/.bash_profile
  ln -s .dotfiles/.gitconfig
  ln -s .dotfiles/.vimrc
  ```

### Helpful Links
- [Colorful Cowsay Help](http://yjyao.com/2014/09/colorful-cowsay-in-your-terminal.html)

## Author

  👤 **Matthew LaFalce**

  * Github: [@MatthewLaFalce](https://github.com/MatthewLaFalce)

## 🤝 Contributing

  Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/MatthewLaFalce/.dotfiles/issues).

## Show your support

  Give a ⭐️ if this project helped you!

## 📝 License

  Copyright © 2019 [Matthew LaFalce](https://github.com/MatthewLaFalce).<br />
  This project is [Apache-2.0](https://github.com/MatthewLaFalce/.dotfiles/blob/master/LICENSE) licensed.

  ***
  _This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
