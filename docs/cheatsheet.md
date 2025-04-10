# Cheatsheets, Keymaps, and Recipes

There are many contexts where we need to do something equivalent to running a command or performing some operation with the keyboard. We can broadly categorize these contexts like below:

| Context                        | Description |
| ------------------------------ | ----------- |
| interactive shell command      | x           |
| interactive fzf command        | x           |
| tmux commands                  | x           |
| tmux f-keys                    | x           |
| tmux option keybindings        | x           |
| neovim normal mode keybindings | x           |
| neovim visual mode keybindings | x           |
| neovim insert mode keybindings | x           |
| neovim commands                | x           |
| yabai meta keybindings         | x           |
| custom CLI app keybindings     | x           |

# Navigating Tmux

```
# switch to left windoow
<alt> + h

# switch to right window
<alt> + l

# create new window
<alt> + c
```

# Navigating Neovim

## Operators

| Operator | Description |
|----------|-------------|
| `d`      | Delete text (e.g. `dw` deletes a word) |
| `c`      | Change text (delete + enter insert mode) |
| `y`      | Yank (copy) text |
| `>`      | Indent text |
| `<`      | Un-indent text |
| `=`      | Auto-indent (re-indent) text |
| `g~`     | Toggle case |
| `gu`     | Lowercase text |
| `gU`     | Uppercase text |
| `!`      | Filter text through external shell command |

## Special Case "Operator-like" Commands

| Command | Description |
|---------|-------------|
| `v`     | Start visual mode (character-wise selection) |
| `V`     | Start visual line mode |
| `Ctrl-v` | Start visual block (column) mode |
| `s`     | Substitute (same as `cl`) |
| `S`     | Substitute line (same as `cc`) |
| `x`     | Delete character under cursor |
| `X`     | Delete character before cursor |
| `r<char>` | Replace a single character |

---

## Character Motions

| Motion | Description |
|--------|-------------|
| `h`    | Move left |
| `l`    | Move right |
| `0`    | Beginning of line |
| `^`    | First non-blank character of line |
| `$`    | End of line |
| `g_`   | Last non-blank character of line |

---

## Line Motions

| Motion | Description |
|--------|-------------|
| `j`    | Down one line |
| `k`    | Up one line |
| `+`    | Down to first non-blank of next line |
| `-`    | Up to first non-blank of previous line |
| `gg`   | First line of file |
| `G`    | Last line of file |

---

## Word Motions

| Motion | Description |
|--------|-------------|
| `w`    | Next word (start) |
| `W`    | Next WORD (non-blank chunk) |
| `e`    | End of word |
| `E`    | End of WORD |
| `b`    | Back to beginning of word |
| `B`    | Back to beginning of WORD |
| `ge`   | End of previous word |
| `gE`   | End of previous WORD |

---

## Sentence & Paragraph Motions

| Motion | Description |
|--------|-------------|
| `(`    | Beginning of previous sentence |
| `)`    | Beginning of next sentence |
| `{`    | Beginning of previous paragraph |
| `}`    | Beginning of next paragraph |

---

## Screen-Based Motions

| Motion | Description |
|--------|-------------|
| `H`    | Top of screen |
| `M`    | Middle of screen |
| `L`    | Bottom of screen |
| `gj`   | Down one display (wrapped) line |
| `gk`   | Up one display (wrapped) line |
| `g0`   | Start of screen line |
| `g$`   | End of screen line |

---

## Search Motions

| Motion | Description |
|--------|-------------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n`    | Repeat search forward |
| `N`    | Repeat search backward |
| `*`    | Search forward for word under cursor |
| `#`    | Search backward for word under cursor |
| `g*`   | Search forward for partial match |
| `g#`   | Search backward for partial match |

---

## Mark & Line Motions

| Motion | Description |
|--------|-------------|
| `'a`   | Go to line of mark `a` |
| `` `a `` | Go to exact position of mark `a` |
| `{count}G` | Go to line number |
| `:123` | Same as `{count}G` |

---

## Matching & Block Motions

| Motion | Description |
|--------|-------------|
| `%`    | Jump between matching `()`, `{}`, `[]`, etc. |
| `[[` / `]]` | Jump to previous/next section (headers, folds) |
| `[m` / `]m` | Start/end of method (with `cindent`) |
| `[M` / `]M` | Previous/next function start |

---

## Text Objects (used with operators like `d`, `c`, `y`)

| Object | Description |
|--------|-------------|
| `aw`   | A word (with surrounding space) |
| `iw`   | Inner word (no space) |
| `ap` / `ip` | A / inner paragraph |
| `as` / `is` | A / inner sentence |
| `a"` / `i"` | Around / inside double quotes |
| `a'` / `i'` | Around / inside single quotes |
| `a)` / `i)` | Around / inside parentheses |
| `a]` / `i]` | Around / inside brackets |
| `a}` / `i}` | Around / inside braces |
| `a>` / `i>` | Around / inside angle brackets |
| `at` / `it` | Around / inside HTML/XML tag |

---

## Common Operator + Motion Combos

| Command | Description |
|---------|-------------|
| `dw`    | Delete a word |
| `d$`    | Delete to end of line |
| `ci"`   | Change inside quotes |
| `yap`   | Yank a paragraph |
| `gUiw`  | Uppercase inner word |
| `>}`    | Indent paragraph |
| `=G`    | Auto-indent to end of file |

---

## Tips

- Operators are repeatable with `.`
- Motions can be used with counts: `d3w` deletes 3 words
- Use text objects for smarter edits (`daw`, `ci'`, etc.)

# Neovim Ctrl Keybindings Cheat Sheet

Complete list of `<C-*>` keybindings categorized by mode and type of operation.

---

## NORMAL MODE (`n`)

### Scrolling & Navigation
| Key        | Description                     |
|------------|---------------------------------|
| `<C-d>`    | Scroll half-page down           |
| `<C-u>`    | Scroll half-page up             |
| `<C-f>`    | Scroll full page forward        |
| `<C-b>`    | Scroll full page backward       |
| `<C-e>`    | Scroll down one line            |
| `<C-y>`    | Scroll up one line              |
| `<C-o>`    | Jump back in jump list          |
| `<C-i>`    | Jump forward in jump list       |

### Control & File Ops
| Key        | Description                        |
|------------|------------------------------------|
| `<C-^>`    | Open alternate file                |
| `<C-l>`    | Redraw screen (refresh UI)         |
| `<C-w>`    | Start a window command             |

---

## INSERT MODE (`i`)

### Basic Editing
| Key        | Description                        |
|------------|------------------------------------|
| `<C-h>`    | Backspace                          |
| `<C-w>`    | Delete previous word               |
| `<C-u>`    | Delete to beginning of line        |
| `<C-[>`    | Escape to Normal mode              |
| `<C-o>`    | Execute one Normal mode command then return to Insert |

### Completion (Using `<C-x>` Prefix)
| Key            | Description                             |
|----------------|-----------------------------------------|
| `<C-n>`        | Next in keyword completion              |
| `<C-p>`        | Previous in keyword completion          |
| `<C-x><C-l>`   | Line completion                         |
| `<C-x><C-n>`   | Keyword completion (same file)          |
| `<C-x><C-k>`   | Dictionary completion                   |
| `<C-x><C-t>`   | Thesaurus completion                    |
| `<C-x><C-i>`   | Included file keyword completion        |
| `<C-x><C-]>`   | Tag completion                          |
| `<C-x><C-f>`   | File name completion                    |
| `<C-x><C-d>`   | Definition completion (macros)          |
| `<C-x><C-v>`   | Vim command completion                  |
| `<C-x><C-u>`   | User-defined completion                 |
| `<C-x><C-o>`   | Omni completion                         |
| `<C-x>s`       | Spelling suggestion completion          |
| `<C-x><C-e>`   | Evaluate expression                     |
| `<C-x><C-y>`   | Completion from 'complete' sources      |

### Registers & Insertion
| Key            | Description                              |
|----------------|------------------------------------------|
| `<C-r>{reg}`   | Insert contents of register `{reg}`      |

---

## VISUAL MODE (`v`, `V`, `<C-v>`)

### Navigation
| Key        | Description                     |
|------------|---------------------------------|
| `<C-d>`    | Scroll half-page down           |
| `<C-u>`    | Scroll half-page up             |
| `<C-f>`    | Scroll full page forward        |
| `<C-b>`    | Scroll full page backward       |
| `<C-e>`    | Scroll down one line            |
| `<C-y>`    | Scroll up one line              |
| `<C-v>`    | Enter Visual Block mode         |

---

## COMMAND-LINE MODE (`:` `/` `?`)

### Navigation & Editing
| Key            | Description                          |
|----------------|--------------------------------------|
| `<C-b>`        | Move to start of line                |
| `<C-e>`        | Move to end of line                  |
| `<C-f>`        | Open command-line window             |
| `<C-h>`        | Backspace                            |
| `<C-w>`        | Delete previous word                 |
| `<C-u>`        | Delete to beginning of line          |
| `<C-c>`        | Cancel the command                   |
| `<C-r>{reg}`   | Insert contents of register `{reg}`  |
| `<C-n>`        | Next in history/completion           |
| `<C-p>`        | Previous in history/completion       |

---

## TERMINAL MODE (`t`)

### Mode Control
| Key              | Description                         |
|------------------|-------------------------------------|
| `<C-\><C-n>`     | Exit Terminal mode to Normal        |
| `<C-w>`          | Start window command after `<C-\><C-n>` |

---

## `<C-w>` WINDOW COMMANDS (Normal/Terminal mode)

| Key         | Description                        |
|-------------|------------------------------------|
| `<C-w>h/j/k/l` | Move between split windows      |
| `<C-w>s`    | Split horizontally                 |
| `<C-w>v`    | Split vertically                   |
| `<C-w>q`    | Close window                       |
| `<C-w>o`    | Close all other windows            |
| `<C-w>=`    | Equalize window sizes              |
| `<C-w>+/-`  | Increase/decrease height           |
| `<C-w><</>` | Decrease/increase width            |
| `<C-w>T`    | Move window to new tab             |

---

## Notes

- `<C-*>` = Press Ctrl + the indicated key.
- `<C-x>` in Insert mode is a prefix for advanced completion tools.
- Most `<C-w>` commands work in Normal and Terminal modes.
- `<C-r>{reg}` inserts contents of any register, useful in insert or cmd-line.

# Code Navigation

# Testing

# Debugging

# Git commands

# lazygit

# AI

# Investigating the host machine

# Docker

# Terraform

# Cloud

# Treesitter queries

# `zsh` Recipes

# `lua` Recipes

# Templates

# Navigating the OS
