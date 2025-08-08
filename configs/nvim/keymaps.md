# Neovim Keymaps Reference

This document provides a comprehensive list of all keymaps defined in the Neovim configuration, sourced from `lua/siddthesquid/keymap.lua`.

## Keymap Table

| Context | Name | Keybinding | Description |
|---------|------|------------|-------------|
| **Window Navigation** |
| Normal | Focus Left | `<C-h>` | Move focus to the left window |
| Normal | Focus Right | `<C-l>` | Move focus to the right window |
| Normal | Focus Down | `<C-j>` | Move focus to the lower window |
| Normal | Focus Up | `<C-k>` | Move focus to the upper window |
| **Window Splitting** |
| Normal | Horizontal Split | `<C-_>` | Create horizontal split |
| Normal | Vertical Split | `<C-\>` | Create vertical split |
| **Tab Navigation** |
| Normal | Previous Tab | `[t` | Go to previous tab |
| Normal | Next Tab | `]t` | Go to next tab |
| **Color Column** |
| Normal | Column 80 | `<leader>c8` | Set colorcolumn to 80 |
| Normal | Column 100 | `<leader>c0` | Set colorcolumn to 100 |
| Normal | Clear Column | `<leader>cc` | Clear colorcolumn |
| **File Tree** |
| Normal | Toggle Tree | `<leader>ee` | Toggle Neotree reveal |
| **Fuzzy Finding (FZF)** |
| Normal | Find Files | `<leader>ff` | Find Files in project directory |
| Normal | Live Grep | `<leader>fg` | Find by grepping in project directory |
| Normal | Find Highlights | `<leader>fc` | Find in neovim configuration |
| Normal | Find Config | `<leader>fn` | Find in neovim configuration |
| Normal | Find Help | `<leader>fh` | [F]ind [H]elp |
| Normal | Find Keymaps | `<leader>fk` | [F]ind [K]eymaps |
| Normal | Find Options | `<leader>fo` | [F]ind Neovim [O]ptions |
| Normal | Find Builtin | `<leader>fb` | [F]ind [B]uiltin FZF |
| Normal | Find Word | `<leader>fw` | [F]ind current [W]ord |
| Normal | Find WORD | `<leader>fW` | [F]ind current [W]ORD |
| Normal | Find Diagnostics | `<leader>fd` | [F]ind [D]iagnostics |
| Normal | Find Resume | `<leader>fr` | [F]ind [R]esume |
| Normal | Find Buffers | `<leader><leader>` | [,] Find existing buffers |
| Normal | Workspace Symbols | `<leader>fs` | [f]ind LSP workspace [s]ymbols |
| Normal | Grep Buffer | `<leader>/` | [/] Live grep the current buffer |
| **Diagnostics & Trouble** |
| Normal | Diagnostics | `<leader>dd` | Diagnostics (Trouble) |
| Normal | Buffer Diagnostics | `<leader>dD` | Buffer Diagnostics (Trouble) |
| Normal | Symbols | `<leader>ds` | Symbols (Trouble) |
| Normal | LSP References | `<leader>dl` | LSP Definitions / references / ... (Trouble) |
| Normal | Location List | `<leader>dL` | Location List (Trouble) |
| Normal | Quickfix List | `<leader>dQ` | Quickfix List (Trouble) |
| Normal | Toggle LSP Lines | `<leader>di` | Toggle lsp_lines |
| **Movement (Hop)** |
| Insert, Normal, Visual | Hop Words | `<C-g>` | Hop to any word |
| Normal, Visual | Hop Lines | `<leader>gl` | Hop to any line |
| **LSP Actions** (Buffer-local when LSP attached) |
| Normal | Go to Definition | `<leader>cd` | LSP: [G]oto [D]efinition |
| Normal | Find References | `<leader>cr` | LSP: [G]oto [R]eferences |
| Normal | Go to Implementation | `<leader>ci` | LSP: [G]oto [I]mplementation |
| Normal | Type Definition | `<leader>ct` | LSP: Type [D]efinition |
| Normal | Document Symbols | `<leader>cs` | LSP: [D]ocument [S]ymbols |
| Normal | Workspace Symbols | `<leader>cw` | LSP: [W]orkspace [S]ymbols |
| Normal | Rename | `<leader>cn` | LSP: [R]e[n]ame |
| Normal, Visual | Code Action | `<leader>ca` | LSP: [C]ode [A]ction |
| Normal | Go to Declaration | `<leader>cD` | LSP: [G]oto [D]eclaration |
| Normal | Format Buffer | `<leader>cf` | LSP: [F]ormat buffer |
| Normal | Toggle Inlay Hints | `<leader>ch` | LSP: [T]oggle Inlay [H]ints |

## Notes

- **Leader Key**: The leader key is set to `<Space>` (space character)
- **LSP Keymaps**: LSP-related keymaps are only available when an LSP server is attached to the current buffer
- **Context**: Indicates which Vim mode the keymap is active in (Normal, Insert, Visual, etc.)
- **Conditional Keymaps**: Some LSP keymaps like inlay hints are only available if the language server supports them

## Keymap Prefixes

- `<leader>c`: Code/LSP actions and color column settings
- `<leader>d`: Diagnostics and debugging
- `<leader>e`: Editor/tree operations
- `<leader>f`: Finding/searching operations
- `<leader>g`: Movement/navigation (hop)
- `[` and `]`: Bracket-based navigation (tabs, etc.)
- `<C-*>`: Control-based shortcuts for core operations