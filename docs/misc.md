# Misc Notes

![puppy](assets/puppy.png)


# External devices

| Target                    | Canonical Tooling                                  | Preferred Language(s)    |
|---------------------------|----------------------------------------------------|---------------------------|
| Native Windows App        | Visual Studio, CMake, Cargo                        | C++, Rust                 |
| Native macOS App          | Xcode, SwiftUI, AppKit, Tauri                      | Swift, Rust, TypeScript   |
| iPhone App                | Xcode, SwiftUI                                     | Swift                     |
| Android App               | Android Studio, Jetpack Compose, Android NDK       | Kotlin, Rust              |
| Steam Game                | Unreal, Unity, Godot, Bevy                         | C++, Rust                 |
| Apple Vision App          | Xcode, SwiftUI, RealityKit                         | Swift                     |
| Apple Watch App           | Xcode, SwiftUI                                     | Swift                     |
| Chrome Extension          | Webpack, Rollup                                    | TypeScript                |
| Firefox Extension         | Webpack, Rollup                                    | TypeScript                |
| Safari Extension          | Xcode, Safari Web Extensions                       | Swift, TypeScript         |
| VSCode Extension          | VSCode Extension API, vsce                         | TypeScript                |
| Custom Boards (Raspberry Pi)| Cross-compilation (GCC, Cargo), GPIO libraries   | Python, Rust, C++         |
| Embedded Systems          | Embedded Rust (Cargo, embedded-hal), ARM GCC       | Rust, C/C++               |


# LSP events

| **Workflow Title**                               | **Neovim Event**                                                 | **LSP Actions**                                                                                                                    | **Description / Logic**                                                                                                                                                                                                                                                                                                                                                                                                                            |
|--------------------------------------------------|------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Attach LSP Client to Buffer**                  | `BufReadPost`, `BufNewFile`                                      | 1. Checks if a matching LSP server is configured for the filetype<br>2. Attaches the LSP client if not already attached<br>3. Sends `textDocument/didOpen` to server       | **Logic**: When a buffer is opened (file read) or created (new file), Neovim checks if an LSP server should handle this filetype. If yes, the built-in client attaches. Attaching includes sending the entire buffer’s content to the server as a `didOpen` notification.<br><br>**Diagnostics**: Initially, the server may respond with diagnostics for that file. Neovim then updates the diagnostic display (signs, virtual text, etc.).                              |
| **Detach LSP Client from Buffer**                | `BufUnload`, `BufDelete`                                         | Sends `textDocument/didClose` to the server                                                                                         | **Logic**: When the buffer is unloaded or deleted, the LSP client notifies the server that the text document is closed. This frees resources on the server side.<br><br>**Diagnostics**: Once detached, no further diagnostics are published for that buffer, and local LSP interactions end unless you re-attach.                                                                                                                                         |
| **Send didChange upon Buffer Modifications**     | `TextChanged`, `TextChangedI`, `InsertLeave`                     | Sends `textDocument/didChange` (incremental changes) to the server (with a short debounce)                                         | **Logic**: Whenever you change text (normal or insert mode), the LSP client accumulates edits and sends them to the server in an incremental `didChange` request. By default, there’s a short debounce so you don’t send a request on every keystroke.<br><br>**Diagnostics**: The server uses these updates to recompute diagnostics. When the server publishes new diagnostics, Neovim updates signs, virtual text, etc., in real time.                                 |
| **Saving the Buffer (Pre/Post Save Logic)**      | `BufWritePre`, `BufWritePost`                                    | - (Optional) `textDocument/willSave`<br>- (Optional) `textDocument/didSave`<br>- (Optional) `vim.lsp.buf.format()`                  | **Logic**:<br>• On `BufWritePre`, you may configure auto-formatting via `vim.lsp.buf.format()`. Some servers support `willSave`, which can be sent before writing if enabled.<br>• On `BufWritePost`, the client can send `didSave` if `send_notification.didSave = true` in the server config. Some servers re-check or trigger additional tasks on `didSave`.<br><br>**Diagnostics**: The server often re-publishes diagnostics right after save if anything changed. |
| **Diagnostics & Floating Windows**               | `CursorHold`, `CursorHoldI`, sometimes `InsertLeave`             | Typically no LSP request here; triggers local `vim.diagnostic.open_float()` or other local diagnostic display methods              | **Logic**: When the cursor is held still (`CursorHold`) or you exit insert mode (`InsertLeave`), you can auto-show a floating diagnostic window (`vim.diagnostic.open_float()`).<br><br>**Diagnostics**: The built-in diagnostic system updates automatically as soon as the server publishes new diagnostics. These events merely trigger the floating window display if you configure it. No additional server request is made.                                  |
| **CodeLens or Inlay Hint Refresh**               | `CursorHold`, `BufEnter`, sometimes `InsertLeave`                | Sends `textDocument/codeLens` requests (or `textDocument/inlayHint`) to the server                                                 | **Logic**: A user config might call `vim.lsp.codelens.refresh()` on these events, prompting Neovim to request updated code lens or inlay hints.<br><br>**Diagnostics**: Code lens and inlay hints are separate from normal diagnostics, but similarly, the server can also republish diagnostic info at any time.                                                                                                                                              |
| **Manual or Automatic Completion**               | Typically plugin-driven (e.g., `InsertCharPre`, `TextChangedI`)   | `textDocument/completion` (on-demand)                                                                                              | **Logic**: Autocompletion usually comes from plugins (like `nvim-cmp`). These plugins request completion items from the server as you type or when you trigger completion manually.<br><br>**Diagnostics**: This doesn’t directly affect diagnostics. However, if server logic updates anything during completion, it may publish new diagnostics.                                                                                                                  |
| **Manual LSP Detach**                            | `LspDetach` (Neovim ≥ 0.8)                                       | Client de-initialization and resource cleanup                                                                                     | **Logic**: If you explicitly detach the LSP client (via code or user action), this event fires. It’s similar to `BufUnload` except it’s a direct detach from the LSP side. You might clean up buffer-local settings or mappings here.<br><br>**Diagnostics**: After detaching, no further diagnostics from that server are updated for this buffer.                                                                                                          |


# IDE Feature Checklist (LSP + DAP)

## Code Intelligence

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| Go to Definition        | Jump to the symbol's definition.                                            |
| Go to Declaration       | Navigate to the symbol's declaration.                                       |
| Go to Implementation    | Jump to the implementing function/class.                                    |
| Go to Type Definition   | Navigate to the type definition of a variable or expression.                |
| Find All References     | Find all usages of a symbol across files.                                   |
| Hover Info              | Show type, docstring, and metadata when hovering over a symbol.             |
| Signature Help          | Display function/method signatures as you type.                             |
| Document Symbols        | List all symbols (functions, classes, variables) in the current file.       |
| Workspace Symbols       | Search for any symbol across the entire project/workspace.                  |

## Editing & Completion

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| Auto-completion         | Suggest symbols, keywords, methods, etc. as you type.                       |
| Snippet Completion      | Expand snippets with tab stops and placeholders.                            |
| Code Actions / Fixes    | Quick fixes such as missing imports or suggested changes.                   |
| Rename Symbol           | Rename a variable/function across the codebase.                             |
| Extract Variable        | Convert selected expression into a new variable.                            |
| Extract Method          | Convert selected code into a new method/function.                           |
| Inline Variable         | Inline the value of a variable and remove the declaration.                  |
| Auto Import Symbol      | Automatically add required import statements.                               |
| Folding Ranges          | Allow collapsing/expanding code blocks like functions or classes.           |
| Format Document         | Format the entire document.                                                 |
| Format Selection        | Format a selected range.                                                    |
| Format on Save          | Automatically format file on save.                                          |

## Linting & Diagnostics

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| Real-time Diagnostics   | Display errors, warnings, hints, and info as you type.                      |
| Code Lenses             | Inline actionable items (e.g., run test, implement interface).              |
| Semantic Highlighting   | Color code based on semantics (e.g., types, variables).                     |
| Inline Annotations      | Show hints or warnings directly inline.                                     |
| Suppress Diagnostics    | Ignore specific warnings (e.g., `// @ts-ignore`).                           |

## File & Project Navigation

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| File Outline View       | View symbols/structure of current file.                                     |
| Workspace Symbol Search | Search for symbols across the workspace.                                    |
| References View         | View all references to a symbol.                                            |
| Call Hierarchy          | Show functions that call or are called by a symbol.                         |

## Language Services

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| Semantic Tokens         | Advanced syntax highlighting based on language rules.                       |
| Inlay Hints             | Show inferred types or parameter names inline.                              |
| Inline Value Hints      | Display runtime values (if integrated with debugger).                       |
| Custom Commands         | Expose language-specific functionality as commands.                         |
| Linked Editing Ranges   | Simultaneous editing of related tokens (e.g., tags).                        |
| Prepare Rename          | Validate that a symbol can be renamed.                                      |

## On-the-Fly Actions

| Feature                      | Description                                                             |
|------------------------------|-------------------------------------------------------------------------|
| Rename File + Update Imports | Automatically update imports when a file is renamed.                    |
| Auto Fix on Save             | Automatically apply available fixes when saving.                        |
| Organize Imports             | Sort, group, and remove unused imports.                                 |
| Sort Members                 | Alphabetically or logically order class members.                        |
| Remove Unused Code           | Detect and remove unused variables, functions, etc.                     |

## Cross-Language & Multi-Project Support

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| Multi-root Workspaces   | Support for multiple folders/projects in a single workspace.                |
| Cross-file Navigation   | Navigate across files, even across languages.                               |
| Partial Project Indexing| Load/index large codebases incrementally.                                   |

## Custom / Advanced (LSP Extensions)

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| Test Discovery/Execution| Discover and run unit tests from within the IDE.                            |
| Documentation Generation| Generate JSDoc or similar comments automatically.                           |
| AST Visualization       | Visual representation of the abstract syntax tree.                          |
| Schema-aware Validation | Validate config files using JSON/YAML schemas.                              |
| Live Collaboration      | (External) support for real-time editing with others.                       |

## Debugging (Debug Adapter Protocol - DAP)

| Feature                   | Description                                                               |
|---------------------------|---------------------------------------------------------------------------|
| Launch/Attach Debugger    | Start debugging session or attach to running process.                     |
| Breakpoints               | Set/remove breakpoints in source code.                                    |
| Conditional Breakpoints   | Trigger breakpoints only when a condition is met.                         |
| Logpoints                 | Log a message to the console without stopping execution.                  |
| Step Over                 | Execute the current line and move to the next one.                        |
| Step Into                 | Step into function/method calls.                                          |
| Step Out                  | Step out of the current function.                                         |
| Continue                  | Resume program execution until next breakpoint.                           |
| Pause                     | Pause program execution at current state.                                 |
| Variable View             | View local/global variables in current scope.                             |
| Watch Expressions         | Evaluate and watch custom expressions during execution.                   |
| Call Stack View           | Visualize the current function call stack.                                |
| Threads View              | Display and manage multiple threads.                                      |
| Evaluate in Debug Console | Run arbitrary code in the context of current stack frame.                 |
| Exception Breakpoints     | Break on uncaught or specific exceptions.                                 |

## Optional Tools & Enhancements

| Feature                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| LSP Inspector/Logger    | Dev tools to view LSP requests/responses.                                   |
| Offline Indexing        | Cache symbol data for offline use.                                          |
| Lazy Loading            | Load language servers only when needed.                                     |
| Theme-aware Highlighting| Match semantic colors to IDE theme.                                         |

# Ctrl keybindings

| Ctrl binding (Neovim)  | ASCII (Dec / Hex) | Physical Key(s) |
|------------------------|-------------------|------------------|
| `<C-@>` / `<Nul>`      | 0 / 0x00          | `<C-Space>`, ```<C-`>```, `<C-@>` |
| `<C-A>`                | 1 / 0x01          | `<C-a>`, `<C-A>` |
| `<C-B>`                | 2 / 0x02          | `<C-b>`, `<C-B>` |
| `<C-C>`                | 3 / 0x03          | `<C-c>`, `<C-C>` |
| `<C-D>`                | 4 / 0x04          | `<C-d>`, `<C-D>` |
| `<C-E>`                | 5 / 0x05          | `<C-e>`, `<C-E>` |
| `<C-F>`                | 6 / 0x06          | `<C-f>`, `<C-F>` |
| `<C-G>`                | 7 / 0x07          | `<C-g>`, `<C-G>` |
| `<C-H>` / `<BS>`       | 8 / 0x08          | `<C-h>`, `<C-H>`, `<Backspace>` (sometimes) |
| `<C-I>` / `<Tab>`      | 9 / 0x09          | `<C-i>`, `<C-I>`, `<Tab>` |
| `<C-J>` / `<NL>`       | 10 / 0x0A         | `<C-j>`, `<C-J>`, `<C-Enter>` (sometimes) |
| `<C-K>`                | 11 / 0x0B         | `<C-k>`, `<C-K>` |
| `<C-L>`                | 12 / 0x0C         | `<C-l>`, `<C-L>` |
| `<C-M>` / `<CR>`       | 13 / 0x0D         | `<C-m>`, `<C-M>`, `<Enter>` |
| `<C-N>`                | 14 / 0x0E         | `<C-n>`, `<C-N>` |
| `<C-O>`                | 15 / 0x0F         | `<C-o>`, `<C-O>` |
| `<C-P>`                | 16 / 0x10         | `<C-p>`, `<C-P>` |
| `<C-Q>`                | 17 / 0x11         | `<C-q>`, `<C-Q>` |
| `<C-R>`                | 18 / 0x12         | `<C-r>`, `<C-R>` |
| `<C-S>`                | 19 / 0x13         | `<C-s>`, `<C-S>` |
| `<C-T>`                | 20 / 0x14         | `<C-t>`, `<C-T>` |
| `<C-U>`                | 21 / 0x15         | `<C-u>`, `<C-U>` |
| `<C-V>`                | 22 / 0x16         | `<C-v>`, `<C-V>` |
| `<C-W>`                | 23 / 0x17         | `<C-w>`, `<C-W>` |
| `<C-X>`                | 24 / 0x18         | `<C-x>`, `<C-X>` |
| `<C-Y>`                | 25 / 0x19         | `<C-y>`, `<C-Y>` |
| `<C-Z>`                | 26 / 0x1A         | `<C-z>`, `<C-Z>` |
| `<C-[>` / `<Esc>`      | 27 / 0x1B         | `<C-[>`, `<Esc>`, `<C-{>` |
| `<C-\>`                | 28 / 0x1C         | `<C-\>`, `<C-|>` |
| `<C-]>`                | 29 / 0x1D         | `<C-]>`, `<C-}>` |
| `<C-^>`                | 30 / 0x1E         | `<C-^>`, `<C-6>` |
| `<C-_>`                | 31 / 0x1F         | `<C-_>`, `<C-Shift-->` |
| `<C-?>` / `<Del>`      | 127 / 0x7F        | `<C-?>`, `<C-BS>`, `<Del>` |

