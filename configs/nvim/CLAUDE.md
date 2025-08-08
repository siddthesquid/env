# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a modular Neovim configuration built with Lua, using the Lazy.nvim plugin manager for dependency management.

### Core Structure

- **Entry Point**: `init.lua` loads the core module
- **Core Module** (`lua/core/`): Contains fundamental configuration
  - `init.lua`: Main initialization with keymaps and module loading  
  - `lazy.lua`: Lazy.nvim plugin manager setup
  - `general.lua`, `display.lua`, `lsps.lua`: Core vim settings
- **Custom Modules** (`lua/siddthesquid/`): Personal utilities
  - `keymap.lua`: Centralized keymap definitions and helper functions
  - `path.lua`: Standard path utilities for Neovim data directories
- **Plugin Configuration** (`lua/plugins/`): Individual plugin specs for Lazy.nvim

### Plugin Management

The configuration uses Lazy.nvim with plugins defined in separate files under `lua/plugins/`. Each plugin file returns a Lazy.nvim spec table. The external lazy.nvim installation is managed in `external/lazy.nvim/`.

Key plugin categories:
- **LSP**: `lsp.lua`, `mason.lua`, `lspsaga.lua` - Language server configuration
- **Completion**: `blink.lua` - Blink.cmp for autocompletion  
- **UI/Navigation**: `fzf-lua.lua`, `tree.lua`, `oil.lua` - File management and fuzzy finding
- **AI**: `ai.lua` - Supermaven and CodeCompanion for AI assistance
- **Development**: `dap.lua`, `conform.lua` - Debugging and formatting

### Key Architectural Patterns

1. **Centralized Keymaps**: The `siddthesquid.keymap` module provides functions that return keymap tables or set them directly, keeping all keybinds organized
2. **Path Management**: `siddthesquid.path` provides standardized access to Neovim directories
3. **Plugin Separation**: Each major plugin/feature has its own file in `plugins/` directory
4. **External Dependencies**: Third-party tools are installed to `external/` directory

## Development Commands

### Code Formatting
```bash
# Format Lua code with Stylua (configuration in stylua.toml)
stylua .
```

### Key Configuration Files
- `stylua.toml`: Lua code formatting rules (2 spaces, 80 char width, single quotes)
- `lazy-lock.json`: Lock file for plugin versions managed by Lazy.nvim

### Plugin Development
- Add new plugins by creating files in `lua/plugins/`
- Each plugin file should return a Lazy.nvim spec table
- Use the existing keymap patterns from `siddthesquid.keymap` for consistency

### Keymap Organization
- Global keymaps are set in `lua/core/init.lua` via `siddthesquid.keymap` functions
- Plugin-specific keymaps are defined within plugin configuration files
- Leader key is set to space character
- Common prefixes: `<leader>f` (find/search), `<leader>d` (diagnostics), `<leader>c` (color column)