# Macbook Development Handbook

- [Macbook Development Handbook](#macbook-development-handbook)
- [Quickstart](#quickstart)
- [Brew](#brew)
  - [Commands](#commands)
- [Git](#git)
  - [Setup](#setup)
  - [GitHub SSH](#github-ssh)
  - [Cheatsheet](#cheatsheet)
  - [Git based package management](#git-based-package-management)
- [ITerm2](#iterm2)
  - [tmux integration](#tmux-integration)
- [zsh](#zsh)
  - [Configuration files](#configuration-files)
  - [ZLE Cheatsheet](#zle-cheatsheet)
  - [Environment Variables](#environment-variables)
  - [Aliases](#aliases)
  - [Plugins](#plugins)
  - [Aesthetics](#aesthetics)
- [`$HOME`](#home)
- [tmux](#tmux)
- [neovim](#neovim)
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Plugins](#plugins-1)
  - [Core LSPs](#core-lsps)
    - [C / C++ / CMake / Conan](#c--c--cmake--conan)
    - [Java / Maven](#java--maven)
    - [Python / pip](#python--pip)
    - [Scala / sbt](#scala--sbt)
    - [JavaScript / node / npm](#javascript--node--npm)
    - [Rust / cargo](#rust--cargo)
    - [golang](#golang)
    - [Haskell / cabal](#haskell--cabal)
    - [Swift / Xcode](#swift--xcode)
    - [Kotlin / Gradle](#kotlin--gradle)
    - [Agda](#agda)
    - [sh / zsh](#sh--zsh)
    - [Lua](#lua)
  - [Other LSPs](#other-lsps)
    - [json](#json)
    - [yaml](#yaml)
    - [toml](#toml)
    - [xml](#xml)
    - [ini](#ini)
    - [HCL](#hcl)
    - [html](#html)
    - [css](#css)
    - [markdown](#markdown)
    - [latex](#latex)
    - [protobuf](#protobuf)
- [Command Line Tools](#command-line-tools)
  - [kubectl](#kubectl)
  - [minikube](#minikube)
  - [Terraform](#terraform)
  - [Helm](#helm)
  - [AWS](#aws)
  - [GCP](#gcp)
  - [Azure](#azure)
- [Credentials](#credentials)
- [Desktop Applications](#desktop-applications)
  - [VirtualBox](#virtualbox)
  - [Docker](#docker)
  - [NordVPN](#nordvpn)
  - [Chrome](#chrome)
  - [Discord](#discord)
  - [Slack](#slack)
  - [Spotify](#spotify)
  - [Zoom](#zoom)
- [Devices](#devices)

# Quickstart

First, install some dependencies from brew.

```sh
brew install exa glances btop fzf
```

Clone this repo, clone the submodules, and link the config files.

```sh
git clone --recurse-submodules
```

# Brew

We will rely on Brew to install most packages. Packages are installed in `/usr/local/Cellar` and symlinked to `/usr/local/bin`. We will also use Brew to manage services.

## Commands

| Command                           | Description                                |
| --------------------------------- | ------------------------------------------ |
| `brew install <package>`          | Install `<package>`                        |
| `brew uninstall <package>`        | Uninstall `<package>`                      |
| `brew upgrade <package>`          | Upgrade `<package>`                        |
| `brew install --cask <package>`   | Install `<package>` as a cask              |
| `brew uninstall --cask <package>` | Uninstall `<package>` as a cask            |
| `brew upgrade --cask <package>`   | Upgrade `<package>` as a cask              |
| `brew list`                       | List installed packages                    |
| `brew list --versions`            | List installed packages and their versions |
| `brew search <package>`           | Search for `<package>`                     |
| `brew info <package>`             | Get info about `<package>`                 |
| `brew update`                     | Update brew itself                         |
| `brew upgrade`                    | Upgrade all packages                       |
| `brew outdated`                   | List outdated packages                     |
| `brew cleanup`                    | Remove old versions of packages            |
| `brew doctor`                     | Diagnose brew issues                       |
| `brew services list`              | List services managed by brew              |

# Git

## Setup

```sh
brew install git
ln -s ./env/configs/git/.gitconfig ~/.gitconfig
```

## GitHub SSH

To setup SSH, run the following locally:

```sh
EMAIL="ssingal05@gmail.com"
ssh-keygen -t ed25519 -C "$EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

`pbcopy` copies the public key to the clipboard. Add it to GitHub by doing the following:

1. Go to [GitHub SSH settings](https://github.com/settings/keys)
2. Click "New SSH key"
3. Paste the key and click "Add SSH key"

## Cheatsheet

## Git based package management

We want a consistent and repeatable workflow when installing stuff from git. We want each of our packages to have the following functionality:

| Command              | Description                                                  |
| -------------------- | ------------------------------------------------------------ |
| `add <package>`      | download, build, and set as default `<package>[-<version>]`  |
| `remove <package>`   | remove files for `<package>[-<version>]`                     |
| `load <package>`     | download and build `<package>[-<version>]`, but don't use it |
| `versions <package>` | list all versions of `<package>`                             |
| `latest <package>`   | list the latest version of `<package>`                       |

The process roughly looks as follows:

1. Clone the repo
2. Checkout a particular version or branch
3. Build
4. Copy artifacts to `$INSTALL_DIR/<project>-<version>`
5. Symlink `$INSTALL_DIR/<project>` to `$INSTALL_DIR/<project>-<version>`

# ITerm2

## tmux integration

# zsh

## Configuration files

## ZLE Cheatsheet

## Environment Variables

```sh
LANG=en_US.UTF-8
PWD=/Users/sidd
SHELL=/bin/zsh
TERM=xterm-256color
HOME=/Users/sidd
USER=sidd
OLDPWD=/Users/sidd
PATH=...
```

`zsh` already comes pre-installed on macOS. We still want to configure a few things.

```sh
ln -s ./env/configs/zsh/.zshrc ~/.zshrc
```

## Aliases

## Plugins

- zsh-autosuggestions
- zsh-syntax-highlighting
- zsh-completions

## Aesthetics

# `$HOME`

```
.
├── .zshrc
├── .gitconfig -> ./env/configs/git/.gitconfig
├── .tmux.conf -> ./env/configs/tmux/.tmux.conf
├── .tmux -> ./env/configs/tmux/.tmux
├── .vimrc -> ./env/configs/neovim/.vimrc
├── .config
│   └── nvim -> ./env/configs/neovim/.config/nvim
...
├── .aws
│   ├── config
│   └── credentials
├── .npmrc
├── .pypirc
├── .m2
│   └── settings.xml
...
├── env
├── knowledge
├── clusters
├── sandbox
├── packages
├── opt
├── templates
├── vms
├── models
...
├── workspace
│   ├── <organization-1>
│   │   ├── <project-1a>
│   │   ├── <project-1b>
│   │   ...
│   ├── <organization-2>
│   │   ├── <project-2b>
│   │   ...
│   ...
...
├── documents
├── downloads
├── desktop
├── pictures
├── movies
├── music
...
```

# tmux

- Development
- Shell
- Testing
- Tasks
- Debugging
- Package Management
- Git
- Monitor
- Process
- Scratchpad
- Files
- Knowledge
- Env
- Tools

# neovim

## Installation

## Configuration

## Plugins

- treesitter
- surround
- nerd-tree

## Core LSPs

### C / C++ / CMake / Conan

### Java / Maven

### Python / pip

### Scala / sbt

### JavaScript / node / npm

### Rust / cargo

### golang

### Haskell / cabal

### Swift / Xcode

### Kotlin / Gradle

### Agda

### sh / zsh

### Lua

## Other LSPs

### json

### yaml

### toml

### xml

### ini

### HCL

### html

### css

### markdown

### latex

### protobuf

# Command Line Tools

## kubectl

## minikube

## Terraform

## Helm

## AWS

## GCP

## Azure

# Credentials

- SSH
- AWS
- GCP
- Azure
- npm
- PyPI
- Maven
- Dockerhub
- cargo
- GitHub
- NordVPN

# Desktop Applications

## VirtualBox

## Docker

## NordVPN

## Chrome

## Discord

## Slack

## Spotify

## Zoom

# Devices

- Mouse
- Keyboard
- Monitors
- Webcam/Camera
- WiFi
- Bluetooth
- Audio Out
  - Audio interface
  - Wireless Headphones
  - Wired Headphones
  - Speakers
- Audio In
  - Microphone
- Network
