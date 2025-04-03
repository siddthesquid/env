# Core Concepts for Developer Tools

A common theme among a lot of the developer tools we will be using is the ability to easily **program** in new features, rather than only relying on 3rd party plugins and configurations.

Thus, we need to understand the tools from the ground up. Doing this will allow us to

- create automation for any workflow
- understand potential security risks

# zsh


# Tmux

# Neovim

## `vim.diagnostic`

## nvim-cmp


## Ecosystem

```
flowchart LR

nvim-treesitter --"installs"--> Parsers
Parsers --> nvim-treesitter --> Syntax --> nvim
nvim-treesitter --> Folding
nvim-treesitter --> FoldingPlugins --> Folding --> nvim
nvim-treesitter --> EditingPlugins[Editing Plugins\nlike treesj] --> Editing --> nvim

LSP --> ComplPlugins[Completion \nPlugins \nlike cmp] --> Completion --> nvim
ComplSources[Completion\nSource Plugins] --> ComplPlugins
Snippet[Snippet Engines\n like Luasnip] --- ComplPlugins

LSP --> FoldingPlugins[nvim-ufo]
LSP --> DefRef --> nvim
LSP --> SelectorPlugins --> DefRef
LSP --> EditingPlugins
LSP --"Semantic\n Highlighting"--> Syntax
LSP --> Diagnostics --> nvim
LSP --> Formatting --> nvim
Formatters --> FormatPlugins[Formatting \nPlugins like \nformatter.nvim] --> Formatting
Linters --> LinterPlugins[Linter \nPlugins like \nnvim-lint] --> Diagnostics

CLI --> SelectorPlugins[Selector Plugins \nlike Telescope] --> Search --> nvim

DAPs --> nvim-dap --> Debugging --> nvim
DapPlugins[nvim-dap Plugins \nlike dap-ui] --> nvim-dap


MP[Mason Plugins\n like mason-lspconfig] --"enable\nauto-install"--> Mason
Mason --installs--> LSP
Mason --installs--> Formatters
Mason --installs--> Linters
Mason --installs--> DAPs
Mason --installs--> gh

git --> SelectorPlugins --> gitCapabilities --> nvim
git --> GitPlugins[Git Plugins\n like Neogit] --> gitCapabilities
gh --> GitPlugins

languageCLIs  --> replPlugins[REPL Plugins \nlike iron.nvim] --> REPL --> nvim
languageCLIs  --> runPlugins[Code Running \nPlugins] --> CodeRunning --> nvim

subgraph editor-agnostic
	languageCLIs[Language CLIs]
	gh
	git
	LSP[LSP Servers]
	Formatters
	Linters
	DAPs
	CLI[Search CLIs \nlike rg or fd]
	Parsers[Treesitter\n Parsers]
end

subgraph capabilities
	REPL{{REPL}} 
	CodeRunning{{Code Running}} 
	gitCapabilities{{git capabilities}}
	Diagnostics{{Diagnostics}}
	Formatting{{Formatting}}
	Folding{{Folding}}
	Completion{{Completion}}
	DefRef{{Definitions\n & References}}
	Search{{File & String \nSearch}}
	Debugging{{Debugging}}
	Syntax{{Syntax\n Highlighting}}
	Editing{{Editing\n Support}}
end

nvim{nvim}
nvim --> GUI
nvim --> Terminal
Multiplexer[Terminal\nMultiplexer] --- Terminal
nvim --> MultiplexPlugins[Multiplexer\n Connection\n Plugins] --> Multiplexer
nvim --> Browser
nvim --> VSCode

subgraph user-interfaces
	GUI[GUIs like\nneovide]
	Terminal[Terminal\nEmulator]
	Browser[Browser plugins \nlike firenvim]
	VSCode[VS**** \nIntegration]
end
```

# Treesitter

[Treesitter](https://tree-sitter.github.io/tree-sitter) is a parser generator tool and an incremental parsing library. For languages for which tree-sitter parsers exist, we can view and modify code in a language agnostic way. This also includes things like

- syntax highlighting (even embedded in markdown files),
- quicker/smarter navigation (eg jump to the next function)
- target syntactic elements and blocks for commands

Parsers are usually written in javascript but then compiled to optimized C. It is built into neovim and many plugins even assume the usage of treesitter, so understanding tree-sitter is crucial.

## Core Concepts

Let's quickly take a look at Tree-sitter from the perspective of a programming language developer.

Clients of a Tree-sitter grammar can use the grammar on a single file to generate a syntax tree. These clients can include

- programs using Tree-sitter libraries to parse and modify a file
- IDEs (eg neovim)
- text readers (eg bat)

Tree-sitter has four main entities:

- `TSLanguage` - the language-specific compiled C definitions that tell tree-sitter how a specific language is to be parsed
- `TSParser` - can parse a `TSLanguage` to create a `TSTree`
- `TSTree` - syntax tree of a file, composed of `TSNode`s
- `TSNode` - a node of the syntax tree. can contain metadata

This is what would happen:

- The developer would generate a `TSLanguage` by writing the grammar (i.e. in JS) and then compiling with Tree-sitter
- Clients can use Tree-sitter APIs to navigate and 

## Queries

## Syntax Highlighting

## Code Navigation

# LSP

LSPs give us

- diagnostic
- omnifunc
- tag func
- format expression

# DAP

# Testing / Coverage

# git

# fzf

