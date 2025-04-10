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
                            - sh
                            - stat
                            - git
                            - ops
                            - svc
                            - dev
                            - test
                            - run
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
        bench: Operation
        lint: Operation
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
        release: Operation
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

## `pnpm` single

## `uv` monorepo

## `uv` single

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

# Modules

# `$HOME` directory

# Manual package management

# Environment variables

# Networking

# Writing `zsh` functions

# Writing `fzf` functions

# Neovim Layouts

# Git workflows

# Task Management

# Infra administration

# Coding with AIs

# Note-taking

# Recording
