# Repository Overview

## Project Description

This is a comprehensive Neovim configuration repository written in Lua. It provides a fully-featured IDE-like experience with extensive language support, modern UI enhancements, and development tooling.

**Main purpose and goals:**
- Create a powerful, extensible Neovim setup for professional development
- Support multiple programming languages with LSP, completion, and debugging
- Provide a modern UI with file trees, status lines, and enhanced visual feedback
- Enable efficient workflow with telescope fuzzy finding, git integration, and key management

**Key technologies used:**
- **Lua**: Primary configuration language for Neovim
- **lazy.nvim**: Plugin manager for lazy-loading and performance optimization
- **LSP**: Language Server Protocol support via nvim-lspconfig and mason
- **Treesitter**: Advanced syntax highlighting and code analysis
- **Nix**: Optional reproducible development environment via flake.nix
- **Python**: Required packages via requirements.txt (neovim, usort, ocdc)

## Architecture Overview

### High-level architecture

The configuration follows a modular Lua architecture with clear separation of concerns:

1. **Entry Point** (`init.lua`): Bootstraps lazy.nvim plugin manager
2. **Plugin Definitions** (`lua/plugins/*.lua`): Declarative plugin specifications organized by functionality
3. **Configuration Modules** (`lua/configs/`): Plugin-specific configuration logic
4. **LSP Setup** (`lua/lsp/`): Language server configurations and handlers
5. **Core Settings** (`plugin/options.lua`, `plugin/autocmd.lua`): Vim options and autocommands
6. **Themes** (`lua/theme/`): Colorscheme configurations

### Main components and their relationships

```
init.lua
  └─> lazy.nvim (Plugin Manager)
      ├─> plugins/*.lua (Plugin Specs)
      │   ├─> lsp/init.lua → mason → lspconfig → null-ls
      │   ├─> completion.lua → nvim-cmp/blink.cmp + snippets
      │   ├─> treesitter.lua → syntax highlighting
      │   ├─> telescope.lua → fuzzy finding
      │   ├─> git.lua → gitsigns + worktree
      │   ├─> editor.lua → which-key + file trees
      │   └─> ui/init.lua → lualine + notifications
      └─> configs/ (Configuration Implementations)
```

### Data flow and system interactions

1. **LSP Flow**: File open → LSP client attach → diagnostics → completion sources → virtual text/signs
2. **Completion Flow**: Insert mode → completion sources (LSP/buffer/snippets) → nvim-cmp/blink.cmp → snippet expansion
3. **Navigation Flow**: User input → which-key hints → telescope picker → file/buffer/symbol selection
4. **Git Integration**: File changes → gitsigns → status line indicators → git actions

## Directory Structure

### Important directories and their purposes

- **`lua/`**: Core Lua configuration modules
  - `configs/`: Plugin-specific configuration implementations
    - `completion/`: Auto-completion setup (cmp, blink.cmp)
    - `lsp/`: LSP configuration (mason, null-ls, handlers)
    - `telescope/`: Fuzzy finder configuration
    - `lazy/`: Plugin manager bootstrap and setup
  - `plugins/`: Plugin specifications for lazy.nvim
    - `lsp/init.lua`: Language server plugins
    - `completion.lua`: Completion engine plugins
    - `treesitter.lua`: Treesitter configuration
    - `telescope.lua`: Telescope and extensions
    - `git.lua`: Git integration plugins
    - `editor.lua`: Editor enhancements (which-key, file trees)
    - `ui/init.lua`: UI plugins (statusline, notifications)
    - `theme/`: Colorscheme plugins
  - `lsp/`: LSP-specific configurations
    - `handlers.lua`: LSP handlers and diagnostics setup
    - `common.lua`: Shared LSP utilities
  - `theme/`: Theme configurations
  - `lualine/themes/`: Custom statusline themes

- **`plugin/`**: Vim auto-loaded scripts
  - `options.lua`: Global Vim/Neovim settings
  - `autocmd.lua`: Autocommands for various behaviors

- **`after/lsp/`**: Language-specific LSP overrides
- **`lsp/`**: Root-level LSP configurations (helm_ls, jsonls, lua_ls)
- **`test/`**: Test files for various languages
- **`spell/`**: Custom spell checking dictionaries
- **`snippets/`**: Custom snippet definitions

### Key files and configuration

- **`init.lua`**: Main entry point, loads lazy.nvim
- **`flake.nix`**: Nix flake for reproducible development environment
- **`requirements.txt`**: Python dependencies for Neovim
- **`.stylua.toml`**: Lua formatter configuration
- **`.luarc.json`**: Lua language server settings
- **`.lua-format`**: Lua formatter rules (legacy)

### Entry points and main modules

1. **Bootstrap**: `init.lua` → `lua/configs/lazy/init.lua`
2. **Settings**: `plugin/options.lua` (loaded automatically)
3. **Autocommands**: `plugin/autocmd.lua` (loaded automatically)
4. **Plugins**: `lua/plugins/*.lua` (imported by lazy.nvim)
5. **LSP**: `lua/lsp/handlers.lua` → `lua/plugins/lsp/init.lua`

## Development Workflow

### How to build/run the project

**Standard setup:**
```bash
# 1. Clone to Neovim config directory
git clone <repo-url> ~/.config/nvim

# 2. Install Python dependencies (optional but recommended)
pip install -r requirements.txt
# or with uv:
uv pip install -r requirements.txt

# 3. Launch Neovim
nvim

# 4. lazy.nvim will auto-install on first launch
# Wait for plugin installation to complete
```

**Nix setup (for reproducible environment):**
```bash
# Build and run via nix flake
nix run .

# Or enter development shell
nix develop
```

### Plugin management

```vim
" Update all plugins
:Lazy update

" Sync plugins (install missing, update, clean)
:Lazy sync

" Check plugin status
:Lazy

" Profile startup time
:Lazy profile
```

### LSP management

```vim
" Install language servers
:Mason

" Install specific LSP
:MasonInstall rust_analyzer

" Update all tools
:MasonUpdate

" Check LSP status
:LspInfo
```

### Testing approach

- Test files provided in `test/` directory for various languages
- Manual testing via opening different file types
- LSP functionality tested per-language in `test/` directory
- No automated test suite currently configured

### Development environment setup

**Dependencies:**
- Neovim >= 0.9.0 (recommended: latest stable or nightly)
- Git (for plugin management)
- Ripgrep (`rg`) - for telescope live_grep
- fd - for telescope find_files (optional)
- Node.js - for various LSP servers
- Python 3 with `neovim` package
- Nerd Font - for icons (optional but recommended)

**Language-specific tools (installed via Mason):**
- LSP servers: ansiblels, bashls, lua_ls, pyright, rust_analyzer, ts_ls, etc.
- Formatters: stylua, prettier, black (via null-ls)
- Linters: Various (configured in null-ls)

### Lint and format commands

**Lua formatting:**
```bash
# Format Lua files with stylua
stylua .

# Check formatting
stylua --check .
```

**LSP formatting (in Neovim):**
```vim
" Format current buffer
:lua vim.lsp.buf.format()

" Or use keybinding (check which-key for current mapping)
```

**Configuration validation:**
```bash
# Check Lua syntax with luac
find lua -name "*.lua" -exec luac -p {} \;

# Lint with selene (if configured)
selene lua/
```

### Key directories for development

- Edit plugin specs: `lua/plugins/`
- Edit plugin configs: `lua/configs/`
- Edit LSP settings: `lua/lsp/` and `after/lsp/`
- Edit Vim settings: `plugin/options.lua`
- Edit autocommands: `plugin/autocmd.lua`
- Add custom snippets: `snippets/`

### Common tasks

**Add a new plugin:**
1. Create/edit file in `lua/plugins/`
2. Add plugin spec following lazy.nvim format
3. Restart Neovim or `:Lazy reload`

**Configure an LSP:**
1. Add to `ensure_installed` in `lua/plugins/lsp/init.lua`
2. Create config file in `lua/lsp/` or `after/lsp/` if custom settings needed
3. Restart Neovim or `:LspRestart`

**Change theme:**
1. Edit `lua/theme/init.lua` or plugin colorscheme configuration
2. Set colorscheme in `lua/configs/lazy/init.lua` install.colorscheme
