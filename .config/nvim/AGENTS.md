# Neovim Configuration - Agent Guidelines

Lua-based Neovim configuration using lazy.nvim, LSP via mason, treesitter, and blink.cmp/nvim-cmp for completion.

## Quick Reference

### Lint and Format Commands

```bash
# Format all Lua files
stylua .

# Check formatting without changes
stylua --check .

# Lint with selene
selene lua/

# Check Lua syntax
find lua -name "*.lua" -exec luac -p {} \;
```

### In-Neovim Commands

```vim
:Lazy                    " Plugin manager UI
:Lazy update             " Update all plugins
:Lazy sync               " Install/update/clean plugins
:Lazy profile            " Profile startup time
:Mason                   " LSP/tool installer UI
:MasonInstall <server>   " Install specific tool
:LspInfo                 " Check attached LSP clients
:LspRestart              " Restart LSP for current buffer
:lua vim.lsp.buf.format() " Format current buffer
```

### Validation

```bash
# Test configuration loads without errors
nvim --headless -c 'qa'

# Check specific file syntax
luac -p lua/plugins/editor.lua
```

## Code Style Guidelines

### Formatting Rules (.stylua.toml)

- **Indentation**: 2 spaces (no tabs)
- **Line length**: Unlimited (column_width = 1000)
- **Quotes**: Single quotes preferred (AutoPreferSingle)
- **Parentheses**: Omit for single-argument function calls

```lua
-- CORRECT: No parentheses for require
require 'configs.lazy'
vim.cmd.colorscheme 'kanagawa'

-- WRONG: Avoid parentheses
require('configs.lazy')
```

### Table Formatting

Use leading commas for multiline tables (aligns cleanly):

```lua
-- CORRECT: Leading commas
{
  'plugin/name'
  , lazy = false
  , dependencies = {
    'other/plugin'
  }
  , opts = {
    option1 = true
    , option2 = 'value'
  }
}

-- WRONG: Trailing commas
{
  'plugin/name',
  lazy = false,
}
```

### Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Variables | snake_case | `install_path`, `sign_column` |
| Functions | snake_case | `on_attach`, `common_capabilities` |
| Module tables | Single letter | `local M = {}` |
| Globals | Access via vim.g | `vim.g.mapleader` |

### Module Pattern

```lua
local M = {}

M.setup = function(opts)
  -- implementation
end

return M
```

### Comment Style

```lua
---  Section header with triple dash
---
-- Regular inline comment
```

### Variable Aliases

Common vim API aliases at file top:

```lua
local fn = vim.fn
local set = vim.opt
local autocmd = vim.api.nvim_create_autocmd
```

### Error Handling

Use pcall for potentially failing requires:

```lua
local ok, module = pcall(require, 'optional-module')
if not ok then return end
```

## Directory Structure

```
init.lua                 # Entry point (bootstraps lazy.nvim)
plugin/
  options.lua            # Global vim settings
  autocmd.lua            # Autocommands
lua/
  plugins/               # lazy.nvim plugin specs
    editor.lua           # which-key, file trees
    completion.lua       # blink.cmp, nvim-cmp
    treesitter.lua       # Syntax highlighting
    telescope.lua        # Fuzzy finding
    git.lua              # gitsigns, worktree
    lsp/init.lua         # LSP plugins
    ui/init.lua          # Statusline, notifications
    theme/               # Colorschemes
  configs/               # Plugin configuration implementations
  lsp/                   # LSP handlers and utilities
lsp/                     # Native LSP configs (lua_ls.lua, etc.)
after/lsp/               # Per-language LSP overrides
snippets/                # Custom snippets
```

## Common Tasks

### Add a Plugin

Edit or create file in `lua/plugins/` following lazy.nvim spec format with leading commas:

```lua
{
  'author/plugin-name'
  , lazy = true
  , event = 'VeryLazy'
  , opts = {}
}
```

Run `:Lazy sync` or restart Neovim.

### Configure an LSP

1. Add server to `ensure_installed` in `lua/plugins/lsp/init.lua`
2. Create `lsp/<server>.lua` or `after/lsp/<server>.lua` for custom config
3. Run `:LspRestart` or restart Neovim

### Add a Keymap

Edit `lua/configs/keys/init.lua` for which-key groups, or add `keys = {}` in plugin spec:

```lua
keys = {
  {
    '<leader>x', function()
      require 'plugin'.action()
    end, desc = 'description'
  }
}
```

## Linting Rules (selene.toml)

- Standard: `neovim`
- Allowed: `global_usage`, `multiple_statements`, `mixed_table`
- Excluded: `.archive/*`

## Key Bindings

- Leader key: Space (`vim.g.mapleader = ' '`)
- Check bindings: `<leader>?` (which-key buffer keymaps)
