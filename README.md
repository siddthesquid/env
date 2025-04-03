# Macbook Development Handbook

- [Macbook Development Handbook](#macbook-development-handbook)
- [Quickstart](#quickstart)
- [`$HOME`](#home)
- [Environment Variables](#environment-variables)
- [Workspaces](#workspaces)
  - [Named workspace](#named-workspace)
  - [Path-based workspace](#path-based-workspace)
  - [Other workspaces](#other-workspaces)
  - [Workspace types](#workspace-types)
  - [Javascript](#javascript)
    - [`ts-npm-monorepo-standard`](#ts-npm-monorepo-standard)
    - [`ts-yarn-monorepo-standard`](#ts-yarn-monorepo-standard)
    - [`ts-pnpm-monorepo-standard`](#ts-pnpm-monorepo-standard)
    - [`ts-npm-single-standard`](#ts-npm-single-standard)
    - [`ts-yarn-single-standard`](#ts-yarn-single-standard)
    - [`ts-pnpm-single-standard`](#ts-pnpm-single-standard)
  - [Python](#python)
    - [`python-pip-standard`](#python-pip-standard)
    - [`python-poetry-standard`](#python-poetry-standard)
    - [`python-conda-standard`](#python-conda-standard)
  - [Rust](#rust)
    - [`rust-cargo-standard`](#rust-cargo-standard)
  - [Go](#go)
    - [`go-standard`](#go-standard)
  - [Java](#java)
    - [`java-maven-standard`](#java-maven-standard)
    - [`java-gradle-standard`](#java-gradle-standard)
  - [C++](#c)
    - [`cpp-cmake-monorepo-standard`](#cpp-cmake-monorepo-standard)
    - [`cpp-cmake-single-standard`](#cpp-cmake-single-standard)
  - [Scala](#scala)
    - [`scala-sbt-standard`](#scala-sbt-standard)
    - [`scala-maven-standard`](#scala-maven-standard)
  - [Kotlin](#kotlin)
    - [`kotlin-gradle-standard`](#kotlin-gradle-standard)
  - [Swift](#swift)
    - [`swift-xcode-standard`](#swift-xcode-standard)
  - [Agda](#agda)
    - [`agda-standard`](#agda-standard)
  - [Terraform](#terraform)
    - [`terraform-standard`](#terraform-standard)
  - [Kubernetes](#kubernetes)
    - [`kubernetes-standard`](#kubernetes-standard)
  - [Misc](#misc)
    - [`unknown`](#unknown)
- [Brew](#brew)
  - [Commands](#commands)
- [Git](#git)
  - [Cheatsheet](#cheatsheet)
  - [Git based package management](#git-based-package-management)
- [ITerm2](#iterm2)
  - [Colors](#colors)
  - [Font](#font)
- [zsh](#zsh)
  - [Shell lifecycle](#shell-lifecycle)
  - [Configuration files](#configuration-files)
  - [Variables](#variables)
    - [Arrays](#arrays)
    - [Strings](#strings)
    - [Numeric](#numeric)
    - [Scope and Function Handling](#scope-and-function-handling)
  - [Basic Grammar](#basic-grammar)
    - [Simple Command](#simple-command)
    - [Redirection](#redirection)
    - [Pipeline](#pipeline)
    - [Sublist](#sublist)
    - [List](#list)
    - [Examples](#examples)
  - [Conditionals](#conditionals)
    - [File Existence](#file-existence)
    - [File Attribute](#file-attribute)
    - [File Comparison](#file-comparison)
    - [String](#string)
    - [Arithmetic](#arithmetic)
    - [Options](#options)
    - [Logical](#logical)
  - [Control Structures](#control-structures)
  - [Expansion](#expansion)
    - [History](#history)
    - [Alias](#alias)
    - [Process](#process)
    - [Parameter](#parameter)
    - [Command](#command)
    - [Arithmetic](#arithmetic-1)
    - [Brace](#brace)
    - [Filename expansion](#filename-expansion)
    - [Filename generation](#filename-generation)
    - [Modifiers](#modifiers)
      - [Path manipulation](#path-manipulation)
      - [Text formatting](#text-formatting)
      - [Miscellaneous](#miscellaneous)
  - [ZLE](#zle)
  - [Jobs](#jobs)
  - [Completion system](#completion-system)
  - [Options](#options-1)
  - [Editors](#editors)
    - [`less`](#less)
    - [`xxd`](#xxd)
    - [`vim`, `vi`](#vim-vi)
    - [`nano`](#nano)
    - [`emacs`](#emacs)
  - [Stream manipulation](#stream-manipulation)
    - [`cat` - con`cat`enate](#cat---concatenate)
    - [`awk`](#awk)
    - [`sed`](#sed)
    - [`expand`](#expand)
    - [`sort`](#sort)
    - [`uniq`](#uniq)
    - [`jq`](#jq)
    - [`grep`](#grep)
    - [`cut`](#cut)
    - [`tr`](#tr)
    - [`wc`](#wc)
    - [`head`](#head)
    - [`tail`](#tail)
    - [`echo`](#echo)
    - [`grep`](#grep-1)
    - [`tee`](#tee)
    - [`xargs`](#xargs)
  - [Cryptography](#cryptography)
    - [`ssh-keygen`](#ssh-keygen)
    - [`ssh-copy-id`](#ssh-copy-id)
    - [`ssh-agent`](#ssh-agent)
    - [`ssh-add`](#ssh-add)
    - [`ssh`](#ssh)
    - [`scp`](#scp)
    - [`rsync`](#rsync)
    - [`gpg`](#gpg)
    - [`sftp`](#sftp)
    - [`openssl`](#openssl)
  - [Networking](#networking)
    - [`curl`](#curl)
    - [`wget`](#wget)
    - [`netstat`](#netstat)
    - [`ifconfig`](#ifconfig)
    - [`ip`](#ip)
    - [`route`](#route)
    - [`ping`](#ping)
    - [`traceroute`](#traceroute)
    - [`mtr`](#mtr)
    - [`dig`](#dig)
    - [`nslookup`](#nslookup)
    - [`tcpdump`](#tcpdump)
    - [`nmap`](#nmap)
    - [`whois`](#whois)
    - [`ufw`](#ufw)
    - [`iptables`](#iptables)
  - [Compression](#compression)
    - [`tar`](#tar)
    - [`gzip`](#gzip)
    - [`bzip2`](#bzip2)
    - [`xz`](#xz)
    - [`zip`](#zip)
    - [`unzip`](#unzip)
  - [Filesystem](#filesystem)
    - [`cp`](#cp)
    - [`ln`](#ln)
    - [`mv`](#mv)
    - [`rm`](#rm)
    - [`mkdir`](#mkdir)
    - [`rmdir`](#rmdir)
    - [`find`](#find)
    - [`ls`](#ls)
    - [`lsblk`](#lsblk)
    - [`tree`](#tree)
    - [`df`](#df)
    - [`du`](#du)
    - [`free`](#free)
    - [`file`](#file)
    - [`diff`](#diff)
    - [`cmp`](#cmp)
    - [`comm`](#comm)
    - [`patch`](#patch)
    - [`touch`](#touch)
    - [`mkfifo`](#mkfifo)
  - [Operating system](#operating-system)
    - [`shutdown`](#shutdown)
    - [`reboot`](#reboot)
    - [`halt`](#halt)
    - [`poweroff`](#poweroff)
    - [`systemctl`](#systemctl)
    - [`service`](#service)
    - [`journalctl`](#journalctl)
    - [`dmesg`](#dmesg)
  - [Terminal interaction](#terminal-interaction)
    - [`tmux`](#tmux)
    - [`cd`](#cd)
    - [`pwd`](#pwd)
    - [`alias`](#alias-1)
    - [`unalias`](#unalias)
    - [`history`](#history-1)
    - [`clear`](#clear)
    - [`exit`](#exit)
    - [`which`](#which)
    - [`whereis`](#whereis)
    - [`whatis`](#whatis)
    - [`pushd`](#pushd)
    - [`popd`](#popd)
    - [`dirs`](#dirs)
    - [`printenv`](#printenv)
    - [`set`](#set)
    - [`unset`](#unset)
  - [Process](#process-1)
    - [`ps`](#ps)
    - [`pstree`](#pstree)
    - [`lsof`](#lsof)
    - [`top`](#top)
    - [`kill`](#kill)
    - [`killall`](#killall)
    - [`sh`](#sh)
    - [`xargs`](#xargs-1)
    - [`coproc`](#coproc)
    - [`fg`](#fg)
    - [`bg`](#bg)
    - [`sleep`](#sleep)
    - [`watch`](#watch)
    - [`nohup`](#nohup)
    - [`nice`](#nice)
    - [`renice`](#renice)
    - [`at`](#at)
    - [`batch`](#batch)
    - [`cron`](#cron)
    - [`crontab`](#crontab)
    - [`atq`](#atq)
    - [`atrm`](#atrm)
  - [Info](#info)
    - [`id`](#id)
    - [`whoami`](#whoami)
    - [`whatis`](#whatis-1)
    - [`hostname`](#hostname)
    - [`date`](#date)
    - [`cal`](#cal)
    - [`uptime`](#uptime)
    - [`time`](#time)
    - [`uname`](#uname)
    - [`arch`](#arch)
  - [Permissions](#permissions)
    - [`chmod`](#chmod)
    - [`chown`](#chown)
    - [`chgrp`](#chgrp)
    - [`sudo`](#sudo)
    - [`su`](#su)
    - [`passwd`](#passwd)
    - [`useradd`](#useradd)
    - [`userdel`](#userdel)
    - [`usermod`](#usermod)
    - [`groupadd`](#groupadd)
    - [`groupdel`](#groupdel)
    - [`groupmod`](#groupmod)
  - [Disk operations](#disk-operations)
    - [`dd`](#dd)
    - [`mount`](#mount)
    - [`umount`](#umount)
    - [`blkid`](#blkid)
    - [`fdisk`](#fdisk)
    - [`parted`](#parted)
    - [`mkfs`](#mkfs)
    - [`mkswap`](#mkswap)
    - [`swapon`](#swapon)
    - [`swapoff`](#swapoff)
  - [Drivers](#drivers)
    - [`insmod`](#insmod)
    - [`rmmod`](#rmmod)
    - [`lsmod`](#lsmod)
    - [`modprobe`](#modprobe)
    - [`modinfo`](#modinfo)
    - [`depmod`](#depmod)
  - [Object files](#object-files)
    - [`ar`](#ar)
    - [`nm`](#nm)
    - [`objdump`](#objdump)
    - [`readelf`](#readelf)
    - [`strip`](#strip)
    - [`ldd`](#ldd)
    - [`ldconfig`](#ldconfig)
  - [Debugging](#debugging)
    - [`gdb`](#gdb)
    - [`strace`](#strace)
    - [`ltrace`](#ltrace)
    - [`valgrind`](#valgrind)
    - [`perf`](#perf)
    - [`dtrace`](#dtrace)
    - [`systemtap`](#systemtap)
    - [`bpftrace`](#bpftrace)
  - [Monitoring](#monitoring)
    - [`htop`](#htop)
    - [`iotop`](#iotop)
    - [`iftop`](#iftop)
    - [`nethogs`](#nethogs)
    - [`vnstat`](#vnstat)
    - [`dstat`](#dstat)
    - [`sysstat`](#sysstat)
    - [`sar`](#sar)
    - [`mpstat`](#mpstat)
    - [`pidstat`](#pidstat)
    - [`iostat`](#iostat)
    - [`vmstat`](#vmstat)
    - [`free`](#free-1)
    - [`top`](#top-1)
    - [`ps`](#ps-1)
    - [`uptime`](#uptime-1)
  - [Misc](#misc-1)
    - [`git`](#git-1)
    - [`man`](#man)
  - [`ripgrep`](#ripgrep)
  - [`fd`](#fd)
  - [`bat`](#bat)
  - [`nnn`](#nnn)
  - [`fzf`](#fzf)
    - [Basics](#basics)
    - [Field index expressions](#field-index-expressions)
    - [Preview](#preview)
    - [Command execution](#command-execution)
    - [Aesthetics and layout](#aesthetics-and-layout)
    - [Building an `fzf` command](#building-an-fzf-command)
    - [`fzf` cheatsheet](#fzf-cheatsheet)
  - [`jq`](#jq-1)
  - [`exa`](#exa)
  - [`glances`](#glances)
  - [Plugins](#plugins)
  - [Aesthetics](#aesthetics)
- [tmux](#tmux-1)
  - [Sessions](#sessions)
  - [Windows](#windows)
    - [Tabs](#tabs)
    - [Temporary tools](#temporary-tools)
    - [Global background sessions](#global-background-sessions)
  - [tmuxinator](#tmuxinator)
  - [tmux-thumbs](#tmux-thumbs)
  - [tmux-better-mouse-mode](#tmux-better-mouse-mode)
  - [Cheatsheet](#cheatsheet-1)
- [yabai / skhd](#yabai--skhd)
- [neovim](#neovim)
  - [Concepts](#concepts)
    - [Buffers](#buffers)
    - [Variables](#variables-1)
    - [Commands](#commands-1)
    - [Events](#events)
    - [libuv](#libuv)
      - [Filesystem](#filesystem-1)
      - [Filesystem events](#filesystem-events)
      - [Networking](#networking-1)
      - [Processes](#processes)
      - [Worker](#worker)
      - [Timer](#timer)
      - [Pipes](#pipes)
      - [TTY](#tty)
      - [Polling](#polling)
    - [Job control](#job-control)
      - [msgpack-rpc](#msgpack-rpc)
      - [Channels](#channels)
    - [Treesitter](#treesitter)
    - [LSP](#lsp)
    - [DAP](#dap)
    - [Configuration](#configuration)
  - [Lua](#lua)
  - [Plugins](#plugins-1)
    - [lazy.nvim](#lazynvim)
    - [nvim-tree](#nvim-tree)
      - [Operations](#operations)
      - [Workspaces](#workspaces-1)
    - [Tree-sitter](#tree-sitter)
    - [auto-session](#auto-session)
    - [Mason](#mason)
    - [nvim-cmp](#nvim-cmp)
    - [Telescope](#telescope)
    - [Surround](#surround)
    - [Supermaven](#supermaven)
- [VSCode](#vscode)
- [Xcode](#xcode)
- [Emacs](#emacs-1)
- [Tools, LSPs, Configurations, etc.](#tools-lsps-configurations-etc)
  - [C / C++ / CMake / Conan](#c--c--cmake--conan)
  - [Java / Maven](#java--maven)
  - [Python / pip](#python--pip)
  - [Scala / sbt](#scala--sbt)
  - [JavaScript / node / npm](#javascript--node--npm)
  - [Rust / cargo](#rust--cargo)
  - [golang](#golang)
  - [Haskell / cabal](#haskell--cabal)
  - [Perl](#perl)
  - [Ruby / gem](#ruby--gem)
  - [PHP](#php)
  - [C#](#c-1)
  - [Dart / Flutter](#dart--flutter)
  - [Swift / Xcode](#swift--xcode)
  - [Kotlin / Gradle](#kotlin--gradle)
  - [Agda](#agda-1)
  - [Julia](#julia)
  - [Idris](#idris)
  - [R](#r)
  - [sh / zsh](#sh--zsh)
  - [Lua](#lua-1)
  - [json](#json)
  - [yaml](#yaml)
  - [toml](#toml)
  - [xml](#xml)
  - [ini](#ini)
  - [html](#html)
  - [css](#css)
  - [markdown](#markdown)
  - [latex](#latex)
  - [Solidity](#solidity)
  - [Cadence](#cadence)
  - [Move](#move)
  - [protobuf](#protobuf)
  - [kubectl](#kubectl)
  - [minikube](#minikube)
  - [Terraform](#terraform-1)
  - [Helm](#helm)
  - [AWS](#aws)
  - [GCP](#gcp)
  - [Azure](#azure)
  - [VirtualBox](#virtualbox)
  - [Docker](#docker)
  - [NordVPN](#nordvpn)
  - [Chrome](#chrome)
  - [Discord](#discord)
  - [Slack](#slack)
  - [Spotify](#spotify)
  - [Zoom](#zoom)
  - [Google Drive](#google-drive)
  - [OneDrive](#onedrive)
  - [iCloud](#icloud)
- [Devices](#devices)

# Quickstart

```sh
# Install base libraries from brew
brew install \
  git \
  exa \
  glances \
  btop \
  fzf \
  jq \
  tree \
  ripgrep \
  bat \
  fd \
  pstree \
  bash-completion \
  jesseduffield/lazygit/lazygit \
  orbstack

# Other misc tools
gem install tmuxinator

# Initialize git
EMAIL="ssingal05@gmail.com"
ssh-keygen -t ed25519 -C "$EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub

# ssh public key is now in clipboard.
# Add it to GitHub: https://www.github.com/settings/keys

# Clone all environment files
cd ~
git clone --recurse-submodules git@github.com:siddthesquid/env.git
export ENV_HOME=~/env

# Run bootstrapping code (as needed)

# 1. Install zsh

# 2. Source custom zsh files
. ~/env/bootstrap/00_source_env_in_host_zsh_configs.zsh

# 3. Symlink zsh configs for easy editing here
. ~/env/bootstrap/01_symlink_configs_from_host_to_env.zsh

# 4.
. ~/env/bootstrap/02_symlink_configs_from_env_to_host.zsh

# Install applications. (Some things in here may be manual)
pkg_add tmux
pkg_add neovim
pkg_add glances
pkg_add btop
pkg_add nordvpn
pkg_add google-chrome
pkg_add discord
pkg_add slack
pkg_add spotify
pkg_add zoom
```

# `$HOME`

For reference, this is what we expect the `$HOME` directory to look like:

```sh
.
: # Configuration files in the home directory
├── .zshrc (sources ~/env/configs/zsh/zshrc)
├── .zshenv (sources ~/env/configs/zsh/zshenv)
├── .gitconfig -> ~/env/configs/git/.gitconfig
├── .gitignore -> ~/env/configs/git/.gitignore
├── .tmux.conf -> ~/env/configs/tmux/.tmux.conf
├── .tmuxinator -> ~/env/configs/tmux/.tmuxinator
├── .vimrc -> ~/env/configs/neovim/.vimrc
├── .ripgreprc -> ~/env/configs/ripgrep/.ripgreprc
├── .config
│   └── nvim -> ~/env/configs/neovim/nvim
:
: # Credentials and such
├── .aws
│   ├── config
│   └── credentials
├── .npmrc
├── .pypirc
├── .condarc
├── .m2
│   └── settings.xml
:
: # Our development enviornment (this repo)
├── env
│   ├── bootstrap
│   ├── configs
│   │   ├── git
│   │   ├── neovim
│   │   │   └── nvim
│   │   │       ├── lua
│   │   │       │   ├── adapters
│   │   │       │   ├── core
│   │   │       │   ├── external
│   │   │       │   ├── modules
│   │   │       │   ├── siddthesquid
│   │   │       │   └── themes
│   │   │       └── init.lua
│   │   ├── ripgrep
│   │   ├── tmux
│   │   │   ├── external
│   │   │   ├── modules
│   │   │   └── settings
│   │   └── zsh
│   │       ├── applications
│   │       ├── external
│   │       └── settings
│   ├── libraries
│   ├── local (not checked in git)
│   │   ├── .zshenv -> ~./zshenv
│   │   ├── .zshrc -> ~./zshrc
│   │   ├── .zprofile -> ~./zprofile
│   │   ├── .zlogin -> ~./zlogin
│   │   └── .zlogout -> ~./zlogout
│   ├── packages
│   └── templates
:
: # Notes and cheatsheets
├── knowledge
:
: # Custom installation directory
├── local
│   ├── lib
│   ├── bin
│   ├── include
│   ├── share
│   ├── etc
│   ├── var
│   ├── tmp
│   └── site-functions
:
: # Virtual machines
├── vms
│   ├── <vm-1>
│   ├── <vm-2>
│   :
:
: # Services. Should be start-up and start-down automatically.
├── services
│   ├── <service-1>
│   ├── <service-2>
│   :
:
: # Open source code
├── oss
│   ├── <project-1>
│   ├── <project-2>
│   :
:
: # Packages that are automatically maintained
├── opt
│   ├── <project-1>
│   ├── <project-2>
│   :
:
: # Temporary projects
├── sandbox
│   ├── <project-1>
│   ├── <project-2>
│   :
:
: # Primary work
├── workspace
│   ├── <organization-1>
│   │   ├── <repo-1a>
│   │   ├── <repo-1b>
│   │   :
│   ├── <organization-2>
│   :   ├── <repo-2a>
│       :
:
: # Local documents
├── documents
:
: # Downloads - could be potentially unsafe.
├── downloads
:
: # Cloud
├── drive     # personal
├── public    # public
├── shared    # permissioned
:
```

# Environment Variables

First, we have some global environment variables set and managed by `zsh` itself.

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

In general, any variables that start with `STS_` are specific to this devx setup. (`STS` stands for `siddthesquid`).

There are a few global variables that are exported by this repo. They can be overriden in `~/.zshenv`.

```sh
export STS_ENV_HOME="${STS_ENV_HOME:-$HOME/env}"
export STS_KNOWLEDGE_HOME="${STS_KNOWLEDGE_HOME:-$HOME/knowledge}"
export STS_VMS_HOME="${STS_VMS_HOME:-$HOME/vms}"
export STS_SERVICES_HOME="${STS_SERVICES_HOME:-$HOME/services}"
export STS_OSS_HOME="${STS_OSS_HOME:-$HOME/oss}"
export STS_OPT_HOME="${STS_OPT_HOME:-$HOME/opt}"
export STS_SANDBOX_HOME="${STS_SANDBOX_HOME:-$HOME/sandbox}"
export STS_WORKSPACE_HOME="${STS_WORKSPACE_HOME:-$HOME/workspace}"
export STS_LOCAL_HOME="${STS_LOCAL_HOME:-$HOME/local}"
```

Below is some copypasta for paths within this repo for scripts to use.

```sh
# Base
STS_ENV_BOOTSTRAP="$STS_ENV_HOME/bootstrap"
STS_ENV_CONFIGS="$STS_ENV_HOME/configs"
STS_ENV_LIBRARIES="$STS_ENV_HOME/libraries"
STS_ENV_PACKAGES="$STS_ENV_HOME/packages"
STS_ENV_TEMPLATES="$STS_ENV_HOME/templates"

# Config
STS_ENV_CONFIGS_GIT="$STS_ENV_CONFIGS/git"
STS_ENV_CONFIGS_NEOVIM="$STS_ENV_CONFIGS/neovim"
STS_ENV_CONFIGS_RIPGREP="$STS_ENV_CONFIGS/ripgrep"
STS_ENV_CONFIGS_TMUX="$STS_ENV_CONFIGS/tmux"
STS_ENV_CONFIGS_ZSH="$STS_ENV_CONFIGS/zsh"

# Zsh specific
STS_ENV_ZSH_APPLICATIONS="$STS_ENV_CONFIGS_ZSH/applications"
STS_ENV_ZSH_SETTINGS="$STS_ENV_CONFIGS_ZSH/settings"
STS_ENV_ZSH_EXTERNAL="$STS_ENV_CONFIGS_ZSH/external"

# tmux specific
STS_TMUX_EXTERNAL="$STS_ENV_CONFIGS_TMUX/external"
STS_TMUX_SETTINGS="$STS_ENV_CONFIGS_TMUX/settings"
STS_TMUX_MODULES="$STS_ENV_CONFIGS_TMUX/modules"
```

And then we have some variables that are specific to tmux sessions. We can use them in scripts that assume they are running in a tmux session. The values below are examples.

```sh
# Managed by tmux
TMUX=/private/tmp/tmux-501/default,19725,
TMUX_PANE=%19

# Custom - these should not change
STS_SESSION_WORKSPACE="~/workspace/some-org/some-repo"
STS_SESSION_TYPE="ts-pnpm-monorepo"
```

# Workspaces

Whenever we want to work on a project, we can either open a named or path-based workspace. Each `tmux` session is named based on the root directory. This way, we won't accidentally open multiple sessions in the same directory.

## Named workspace

The below table has all of the named workspaces. They would each get their own `tmux` session and be named accordingly.

| Name       | Path    | Description                   |
| ---------- | ------- | ----------------------------- |
| home       | `~`     | home directory                |
| root       | `/`     | root directory                |
| opt        | `~/opt` | custom installation directory |
| background | `~`     | background projects           |
| env        | `~/env` | this directory                |

`background` is a `tmux` session that will never be attached to directly. We will use it to pop-up over other sessions for quick access to certain persistent windows. The below table lists the background projects. They would each get their own `tmux` window and be named accordingly.

| Name      | Path          | Description                                                             |
| --------- | ------------- | ----------------------------------------------------------------------- |
| knowledge | `~/knowledge` | mostly cheatsheets and guides for different software engineering topics |

## Path-based workspace

Certain directories (as listed in the below table) are marked as valid workspaces, meaning that launching a session in any of these directories will automatically open (or reopen) `tmux` in the root directory of the workspace. These session names will start with either `~/` or `/` depending on the path.

| Name      | Path                                         | Description                       |
| --------- | -------------------------------------------- | --------------------------------- |
| services  | `~/services/<service>`                       | manually managed services         |
| vms       | `~/vms/<vm>`                                 | manually managed virtual machines |
| oss       | `~/oss/<project>/<branch>`                   | open source projects              |
| sandbox   | `~/sandbox/<project>/<branch>`               | temporary projects                |
| workspace | `~/workspace/<organization>/<repo>/<branch>` | primary project workspace         |

## Other workspaces

If we want to open a session in a directory not listed above, we have two options:

- Open a session with `cwd` as the current directory
- Find the rootmost folder (with `~` or `/` prefix) that is a valid workspace and open a session in that directory
- Find the first folder that is a valid package (which could be a subfolder in a larger workspace) or workspace

In general, care is needed to make sure two sessions aren't opening the same files for editing.

## Workspace types

We want to configure some `tmux` and `neovim` settings specific to the type of repo/workspace we are working with. This section details the different types of sessions we care about. We care about

- what identifies a session as a particular type
- `tmux` specific bindings and configurations
- `neovim` LSPs and diagnostics tools
- during which lifecycle events we want to run certain scripts

## Javascript

### `ts-npm-monorepo-standard`

### `ts-yarn-monorepo-standard`

### `ts-pnpm-monorepo-standard`

### `ts-npm-single-standard`

### `ts-yarn-single-standard`

### `ts-pnpm-single-standard`

## Python

### `python-pip-standard`

### `python-poetry-standard`

### `python-conda-standard`

## Rust

### `rust-cargo-standard`

## Go

### `go-standard`

## Java

### `java-maven-standard`

### `java-gradle-standard`

## C++

### `cpp-cmake-monorepo-standard`

### `cpp-cmake-single-standard`

## Scala

### `scala-sbt-standard`

### `scala-maven-standard`

## Kotlin

### `kotlin-gradle-standard`

## Swift

### `swift-xcode-standard`

## Agda

### `agda-standard`

## Terraform

### `terraform-standard`

## Kubernetes

### `kubernetes-standard`

## Misc

### `unknown`

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

We've already installed `git` in quickstart. Let's look at how it's been customized for productivity.

## Cheatsheet

`~/.gitconfig -> ~/env/configs/git/.gitconfig` has a number of aliases and configurations. Below is a quick cheatsheet.

| Alias  | Description                          |
| ------ | ------------------------------------ |
| `stat` | Status, short, branch, untracked     |
| `logg` | Log with graph and pretty formatting |
| `last` | Last commit with stats               |
| `com`  | Commit with message                  |
| `rem`  | List remote repositories             |
| `dif`  | Vimdiff tool                         |
| `conf` | List global configurations           |
| `find` | Find text in all commits             |
| `main` | Checkout main branch                 |
| `chk`  | Checkout branch                      |
| `new`  | Create new branch                    |

## Git based package management

We want a consistent and repeatable workflow when installing stuff from git. Packages will roughly have the following overall lifecycle, where possible:

```mermaid
graph LR
    EMPTY -- "ADD" --> DOWNLOADED
    DOWNLOADED -- "BUILD" --> BUILT
    BUILT -- "INSTALL" --> INSTALLED
    INSTALLED -- "UNINSTALL" --> BUILT
    BUILT -- "REMOVE" --> DOWNLOADED
    DOWNLOADED -- "CLEAN" --> EMPTY
```

- We need a way of checking what state we are in
- Version numbers are required
- Calling a function should invoke all previous functions, if not invoked

| Command                         | Description                                                  |
| ------------------------------- | ------------------------------------------------------------ |
| `gpkg add PACKAGE [VERSION]`    | download, build, and set as default `<package>[-<version>]`  |
| `gpkg remove PACKAGE [VERSION]` | remove files for `<package>[-<version>]`                     |
| `gpkg load <package>`           | download and build `<package>[-<version>]`, but don't use it |
| `gpkg versions <package>`       | list all versions of `<package>`                             |
| `gpkg latest <package>`         | get the latest version of `<package>`                        |

The process roughly looks as follows:

1. Clone the repo
2. Checkout a particular version or branch
3. Build
4. Copy artifacts to `$INSTALL_DIR/<project>-<version>`
5. Symlink `$INSTALL_DIR/<project>` to `$INSTALL_DIR/<project>-<version>`

# ITerm2

## Colors

## Font

# zsh

`zsh`...

- is a shell interpreter. It is a "shell" over the OS kernel, giving a user low-level access to (more-or-less) whatever the computer hardware can do, all via the command line
- is a process that attaches (`stdin`, `stdout`, `stderr`) to a TTY/terminal, which is another process
- parses bytes sequences sent to it from the terminal/terminal emulator, processes them, and then hands the output back to the terminal, potentially with ANSI escape sequences for compliant terminals to interpret
- manages environment variables, which can be inherited by other programs, scripts, or subshells
- provides a complete, though quirky, programming language, which allows aliases, functions, and scripts to be written
- can spawn and manage other processes (or jobs)
- provides useful DevX tooling like `compinit` (completion) and ZLE (`zsh` line editor)
- alternatives include `sh`, `ksh`, `bash`, `csh`, and `fish`. but we will use `zsh` as it is feature rich and has good adoption.

## Shell lifecycle

`zsh` is singlethreaded - it runs one command after another. In between commands, we can query the environment for it's current state. A command can

`zsh` can be run in a number of contexts

- login shell provided by OS (accessible in Linux)
- launching terminal gives you a default shell
- tmux panes
- script launched from within `zsh`
- as a script from some other application

In all cases, the shell processes commands on a single thread. Commands can take the form of

- builtins
- functions
- scripts
- binaries (on `PATH`)

## Configuration files

`zsh` can be configured based on whether it is a login or interactive shell.

**Interactive** - If `zsh` is launched in interactive mode, that means the user is typing the commands into the shell. Otherwise, a file must be provided. We can check if `zsh` is running interactively with

```sh
[[ -o interactive ]]
```

**Login** - `zsh` can also be launched in login mode. All that practically means is that it will source `~/.zprofile` instead of `~/.zshrc`. We can check if `zsh` is running in login mode with

```sh
[[ -o login ]]
```

Based on the above properties, we know which files will be sourced.

| Configuration File | Context         |
| ------------------ | --------------- |
| `/etc/zshenv`      | Always          |
| `~/.zshenv`        | Always          |
| `/etc/zprofile`    | Login           |
| `~/.zprofile`      | Login           |
| `/etc/zshrc`       | Interactive     |
| `~/.zshrc`         | Interactive     |
| `/etc/zlogin`      | Login           |
| `~/.zlogin`        | Login           |
| `/etc/zlogout`     | Login (on exit) |
| `~/.zlogout`       | Login (on exit) |

Generally, we only need to use

- `~/.zshenv` for configuring `PATH`, `*_HOME`, and `fpath`
- `~/.zshrc` for interactive shell usage

## Variables

The shell manages a number of variables during its life. For any process, an environment variable is a key value string pair. However, with `zsh`, we can add supplemental attributes to variables, which limits how the variables can be modified and represented.

### Arrays

| Attribute | Description                                                          |
| --------- | -------------------------------------------------------------------- |
| `-A`      | Refers to associative array parameters.                              |
| `-a`      | Refers to array parameters.                                          |
| `-U`      | For arrays, keep only the first occurrence of each duplicated value. |

### Strings

| Attribute | Description                                                     |
| --------- | --------------------------------------------------------------- |
| `-L [n]`  | Left justify and remove leading blanks. Width specified by `n`. |
| `-R [n]`  | Right justify. Width specified by `n`.                          |
| `-Z [n]`  | Pad with zeros instead of blanks. Width specified by `n`.       |
| `-l`      | Convert to lower case upon expansion.                           |
| `-u`      | Convert to upper case upon expansion.                           |

### Numeric

| Attribute | Description                                                                                       |
| --------- | ------------------------------------------------------------------------------------------------- |
| `-i [n]`  | Use an internal integer representation. Base specified by `n`.                                    |
| `-E [n]`  | Use double-precision float, output in scientific notation. Significant figures specified by `n`.  |
| `-F [n]`  | Use double-precision float, output in fixed-point decimal. Digits after decimal specified by `n`. |

### Scope and Function Handling

| Attribute | Description                                                     |
| --------- | --------------------------------------------------------------- |
| `-f`      | Refers to functions rather than parameters.                     |
| `-h`      | Hide special parameters or local parameters with the same name. |
| `-H`      | Hide value of the parameter when listing parameters.            |
| `-r`      | Mark variables as readonly.                                     |
| `-t`      | Tag parameters (no special shell meaning).                      |
| `-x`      | Mark for automatic export to the environment.                   |

## Basic Grammar

Shells process

- lists: which are a sequence of sublists
- sublists: which are a sequence of pipelines
- pipelines: which are a sequence of commands
- commands: which are a sequence of words

### Simple Command

A simple command in Zsh is a basic unit of execution.

| Component             | Description                                          |
| --------------------- | ---------------------------------------------------- |
| Parameter assignments | Optional parameters set for the command.             |
| Command               | The first word, specifying the command to execute.   |
| Arguments             | Subsequent words passed as arguments to the command. |
| Redirections          | Optional, used to redirect input/output.             |

```shell
FOO=bar echo $FOO
```

### Redirection

### Pipeline

A pipeline connects the output of one command to the input of another.

| Separator | Description                                                                                  |
| --------- | -------------------------------------------------------------------------------------------- |
| `\|`      | The standard output of the first command is connected to the input of the next.              |
| `\|&`     | Shorthand for `2>&1 \|`, connecting both stdout and stderr to the input of the next command. |

### Sublist

A sublist is a sequence of pipelines with conditional execution.

| Separator | Description                                                              |
| --------- | ------------------------------------------------------------------------ |
| `&&`      | The right pipeline executes only if the left one succeeds (zero status). |
| `\|\|`    | The right pipeline executes only if the left one fails (nonzero status). |

### List

A list is a sequence of sublists with various terminators.

| Terminator  | Description                                                      |
| ----------- | ---------------------------------------------------------------- |
| `;`         | The shell waits for the sublist to finish before the next.       |
| newline     | Same as `;`, used to separate and sequentially execute sublists. |
| `&`         | Executes the last pipeline of the sublist in the background.     |
| `&\|`, `&!` | Special background execution cases (similar to `&`).             |

### Examples

```shell
# Simple Command Example
echo foo # Echoes the word 'foo'.

# Pipeline Example
echo foo | sed 's/foo/bar/' # Replaces 'foo' with 'bar' in the output of echo.

# Sublist Example
dmesg | grep panic && print yes # Prints 'yes' if 'panic' is found in `dmesg` output.

# List Example
command1; command2 & command3 # `command1` then `command2` (foreground), and `command3` (background).
```

## Conditionals

### File Existence

| Conditional          | Description                                       |
| -------------------- | ------------------------------------------------- |
| `-a file`, `-e file` | True if file exists.                              |
| `-f file`            | True if file is a regular file.                   |
| `-d file`            | True if file is a directory.                      |
| `-h file`, `-L file` | True if file is a symbolic link.                  |
| `-p file`            | True if file is a FIFO special file (named pipe). |
| `-S file`            | True if file is a socket.                         |
| `-b file`            | True if file is a block special file.             |
| `-c file`            | True if file is a character special file.         |

### File Attribute

| Conditional | Description                                                          |
| ----------- | -------------------------------------------------------------------- |
| `-r file`   | True if file is readable by the current process.                     |
| `-w file`   | True if file is writable by the current process.                     |
| `-x file`   | True if file is executable or directory is searchable.               |
| `-s file`   | True if file exists and has size greater than zero.                  |
| `-u file`   | True if file has its setuid bit set.                                 |
| `-g file`   | True if file has its setgid bit set.                                 |
| `-k file`   | True if file has its sticky bit set.                                 |
| `-O file`   | True if file is owned by the effective user ID of this process.      |
| `-G file`   | True if file's group matches the effective group ID of this process. |
| `-N file`   | True if file's access time is not newer than its modification time.  |

### File Comparison

| Conditional       | Description                                     |
| ----------------- | ----------------------------------------------- |
| `file1 -nt file2` | True if file1 is newer than file2.              |
| `file1 -ot file2` | True if file1 is older than file2.              |
| `file1 -ef file2` | True if file1 and file2 refer to the same file. |

### String

| Conditional                             | Description                                                 |
| --------------------------------------- | ----------------------------------------------------------- |
| `-n string`                             | True if length of string is non-zero.                       |
| `-z string`                             | True if length of string is zero.                           |
| `string = pattern`, `string == pattern` | True if string matches pattern.                             |
| `string != pattern`                     | True if string does not match pattern.                      |
| `string =~ regexp`                      | True if string matches the regular expression regexp.       |
| `string1 < string2`                     | True if string1 comes before string2 based on ASCII values. |
| `string1 > string2`                     | True if string1 comes after string2 based on ASCII values.  |

### Arithmetic

| Conditional     | Description                                                |
| --------------- | ---------------------------------------------------------- |
| `exp1 -eq exp2` | True if exp1 is numerically equal to exp2.                 |
| `exp1 -ne exp2` | True if exp1 is numerically not equal to exp2.             |
| `exp1 -lt exp2` | True if exp1 is numerically less than exp2.                |
| `exp1 -gt exp2` | True if exp1 is numerically greater than exp2.             |
| `exp1 -le exp2` | True if exp1 is numerically less than or equal to exp2.    |
| `exp1 -ge exp2` | True if exp1 is numerically greater than or equal to exp2. |

### Options

| Conditional  | Description                            |
| ------------ | -------------------------------------- |
| `-o option`  | True if shell option is on.            |
| `-v varname` | True if shell variable varname is set. |

### Logical

| Conditional      | Description                          |
| ---------------- | ------------------------------------ |
| `( exp )`        | True if exp is true.                 |
| `! exp`          | True if exp is false.                |
| `exp1 && exp2`   | True if both exp1 and exp2 are true. |
| `exp1 \|\| exp2` | True if either exp1 or exp2 is true. |

## Control Structures

## Expansion

Let's suppose a string of text has been submitted to `zsh` for processing. A series of expansions will happen before it's tokenized into words and processed. These expansions happen in the following order:

1. History
2. Alias
3. Process, parameter, command, arithmetic, and brace (left to right)
4. Filename expansion
5. FIlename generation

### History

### Alias

### Process

### Parameter

### Command

### Arithmetic

### Brace

### Filename expansion

### Filename generation

### Modifiers

#### Path manipulation

| Modifier     | Command Description                                                                                   |
| ------------ | ----------------------------------------------------------------------------------------------------- |
| `a`          | Turn a filename into an absolute path, logically (without resolving symlinks).                        |
| `A`          | Turn a filename into an absolute path and resolve symlinks (uses realpath).                           |
| `c`          | Resolve a command name into an absolute path by searching the PATH variable.                          |
| `e`          | Remove all but the filename extension.                                                                |
| `h [digits]` | Remove a trailing pathname component, optionally keeping a specified number of leading components.    |
| `P`          | Turn a file name into an absolute path, similar to realpath(3) but allows non-existent components.    |
| `r`          | Remove a filename extension, leaving the root name.                                                   |
| `t [digits]` | Remove all leading pathname components, optionally keeping a specified number of trailing components. |

#### Text formatting

| Modifier             | Command Description                                            |
| -------------------- | -------------------------------------------------------------- |
| `s/l/r[/]`           | Substitute `r` for the first occurrence of `l`.                |
| `gs/l/r`, `s/l/r/:G` | Global substitution: replace every occurrence of `l` with `r`. |
| `&`                  | Repeat the previous `s` substitution.                          |
| `l`                  | Convert the words to all lowercase.                            |
| `u`                  | Convert the words to all uppercase.                            |

#### Miscellaneous

| Modifier | Command Description                                                      |
| -------- | ------------------------------------------------------------------------ |
| `p`      | Print the new command but do not execute it (history expansion).         |
| `q`      | Quote the substituted words, escaping further substitutions.             |
| `Q`      | Remove one level of quotes from the substituted words.                   |
| `x`      | Break into words at whitespace (does not work with parameter expansion). |

## ZLE

## Jobs

## Completion system

## Options

## Editors

### `less`

### `xxd`

### `vim`, `vi`

### `nano`

### `emacs`

## Stream manipulation

### `cat` - con`cat`enate

The easiest way to view a file.

```sh
# cat [FILE]...
cat /etc/hosts /etc/hostname
```

### `awk`

### `sed`

### `expand`

### `sort`

### `uniq`

### `jq`

### `grep`

### `cut`

### `tr`

### `wc`

### `head`

### `tail`

### `echo`

### `grep`

### `tee`

### `xargs`

## Cryptography

### `ssh-keygen`

### `ssh-copy-id`

### `ssh-agent`

### `ssh-add`

### `ssh`

### `scp`

### `rsync`

### `gpg`

### `sftp`

### `openssl`

## Networking

### `curl`

### `wget`

### `netstat`

### `ifconfig`

### `ip`

### `route`

### `ping`

### `traceroute`

### `mtr`

### `dig`

### `nslookup`

### `tcpdump`

### `nmap`

### `whois`

### `ufw`

### `iptables`

## Compression

### `tar`

### `gzip`

### `bzip2`

### `xz`

### `zip`

### `unzip`

## Filesystem

### `cp`

### `ln`

### `mv`

### `rm`

### `mkdir`

### `rmdir`

### `find`

### `ls`

### `lsblk`

### `tree`

### `df`

### `du`

### `free`

### `file`

### `diff`

### `cmp`

### `comm`

### `patch`

### `touch`

### `mkfifo`

## Operating system

### `shutdown`

### `reboot`

### `halt`

### `poweroff`

### `systemctl`

### `service`

### `journalctl`

### `dmesg`

## Terminal interaction

### `tmux`

### `cd`

### `pwd`

### `alias`

### `unalias`

### `history`

### `clear`

### `exit`

### `which`

### `whereis`

### `whatis`

### `pushd`

### `popd`

### `dirs`

### `printenv`

### `set`

### `unset`

## Process

### `ps`

### `pstree`

### `lsof`

### `top`

### `kill`

### `killall`

### `sh`

### `xargs`

### `coproc`

### `fg`

### `bg`

### `sleep`

### `watch`

### `nohup`

### `nice`

### `renice`

### `at`

### `batch`

### `cron`

### `crontab`

### `atq`

### `atrm`

## Info

### `id`

### `whoami`

### `whatis`

### `hostname`

### `date`

### `cal`

### `uptime`

### `time`

### `uname`

### `arch`

## Permissions

### `chmod`

### `chown`

### `chgrp`

### `sudo`

### `su`

### `passwd`

### `useradd`

### `userdel`

### `usermod`

### `groupadd`

### `groupdel`

### `groupmod`

## Disk operations

### `dd`

### `mount`

### `umount`

### `blkid`

### `fdisk`

### `parted`

### `mkfs`

### `mkswap`

### `swapon`

### `swapoff`

## Drivers

### `insmod`

### `rmmod`

### `lsmod`

### `modprobe`

### `modinfo`

### `depmod`

## Object files

### `ar`

### `nm`

### `objdump`

### `readelf`

### `strip`

### `ldd`

### `ldconfig`

## Debugging

### `gdb`

### `strace`

### `ltrace`

### `valgrind`

### `perf`

### `dtrace`

### `systemtap`

### `bpftrace`

## Monitoring

### `htop`

### `iotop`

### `iftop`

### `nethogs`

### `vnstat`

### `dstat`

### `sysstat`

### `sar`

### `mpstat`

### `pidstat`

### `iostat`

### `vmstat`

### `free`

### `top`

### `ps`

### `uptime`

## Misc

### `git`

### `man`

## `ripgrep`

`ripgrep` replaces `grep`. It's faster to use, and respects `.gitignore` files by default. The configuration file is `~/.ripgreprc -> ~/env/configs/ripgrep/.ripgreprc` (as set by `RIPGREP_CONFIG_PATH`) and contains some basic settings.

| Command                                      | Description                                                                   |
| -------------------------------------------- | ----------------------------------------------------------------------------- |
| `rg <pattern>`                               | Search for a pattern in the current directory                                 |
| `rg <pattern> <path>`                        | Search in a specific file or directory                                        |
| `rg -i <pattern>`                            | Search with case-insensitive match                                            |
| `rg -w <pattern>`                            | Search for exact word matches                                                 |
| `rg '<regex_pattern>'`                       | Search using regular expressions                                              |
| `rg -l <pattern>`                            | List files that contain the pattern                                           |
| `rg -L <pattern>`                            | List files that do NOT contain the pattern                                    |
| `rg --type <file_type> <pattern>`            | Search only in certain file types                                             |
| `rg --type-list`                             | List all supported file types                                                 |
| `rg -C N <pattern>`                          | Show N lines before and after the match                                       |
| `rg -B N <pattern>`                          | Show N lines before the match                                                 |
| `rg -A N <pattern>`                          | Show N lines after the match                                                  |
| `rg -o <pattern>`                            | Only show the matched part of the line                                        |
| `rg -e <pattern1> -e <pattern2>`             | Search for multiple patterns                                                  |
| `rg -n <pattern>`                            | Show line numbers with search results                                         |
| `rg --glob '!<file_or_directory>' <pattern>` | Exclude files/directories from search                                         |
| `rg --hidden`                                | Search hidden files and directories                                           |
| `rg -v <pattern>`                            | Invert matches (select non-matching lines)                                    |
| `rg -m N <pattern>`                          | Limit the search to the first N matches                                       |
| `rg --sort <sort_by>`                        | Sort results. `<sort_by>` can be 'path', 'modified', 'accessed', or 'created' |
| `rg --sortr <sort_by>`                       | Sort results in reverse order                                                 |

## `fd`

## `bat`

## `nnn`

## `fzf`

`fzf` provides a fuzzy finder interface for a given list of strings. It's features include

- fuzzy search through any list of strings
- multi-select
- preview window with custom commands and syntax highlighting
- keybindings and events for custom behavior
- customizable UI

For our development environment, we will try to keep the convention of having `fzf` based commands launched with `tmux` popups and have a specific purpose, with carefully picked keybindings and helpful previews. This way, we can keep the UI standardized.

### Basics

At its core, `fzf` is inputs a list of strings and outputs a list of selected strings based on a sequence of regex filters. `fzf` allows a few filtering strategies:

| Stategy         | Flag | Default |
| --------------- | ---- | ------- |
| fuzzy           |      | yes     |
| exact           | `-e` | no      |
| extended regex  | `-x` | yes     |
| smart case      |      | yes     |
| case sensitive  | `+i` | no      |
| case insensitve | `-i` | no      |

### Field index expressions

We can choose how to format and search the input list by specifying a regex delimiter and using field index expressions to select the fields at certain indices. The below are the relevant flags:

| Flag                | Description                                         |
| ------------------- | --------------------------------------------------- |
| `--delimiter`, `-d` | Specify a regex delimiter. The default is AWK-style |
| `--with-nth`        | Only these fields will be displayed                 |
| `--nth`, `-n`       | Only these fields will be searched                  |

### Preview

### Command execution

### Aesthetics and layout

We can customize the borders, colors, and layout of the `fzf` window. We will generally try to keep these consistent as much as possible. The biggest questions we want to answer are:

- do we want this to be a tmux popup or inline in the terminal?
  - popup: can be called from anywhere, but output must target an existing pane
  - cli: output is persistent and can be called asynchronously, but must be called from a specific pane
- should the preview, if any, be on the right or bottom?
  - right side: more space for multiline preview
  - bottom: show more details for active selection

### Building an `fzf` command

When designing an `fzf` function, we need to figure out

1. the goal of our function
2. the desired layout
3. default source of inputs and initial filters
4. which fields of the input to actually display
5. which fields of the input to limit the search to
6. whether multi-select is applicable
7. the text filter algorithm
8. what the preview window should look like
9. how selected text should be transformed on completion
10. what to do with the selected text on completion
11. how keybindings affect the input list
12. which keybindings perform what operations on selected text
13. how keybindings affect the preview window (if applicable)

### `fzf` cheatsheet

In our [libraries folder](./libraries), we've predefined a few `fzf` commands. The below is a quick reference, along with possible `tmux` bindings to launch them.

| Command | Binding | Description |
| ------- | ------- | ----------- |

## `jq`

## `exa`

## `glances`

## Plugins

- zsh-autosuggestions
- zsh-syntax-highlighting
- zsh-completions

## Aesthetics

# tmux

## Sessions

There are four types of sessions we care about:

- default
- project/workspace
- IDE integrated
- remote access

When loading the terminal, we automatically attach to the `default` session, or create it if it does not exist.

Certain folders will be marked as valid project/workspace directories. We can also choose any arbitrary directory to be a project/workspace directory through some provided command.

When we ssh into a remote machine, we automatically attach to the remote session, or create it if it does not exist.

## Windows

### Tabs

- Development
- Main Terminal shell
- Custom shells
- Files
- Services
- Tasks
- Git
- Package Management
- Scratchpad

### Temporary tools

- Utility functions
- Monitor
- Process

### Global background sessions

- Knowledge
- Env

## tmuxinator

## tmux-thumbs

## tmux-better-mouse-mode

## Cheatsheet

# yabai / skhd

# neovim

`nvim` is our text editor of choice. It runs on the terminal and is configurable.

In our `nvim` setup, we attach a single `nvim` instance to facilitate all textual editing for any given "project". The below step-by-step gives a rough idea of how this works:

1. Open `nvim` on either a single file or directory
2. Determine the root directory of the project
3. Determine the type of workspace based on files and their contents
4. Load all configurations associated with the workspace type

So for example, `nvim` might find a `package.json` in the root directory and understand that it's a PNPM monorepo root. It will then load all configurations associated with PNPM monorepo workspaces. Configurations include things like keybindings, LSPs, linters, formatters, etc.

Each `tmux` session ideally represents a single project or workspace, and every project is associated with a root directory. This means that whenever we open a `tmux` session, we can automatically open `nvim` in the root directory of the project.

## Concepts

- buffer
- window
- tab
- event
- command
- job
- channel

### Buffers

### Variables

### Commands

### Events

### libuv

#### Filesystem

#### Filesystem events

#### Networking

#### Processes

#### Worker

#### Timer

#### Pipes

#### TTY

#### Polling

### Job control

#### msgpack-rpc

#### Channels

### Treesitter

### LSP

### DAP

### Configuration

| Order | Directory         | Trigger/Event                  | Description                             |
| ----- | ----------------- | ------------------------------ | --------------------------------------- |
| 1     | `plugin/`         | Startup                        | Initial global setup                    |
| 2     | `ftdetect/`       | Startup (after plugin)         | Filetype detection rules                |
| 3     | `after/plugin/`   | Startup (after all plugins)    | Override plugin setups                  |
| 4     | `colors/`         | On `:colorscheme`              | Colorscheme definitions                 |
| 5     | `syntax/`         | Buffer open (filetype matched) | Syntax highlighting rules               |
| 6     | `after/syntax/`   | Buffer open (after syntax)     | Override syntax highlighting            |
| 7     | `indent/`         | Buffer open (filetype matched) | Indentation rules                       |
| 8     | `after/indent/`   | Buffer open (after indent)     | Override indentation rules              |
| 9     | `ftplugin/`       | Buffer open (filetype matched) | Filetype-specific settings and mappings |
| 10    | `after/ftplugin/` | Buffer open (after ftplugin)   | Override filetype-specific setups       |
| 11    | `compiler/`       | On `:compiler` invocation      | Compiler settings and error formats     |
| 12    | `lua/`            | On-demand (`require()`)        | Lua modules and libraries               |

## Lua

## Plugins

### lazy.nvim

`lazy` is our preferred plugin manager for neovim. By convention, the `plugins` module should contain a set of Lua files, each returning a LazySpec table.

### nvim-tree

#### Operations

#### Workspaces

### Tree-sitter

"[Tree-sitter](https://tree-sitter.github.io/tree-sitter) is a parser generator tool and an incremental parsing library." Basically, language developers create grammars in javascript which gets compiled to optimized C code. Code editors using tree-sitter can then use these grammars to

- parse code
- provide syntax highlighting
- code completion

It is built into neovim, but the [nvim-treesitter plugin](https://github.com/nvim-treesitter/nvim-treesitter) helps us with installing parsers.

### auto-session

### Mason

### nvim-cmp

### Telescope

### Surround

### Supermaven

# VSCode

# Xcode

# Emacs

# Tools, LSPs, Configurations, etc.

## C / C++ / CMake / Conan

## Java / Maven

## Python / pip

## Scala / sbt

## JavaScript / node / npm

## Rust / cargo

## golang

## Haskell / cabal

## Perl

## Ruby / gem

## PHP

## C#

## Dart / Flutter

## Swift / Xcode

## Kotlin / Gradle

## Agda

## Julia

## Idris

## R

## sh / zsh

## Lua

## json

## yaml

## toml

## xml

## ini

## html

## css

## markdown

## latex

## Solidity

## Cadence

## Move

## protobuf

## kubectl

## minikube

## Terraform

## Helm

## AWS

## GCP

## Azure

## VirtualBox

## Docker

## NordVPN

## Chrome

## Discord

## Slack

## Spotify

## Zoom

## Google Drive

## OneDrive

## iCloud

# Devices

- Mouse
  - Trackpad
  - Multiple mice
- Keyboard

  - Built-in
  - Multiple keyboards

- Monitors
  - Laptop
  - External
  - iPad
- Video In

  - Built-in Camera
  - Camera
  - Virtual Camera Filter
  - Screen

- Audio Out
  - Wireless Headphones
  - Wired Headphones
  - Built-in Speakers
  - External Speakers
  - Airpods
- Audio In

  - Built-in Microphone
  - External Microphone
  - Virtual Microphone
  - Audio Interface
  - Airpods

- WiFi
- Network
- Bluetooth

- iPhone
- iPad
- Vision
- AirPods
