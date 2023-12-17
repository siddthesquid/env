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
- [Brew](#brew)
  - [Commands](#commands)
- [Git](#git)
  - [Cheatsheet](#cheatsheet)
  - [Git based package management](#git-based-package-management)
- [ITerm2](#iterm2)
- [zsh](#zsh)
  - [`zsh` sessions](#zsh-sessions)
  - [Configuration files](#configuration-files)
  - [Aliases](#aliases)
  - [Basics](#basics)
  - [Stream manipulation](#stream-manipulation)
  - [Filesystem](#filesystem)
  - [Networking](#networking)
  - [Cryptography](#cryptography)
  - [Remote access](#remote-access)
  - [Permissions](#permissions)
  - [Disk](#disk)
  - [Process](#process)
  - [OS](#os)
  - [Terminal](#terminal)
  - [Compression](#compression)
  - [`ripgrep`](#ripgrep)
  - [`fd`](#fd)
  - [`bat`](#bat)
  - [`fzf`](#fzf)
    - [Basics](#basics-1)
    - [Field index expressions](#field-index-expressions)
    - [Preview](#preview)
    - [Command execution](#command-execution)
    - [Aesthetics and layout](#aesthetics-and-layout)
    - [Building an `fzf` command](#building-an-fzf-command)
    - [`fzf` cheatsheet](#fzf-cheatsheet)
  - [`jq`](#jq)
  - [`exa`](#exa)
  - [`glances`](#glances)
  - [Plugins](#plugins)
  - [Aesthetics](#aesthetics)
- [tmux](#tmux)
  - [Sessions](#sessions)
  - [Windows](#windows)
    - [Tabs](#tabs)
    - [Temporary tools](#temporary-tools)
    - [Global background sessions](#global-background-sessions)
  - [tmuxinator](#tmuxinator)
  - [tmux-thumbs](#tmux-thumbs)
  - [tmux-better-mouse-mode](#tmux-better-mouse-mode)
  - [Cheatsheet](#cheatsheet-1)
- [neovim](#neovim)
  - [Configuration](#configuration)
  - [LSP](#lsp)
  - [Treesitter](#treesitter)
  - [Surround](#surround)
  - [Nerd-tree](#nerd-tree)
  - [Telescope](#telescope)
- [VSCode](#vscode)
- [Xcode](#xcode)
- [Emacs](#emacs)
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
  - [Agda](#agda)
  - [Julia](#julia)
  - [Idris](#idris)
  - [R](#r)
  - [sh / zsh](#sh--zsh)
  - [Lua](#lua)
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
  - [Terraform](#terraform)
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
  jesseduffield/lazygit/lazygit

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
. ~/env/bootstrap/source_env_in_host_configs.zsh
. ~/env/bootstrap/symlink_configs_from_host_to_env.zsh
. ~/env/bootstrap/symlink_configs_from_env_to_host.zsh
. ~/env/bootstrap/update_xdg_dirs.zsh

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
│   │       ├── applicatiosn
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
: # Virtual machines
├── vms
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
: # Custom installation directory
├── opt
│   ├── lib
│   ├── bin
│   ├── include
│   ├── share
│   ├── etc
│   ├── var
│   ├── tmp
│   └── site-functions
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
: # cloud
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
```

Below is some copypasta for paths within this repo for scripts to use.

```sh
# Base
STS_ENV_BOOTSTRAP="$STS_ENV_HOME/bootstrap"
STS_ENV_CONFIGS="$STS_ENV_HOME/configs"
STS_ENV_LIBRARIES="$STS_ENV_HOME/libraries"
STS_ENV_PACKAGES="$STS_ENV_HOME/packages"

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

`background` is a `tmux` session that will never be attached to directly. We will use it to pop-up over other sessions for quick access to certain persistent windows. The below table lists the background projects. They would each get their own `tmux` window and be named accordingly.

| Name      | Path          | Description                                                             |
| --------- | ------------- | ----------------------------------------------------------------------- |
| env       | `~/env`       | this directory                                                          |
| knowledge | `~/knowledge` | mostly cheatsheets and guides for different software engineering topics |

## Path-based workspace

Certain directories (as listed in the below table) are marked as valid workspaces, meaning that launching a session in any of these directories will automatically open (or reopen) `tmux` in the root directory of the workspace. These session names will start with either `~/` or `/` depending on the path.

| Name      | Path                                | Description                       |
| --------- | ----------------------------------- | --------------------------------- |
| services  | `~/services/<service>`              | manually managed services         |
| vms       | `~/vms/<vm>`                        | manually managed virtual machines |
| oss       | `~/oss/<project>`                   | open source projects              |
| sandbox   | `~/sandbox/<project>`               | temporary projects                |
| workspace | `~/workspace/<organization>/<repo>` | primary project workspace         |

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
    CLEAN -- "ADD" --> DOWNLOADED
    DOWNLOADED -- "BUILD" --> BUILT
    BUILT -- "INSTALL" --> INSTALLED
    INSTALLED -- "LOAD COMPLETION" --> COMPLETABLE
    INSTALLED -- "USE" --> INSTALLED
    COMPLETABLE -- "REMOVE COMPLETION" --> INSTALLED
    INSTALLED -- "UNINSTALL" --> BUILT
    BUILT -- "REMOVE" --> CLEAN
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

# zsh

`zsh` is a shell interpreter, meaning it parses bytes sequences sent to it from the terminal/terminal emulator and executes them as commands. Our options for a shell interpreter generally include `sh`, `ksh`, `bash`, `zsh`, and `fish`.

`zsh` is feature rich and, because it is the default shell on macOS, convenient to use.

## `zsh` sessions

Each instance of the shell has associated variables. Some key ones include `PATH`, `PWD`, and `OLDPWD`.

If `zsh` is launched in interactive mode, that means the user is typing the commands into the shell. Otherwise, a file must be provided. We can check if `zsh` is running interactively with

```sh
[[ -o interactive ]]
```

`zsh` can also be launched in login mode. All that practically means is that it will source `~/.zprofile` instead of `~/.zshrc`. We can check if `zsh` is running in login mode with

```sh
[[ -o login ]]
```

## Configuration files

When `zsh` is launched, it will source the following files in the following order:

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

- `~/.zshenv` for configuring `PATH`, `*_HOME`, and `fpath` variables
- `~/.zshrc` for interactive shell usage

## Aliases

## Basics

## Stream manipulation

## Filesystem

## Networking

## Cryptography

## Remote access

## Permissions

## Disk

## Process

## OS

## Terminal

## Compression

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
- Shell
- Files
- Testing
- Tasks
- Git
- Package Management
- Scratchpad
- Custom shells

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

# neovim

`nvim` is our text editor of choice. It runs on the terminal and is configurable.

In our `nvim` setup, we attach a single `nvim` instance to facilitate all textual editing for any given "project". The below step-by-step gives a rough idea of how this works:

1. Open `nvim` on either a single file or directory
2. Determine the root directory of the project
3. Determine the type of workspace based on files and their contents
4. Load all configurations associated with the workspace type

So for example, `nvim` might find a `package.json` in the root directory and understand that it's a PNPM monorepo root. It will then load all configurations associated with PNPM monorepo workspaces. Configurations include things like keybindings, LSPs, linters, formatters, etc.

Each `tmux` session ideally represents a single project or workspace, and every project is associated with a root directory. This means that whenever we open a `tmux` session, we can automatically open `nvim` in the root directory of the project.

## Configuration

## LSP

## Treesitter

## Surround

## Nerd-tree

## Telescope

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
