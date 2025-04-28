# The Ideal Developer Experience

This is an incredibly opinionated set of recommended developer workflows. The hypothesis is this: following the below guidelines will let us solve 100% of use cases with optimal performance.

Some key points:

- TypeScript for web UIs
- Rust for web servers, CLIs, WASM, and other binaries
- Python for data engineering/science and SRE/ops
- Networking: istio, kiali
- Auth: cert-manager, oauth2-proxy, keycloak, vault
- Metrics: efk, prometheus, grafana
- DBs: Pulsar, Redis, etcd, Mongo, vitess, ScyllaDB, solr, elasticsearch, Postgres
- Data: Spark, MlFlow, JupyterHub
- Ops: Airflow, Argo
- Everything packaged as microservice, deployed on kubernetes
- Clouds: AWS, Azure, GCP - all we need is solid networking, compute, and 
- Or CDN/S3 for static websites
- Swift for native Apple apps
- Kotlin for native Android apps
- Cpp + Ansible for embedded systems, native desktop apps, and HPC apps

# Uniqueness

- developer machine
    - (user)
        - home directory
        - projects directory
            - (client)
                - (repo)
                    - main
                    - (branch)
                        - code
                        - session
                            - ide
                            - stat
                            - ops
                            - test
                            - run
                            - sh
                        - ai
        - config
            - zsh
            - tmux
            - nvim
        - credential
            - github
            - aws
            - pypi
            - dockerhub
            - openai
            - claude
            - gemini
        - notes
            - (namespace)
        - planner
            - (namespace)
        - documents
            - (document)
        - downloads
            - (source)
                - (download)
    - keyboard
    - trackpad


# Concepts

```
app
svc
inf
```

```
open project
- resume session
- determine project root
- determine workspaces
- determine 

open file
- check if file is part of existing workspace

close file

modify file

create file

move file

delete file

resync file

resync workspace

resync project

```

```typescript
// typedefs
type Path = string

type File = {
    path:  Path
    buffer: Buffer
}

// Our end goal is an implementation of the below
type Dev = {
    boostrap
    use_home_session
    use_nvim_session
    use_tmux_session
    use_dev_session
    ensure_session_running
}

// To reach our goal, we need to supply the following
type Configuration = {
    start_session: string
}

// At any point in time, the "state" of our system can be represented as below
type State = {
}

type Session = {
}

// A `Project` is 
type Project = {
    path: string
}

type WorkspaceType = {}

type Workspace = {
    type: WorkspaceType
    path: Path
    project: Project
}



type Publisher = {}

type Distribution = {
    publisher: Publisher
    path: Path
    files: File[]
}

type Operation = () => Promise<void>

type ProjectOperationManager = {
    core: {
        install: Operation
        clean: Operation
        wipe: Operation
    }
    code: {
        docgen: Operation
        format: Operation
        generate: Operation
    }
    svc: {
        up: Operation
        down: Operation
        clear: Operation
        seed: Operation
    }
    dev: {
        live: Operation
        mock: Operation
        stop: Operation
    }
    test: {
        updated: Operation
        all: Operation
    },
    bench: {
        updated: Operation
        all: Operation
    },
    lint: {
        updated: Operation
        all: Operation
    }
    build: {
        updated: Operation
        release: Operation
        debug: Operation
    }
    run: {
        release: Operation
        debug: Operation
    }
    deploy: {
        version: Operation
        publish: Operation
    }
}

type WorkspaceOperationManager = {}

type FileOperationManager = {}

type SnippetOperationManager = {}

type OperationManager = {
    project: ProjectOperationManager
    workspace: WorkspaceOperationManager
    file: FileOperationManager
    snippet: SnippetOperationManager
}

type Module = {
    parsers: Parser[]
    lsps: Lsp[]
    formatters: Formatter[]
    linters: Linter[]
    testers: Tester[]
    analyzers: Analyzer[]
    debuggers: Debugger[]
    snippets: Snippet[]
}

type Tmux = {}

type Nvim = {}

type Developer = {
    get_workspaces: (project: Project) => Workspace[]
    get_sources: (workspace: Workspace) => Source[]
    get_modules: (workspace: Workspace) => Module[]
}

```

In this document, the word "project" refers to something very specific. It is a unit of ... More concretely, a project

- maps to a single git repository
- could represent a single app, or multiple (monorepo)

# Project types

## `pnpm` monorepo

## `pnpm` package

## `uv` monorepo

## `uv` package

## `maven` project

## `gradle` project

## `sbt` project

## `make` project

## `cmake` project

# Use cases

## TypeScript library

## TypeScript static website

## TypeScript SSR website

## TypeScript Chrome Browser extension

## Rust library

## Rust server

## Rust job

## Rust CLI app

## Rust WASM module

## Python library

## Python Spark app

## Python job

## Python notebooks

## Cpp library

## Cpp binary

## Swift library

## Swift iOS App

## Kotlin library

## Kotlin Android App

# Project Directory Layouts

## Random thoughts

```
- lib: published library
- util: project repo internal library, not published
- app: deployed unit

lib -> util
        -> app
        -> schema
        ->  

app

util

lib

```

## `app`

```
app-cli/
    <application>/
        src/

        .env.ci
        .env.live

        package.json
        cargo.toml

app-static/
    ...

app-ssr/
    ...

app-server/
    ...

app-task/
    ...

app-data/
    ...

app-flow/
    ...

int-ts/
int-rs/
int-py/

lib-ts/
lib-rs/
lib-py/

migration/
    state/
    plan/

schema/
    x-syclla/
    x-pulsar/
    x-vitess/
    x-etcd/
    x-solr/
    x-keycloak/
    x-redis/
    x-spark/
    x-jupyter/

dev/
    services/
        docker-compose.yaml
        dns/
        seed/
    mock/

test/
    environments/
    suites/

scripts/
    doctor.sh
    x.sh
    y.sh

.env.ci
.env.ci.local
.env.ci.<env>

.env.live
.env.live.local
.env.live.<env>

package.json
nx.json
.nvmrc

pyproject.toml
cargo.toml
```

## `svc`

## `inf`

# Modules

# `$HOME` directory

# Manual package management

# Environment variables

# Networking

- domains
- dnsmasq
- ngrok

# Writing `zsh` functions

# Writing `fzf` functions

# OS Layouts

## Apps

- terminal

- firefox:research:(project):(task)
- firefox:entertainment
- firefox:dev:testing
- chrome:dev:testing
- safari:dev:testing
- edge:dev:testing
- brave:dev:testing

- spotify
- nordvpn

- slack
- discord

## Layouts


- fullscreen <screen>
    - term
- layover
    - term + browser
    - term + slack
    - term + discord
- side by side <screen>s
    - term + notebook
    - term + planner
    - term + docs (cheatsheet)
    - term + docs (cheatsheet)
    - term + browser

# Tmux layouts

## `private`

| Index | Name | Command |
|-------|------|---------|
| 1 | `notebook` | `nvim ~/notes` |
| 2 | `planner` | `nvim ~/notes` |

## `home`

| Index | Name | Command |
|-------|------|---------|
| 1 | `shell` | `zsh` |

## `env`

| Index | Name | Command |
|-------|------|---------|
| 2 | `docs` | `nvim ~/notes` |
| 2 | `nvim` | `nvim ~/notes` |
| 2 | `tmux` | `nvim ~/notes` |
| 2 | `zsh` | `nvim ~/notes` |
| 1 | `shell` | `zsh` |

## `<project>[/<worktree>]`

| Index | Name | Command |
|-------|------|---------|
| 1 | `info` | `zsh` |
| 2 | `ide` | `nvim ~/notes` |
| 2 | `ops` | `nvim ~/notes` |
| 2 | `run` | `nvim ~/notes` |
| 2 | `test` | `nvim ~/notes` |
| 2 | `shell` | `nvim ~/notes` |

# Neovim Layouts

```
Layout
    .view
    .left_drawer
        .status
        .open
        .close
        .toggle
        .append
        .prepend
        .insert
        .remove
        .pop_first
        .pop_last
        .move_up
        .move_down
        .set_tools
        .configure
    .right_drawer
    .bottom_drawer
    .editor
        .add_column_left
        .add_column_right
        .split_column_up
        .split_column_down
    .modal
        .open
        .close
    .floating_window
        .open
        .close
        .focus
```

## Components

- editor

- left sidebar
- right sidebar
- bottom drawer

- modal
- popup

- completion
    - main
    - help

- left halfscreen
- right halfscreen

- tabpage

## Tools

- bottom only
    - terminal
    - diagnostics
    - quickfix
- outline 
- undotree

- file tree
- open buffers
- code outline
- version control

- tests
- lint diagnostics
- lsp diagnostics
- diagnostics

- tasks
- terminal
- dap menus (which ones are available?)

- drivers

- ai chat
- profiling

- code actions
- help menu

## Layouts

- editor
    - vertical splits over 


# Git workflows

## Check out a new branch

## Staging changes

## Merge changes from main into a feature branch

## Make a simple commit

## Make a final, linted commit

## Push to remote

## Cherry pick diffs from another commit

## Create a PR on GitHub

## Review a PR on GitHub

## Configure remotes

## Fetch metadata from remotes

## Git bisect to find errors

## Review GitHub Issues

# Task Management

# Infra administration

# Coding with AIs

# Note-taking

# Recording
