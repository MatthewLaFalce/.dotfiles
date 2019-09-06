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

| Packages | Packages | Casks |
| --- | --- | --- |
| [Coreutils](https://formulae.brew.sh/formula/coreutils) | [Cowsay](https://formulae.brew.sh/formula/cowsay) | [Sampler](https://github.com/sqshq/sampler) |
| [Hub](https://github.com/github/hub) | [iTerm2](https://github.com/gnachman/iTerm2) |
| [Lolcat](https://formulae.brew.sh/formula/lolcat) | [Powerline Fonts](https://github.com/powerline/fonts) |
| [Standup](https://github.com/kamranahmedse/git-standup) | [VimPlug](https://github.com/junegunn/vim-plug) |

## Install

```bash
## Clone this git repo
git clone git@github.com:MatthewLaFalce/.dotfiles.git

## Run the Install Script
. install.sh
```

## Cool Features


```bash
# Uses the git standup CLI to generate a txt file of all of the commits
# you have made to a project or batch of projects in the past 7 days
~  gen_weekly_status


# Generates release tags incrementally based on the option passed
### release

~  release -h
usage: release [Mmp] [message]

  -d Dry run
  -h Display this help page
  -M for a major release
  -m for a minor release
  -p for a patch release

 Example: release -p "Some fix"
 means create a patch release with the message "Some fix"

# Shows all issues assigned to the specified user for every git sub
# directory in the current working directory
~  git-worklist

```

## Screenshots
bash prompt

![alt text](images/bash_prompt.png)

  vim editor

![alt text](images/vim_editor.png)

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
