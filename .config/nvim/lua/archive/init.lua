----------
---
---  Plugins
---
----------

---  Install all the plugins
---
return {
  {
    ---  Filetype Identification Replacement
    ---
    -- {
    --   'nathom/filetype.nvim'
    --   , config = function()
    --     require 'configs.filetype'
    --   end
    -- },

    ---  lua performance
    ---
    -- {
    --   'lewis6991/impatient.nvim'
    --   -- , config = function()
    --   --   require 'impatient'.enable_profile()
    --   --   -- require 'impatient'
    --   -- end
    --   , config = function()
    --     vim.schedule(function()
    --       require 'impatient'.enable_profile()
    --     end)
    --     -- require 'impatient'
    --   end
    -- },

    -- {
    --   'antoinemadec/FixCursorHold.nvim'
    -- },

    -- {
    --   'fgheng/winbar.nvim'
    -- },

    ---  Browser Integration
    ---
    -- {
    --   'glacambre/firenvim'
    --   , build = function()
    --     vim.fn['firenvim#install'](0)
    --   end
    --   , config = function()
    --     require 'configs.firenvim'
    --   end
    -- },

    ---  Notifications
    ---
    -- {
    --   'rcarriga/nvim-notify'
    --   -- , event = 'CursorHold'
    --   -- , event = 'BufReadPost'
    --   , config = function()
    --     require 'configs.notifications.notify'
    --   end
    -- },
    -- {
    --   'vigoux/notifier.nvim'
    --   , config = function()
    --     require 'configs.notifications.notifier'
    --   end
    -- },
    -- {
    --   'j-hui/fidget.nvim'
    --   , config = function()
    --     require 'configs.notifications.fidget'
    --   end
    -- },
    -- {
    --   ---@diagnostic disable-next-line: spell-check
    --   'folke/noice.nvim'
    --   , event = 'CursorHold'
    --   , config = function()
    --     require 'configs.notifications.noice'
    --   end
    -- },

    -- {
    --   'lvimuser/lsp-inlayhints.nvim'
    --   , config = function()
    --     require 'configs.lsp.inlay'
    --   end
    -- },

    ---  Lua Information
    ---
    -- {
    --   'nanotee/nvim-lua-guide'
    --   , lazy = true
    -- },

    -- {
    --   'williamboman/nvim-lsp-installer'
    --   , event = 'CursorHold'
    --   , config = function()
    --     require 'configs.lsp.installer'
    --   end
    -- },
    -- {
    --   "b0o/incline.nvim",
    --   event = "CursorHold",
    --   enabled = false,
    --   config = function()
    --     -- local function get_diagnostic_label(props)
    --     --   local icons = { error = '', warn = '', info = '', hint = '󰌵', }
    --     --   local label = {}
    --     --
    --     --   for severity, icon in pairs(icons) do
    --     --     local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    --     --     if n > 0 then
    --     --       table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
    --     --     end
    --     --   end
    --     --   if #label > 0 then
    --     --     table.insert(label, {'| '})
    --     --   end
    --     --   return label
    --     -- end
    --     --
    --     -- -- local function get_git_diff(props)
    --     -- --   local icons = { removed = "", changed = "", added = "" }
    --     -- --   local labels = {}
    --     -- --   vim.notify('hello')
    --     -- --   vim.notify(vim.api.vim_bug_get_var(props.buf, "gitsigns"))
    --     -- --   local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
    --     -- --   if #signs < 1 then
    --     -- --     return {{''}}
    --     -- --   end
    --     -- --   -- local signs = vim.b.gitsigns_status_dict
    --     -- --   for name, icon in pairs(icons) do
    --     -- --     if tonumber(signs[name]) and signs[name] > 0 then
    --     -- --       table.insert(labels, { icon .. " " .. signs[name] .. " ",
    --     -- --         group = "Diff" .. name
    --     -- --       })
    --     -- --     end
    --     -- --   end
    --     -- --   if #labels > 0 then
    --     -- --     table.insert(labels, { '| ' })
    --     -- --   end
    --     -- --   return labels
    --     -- -- end
    --     --
    --     -- local colors = require("tokyonight.colors").setup()
    --     -- require('incline').setup({
    --     --   -- highlight = {
    --     --   --   groups = {
    --     --   --     InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
    --     --   --     InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
    --     --   --   },
    --     --   -- },
    --     --   window = { margin = { vertical = 0, horizontal = 1 } },
    --     --   render = function(props)
    --     --     local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':.')
    --     --     local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
    --     --     local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"
    --     --
    --     --     local buffer = {
    --     --       { get_diagnostic_label(props) },
    --     --       -- { get_git_diff(props) },
    --     --       { ft_icon, guifg = ft_color }, { " " },
    --     --       { filename, gui = modified },
    --     --     }
    --     --     return buffer
    --     --   end
    --     -- })
    --     -- local colors = require("tokyonight.colors").setup()
    --     -- local colors = require 'material.colors'
    --     require("incline").setup({
    --       -- highlight = {
    --       --   groups = {
    --       --     -- InclineNormal   = { guibg = "#FC56B1", guifg = colors.main.black },
    --       --     -- InclineNormal   = { guibg = colors.main.darkpurple, guifg = colors.main.black },
    --       --     -- InclineNormal   = { guifg = colors.main.darkpurple, guibg = colors.main.black },
    --       --     InclineNormal   = { guifg = colors.main.darkpurple, guibg = colors.editor.contrast },
    --       --     InclineNormalNC = { guifg = colors.main.darkpurple, guibg = colors.editor.bg },
    --       --     -- InclineNormalNC = { guifg = "#FC56B1", guibg = colors.editor.bg },
    --       --   },
    --       -- },
    --       window = { margin = { vertical = 0, horizontal = 1 } },
    --       render = function(props)
    --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
    --         local icon, color = require("nvim-web-devicons").get_icon_color(filename)
    --         return { { icon, guifg = color }, { " " }, { filename } }
    --       end,
    --     })
    --   end,
    -- },

    ---  LSP Extensions
    ---
    -- {
    --   'glepnir/lspsaga.nvim'
    --   , config = function()
    --     require 'configs.lsp.saga'
    --   end
    -- }

    ---  Is this now just built in?
    ---
    -- ,   'tjdevries/nlua.nvim'

    ---  diagnostics
    ---
    -- {
    --   'onsails/diaglist.nvim'
    --   , config = function()
    --     require 'configs.lsp.diaglist'
    --   end
    -- },

    ---  TODO : Add keymapping
    ---
    -- {
    --   'ahmedkhalf/project.nvim'
    --   , config = function()
    --     require 'project_nvim'.setup {}
    --   end
    -- },

    ---  TODO : Add keymapping
    ---
    -- {
    --   'camgraff/telescope-tmux.nvim'
    --   , cmd = 'Telescope tmux'
    --   , event = 'CursorHold'
    -- },

    ---  TODO : Add keymapping
    ---

    -- { 'nvim-treesitter/completion-treesitter' },
    -- {
    --   'nvim-treesitter/nvim-treesitter-refactor'
    --   -- , event = 'CursorHold'
    --   -- , dependencies = {
    --   , keys = 'grr'
    --   --   'nvim-treesitter/nvim-treesitter'
    --   -- }
    -- },
    -- {
    --   'nvim-treesitter/nvim-treesitter-textobjects'
    --   -- , event = 'CursorHold'
    -- },
    -- {
    --   'theHamsta/nvim-treesitter-pairs'
    --   , event = 'CursorHold'
    -- },
    -- {
    --   'David-Kunz/treesitter-unit'
    --   -- , event = 'CursorHold'
    -- },
    -- { 'nvim-treesitter/nvim-treesitter-context' },
    -- {
    --   'p00f/nvim-ts-rainbow'
    --   , enabled = false
    --   , config = function()
    --     require 'configs.treesitter.rainbow'
    --   end
    -- },

    ---  history
    ---
    -- { 'mbbill/undotree' },

    ---  terminals
    ---
    -- { 'voldikss/vim-floaterm' },
    -- { 'norcalli/nvim-terminal.lua' },

    ---  debugger
    ---
    -- { 'puremourning/vimspector' },
    -- { 'critiqjo/lldb.nvim' },
    -- {
    --   'Pocco81/DAPInstall.nvim'
    --   , config = function ()
    --     require 'configs.dap.install'
    --   end
    -- },

    ---  matchup
    ---
    -- { 'andymass/vim-matchup' },
    -- { 'jkramer/vim-checkbox' },

    ---  search
    ---
    -- { 'rking/ag.vim' },
    -- {
    --   'junegunn/fzf',
    --   build = 'fzf#install()'
    -- },
    -- { 'junegunn/fzf.vim' },
    -- { 'stsewd/fzf-checkout.vim' },
    -- { 'junegunn/fzf',
    --  \ { 'dir': '~/.fzf', 'do': './install --all' }
    -- , { 'lotabout/skim' } --, { 'dir': '~/.skim', 'do': './install -all' },
    -- { 'wsdjeg/FlyGrep.vim' },
    -- {
    --   'vijaymarupudi/nvim-fzf'
    -- , config = function()
    --   local fzf = require('fzf')

    --   coroutine.wrap(function()
    --     local result = fzf.fzf({'choice 1', 'choice 2'})
    --     if result then
    --       print(result[1])
    --     end
    --   end)()
    -- end
    -- },

    ---  themes
    ---
    -- { 'flazz/vim-colorschemes' },
    -- { 'morhetz/gruvbox' },
    -- { 'gruvbox-community/gruvbox' },

    -- {
    --   'sainnhe/gruvbox-material'
    --   -- , event = 'ColorSchemePre'
    --   , init = function()
    --     local g = vim.g
    --     g.gruvbox_material_better_performance          = 1         -- default: 0 ( off )

    --     g.gruvbox_material_background                  = 'hard'    -- default: 'medium'
    --     -- g.gruvbox_material_transparent_background    = 1           -- default: 0 ( off )
    --     g.gruvbox_material_visual                      = 'reverse' -- default: 'grey background'
    --     g.gruvbox_material_sign_column_background      = 'none'    -- default: 'default'
    --     g.gruvbox_material_diagnostic_line_highlight   = 1         -- default: 0 ( off )
    --     -- g.gruvbox_material_current_word              = 'bold'      -- default: 'grey background'
    --     -- g.gruvbox_material_statusline_style          = 'original'  -- default: 'default'
    --     g.gruvbox_material_lightline_disable_bold      = 1         -- default: 0 ( off )
    --     g.gruvbox_material_enable_italic               = 1         -- default: 1 ( on )
    --   end
    -- },

    -- {
    --   'RRethy/nvim-base16'
    --   , event = 'ColorSchemePre'
    -- },

    -- {
    --   'siduck76/nvim-base16.lua'
    --   , config = function()
    --     local base16 = require 'base16'
    --     base16(base16.themes('mountaineer'), true)
    --   end
    -- },

    -- {
    --   'eddyekofo94/gruvbox-material.nvim'
    --   -- , config = function ()
    --   --   require 'theme.gruvbox.material'
    --   -- end
    -- },

    -- {
    --   'eddyekofo94/gruvbox-flat.nvim'
    -- },

    -- {
    --   'monsonjeremy/onedark.nvim'
    -- },

    -- {
    --   'ii14/onedark.nvim'
    -- },

    -- {
    --   'NTBBloodbath/doom-one.nvim'
    --   , config = function()
    --     require 'theme.doom-one'
    --   end
    -- },

    ---
    ---  theme : Lush Colorschemes
    ---
    -- {
    --   'rktjmp/lush.nvim'
    -- },

    -- {
    --   'savq/melange'
    -- },

    -- {
    --   'kunzaatko/nord.nvim'
    --   , init = function()
    --     local g = vim.g
    --     g.italic = 1
    --     g.nord_italic_comments = 1
    --   end
    -- },
    ---
    ---  end section
    ---

    -- {
    --   'lambdalisue/glyph-palette.vim'
    -- end
    -- },
    -- {
    --   'vigoux/oak'
    -- },

    -- {
    --   'Shatur/neovim-ayu'
    --   , config = function()
    --     require 'theme.ayu'
    --   end
    -- },

    -- {
    --   'Luxed/ayu-vim'
    --   , config = function()
    --     require 'theme.ayu.setup'
    --   end
    -- },

    -- {
    --   'ayu-theme/ayu-vim'
    --   , init = function()
    --     local g = vim.g
    --     g.ayucolor = 'dark'
    --     -- g.ayucolor = 'mirage'
    --   end
    -- },

    -- {
    --   'LunarVim/darkplus.nvim'
    -- },

    ---
    ---  theme : status lines
    ---

    -- {
    --   'glepnir/galaxyline.nvim'
    --   , branch = 'main'
    --   , config = function()
    --     require 'my_statusline'
    --   end
    -- },

    -- {
    --   'windwp/windline.nvim'
    -- },

    -- {
    --   'nvim-lua/lsp-status.nvim'
    -- },

    -- {
    --   'famiu/feline.nvim'
    --   , config = function()
    --     require 'feline'.setup()
    --   end
    -- },

    --- :h nvim_tree_hightlight
    ---
    -- {
    --   'lambdalisue/glyph-palette.vim'
    --   , event = 'CursorHold'
    -- },
    -- {
    --   'yamatsum/nvim-nonicons'
    -- },
    -- { 'hardcoreplayers/spaceline.vim' },
    -- { 'glepnir/spaceline.vim' },
    -- { 'ryanoasis/vim-devicons' },
    -- { 'ryanoasis/nerd-fonts' },

    ---  language navigation
    ---
    -- { 'majutsushi/tagbar', { 'on': 'TagbarToggle' },
    --  'liuchengxu/vista.vim', { 'on' : 'Vista!!' },

    ---  editor configs
    ---
    -- { 'editorconfig/editorconfig-vim' },

    ---  convenience
    ---
    -- { 'benekastah/neomake' },
    -- { 'preservim/nerdcommenter' },
    -- {
    --   'b3nj5m1n/kommentary'
    --   , event = 'CursorHold'
    --   , init = function()
    --     local g = vim.g
    --     -- do not load the default kommentary mappings
    --     g.kommentary_create_default_mappings = false
    --   end
    --   , config = function()
    --     require 'configs.kommentary'
    --   end
    -- },

    ---  file trees
    ---
    -- { 'justinmk/vim-dirvish' },

    ---  version control systems
    ---
    -- { 'Xuyuanp/nerdtree-git-plugin' },
    -- { 'tpope/vim-fugitive' },
    -- { 'jlfwong/vim-mercenary' },
    -- {
    --   'ludovicchabant/vim-lawrencium',
    --   cmd = 'Hg'
    -- },
    -- { 'gregsexton/gitv' },
    -- { 'airblade/vim-gitgutter' },
    -- { 'mhinz/vim-signify' },

    -- {
    --   'sheerun/vim-polyglot'
    --   , config = function()
    --     require 'configs.polyglot'
    --   end
    -- },
    -- {
    --   'pearofducks/ansible-vim'
    --   , init = function()
    --     vim.g.ansible_extra_keywords_highlight = true
    --   end
    -- },
    -- { 'udalov/kotlin-vim' },
    -- { 'scrooloose/syntastic' },
    -- { 'w0rp/ale' },
    -- { 'prurigro/vim-polyglot-darkcloud' },
    -- { 'dleonard0/pony-vim-syntax' },
    -- { 'saltstack/salt-vim' },
    -- { 'fatih/vim-go' },
    -- { 'garyburd/go-explorer' },
    -- { 'glench/vim-jinja2-syntax' },
    -- { 'PProvost/vim-ps1' },
    -- { 'lambdatoast/elm.vim' },
    -- { 'ElmCast/elm-vim' },
    -- { 'google/vim-jsonnet' },
    -- { 'zinit-zsh/zinit-vim-syntax' },
    -- { 'numirias/semshi', {'do': ':UpdateRemoteuseins'},

    ---  annoyances
    ---
    -- {
    --   'ntpeters/vim-better-whitespace'
    --   , event = 'CursorHold'
    --   , config = function()
    --     require 'configs.whitespace.setup'
    --   end
    -- },

    ---  automation ?
    ---
    -- { 'tpope/vim-surround' },
    -- { 'terryma/vim-multiple-cursors' },
    -- { 'jszakmeister/vim-togglecursor' },
    -- { 'matze/vim-move' },
    -- {
    --   'max397574/better-escape.nvim'
    --   , event = 'InsertEnter'
    --   , config = function()
    --     require 'configs.tweaks.escape'
    --   end
    -- },
    -- { 'godlygeek/tabular' },

    ---  preview panels
    ---
    -- { 'atweiden/vim-uzbl' },
    -- { 'xu-cheng/brew.vim' },

    ---  service hooks
    ---
    -- { 'mrtazz/simplenote.vim' },


    -- {'lervag/vimtex', opt=true },

    ---  Zettelkasten
    ---
    -- {
    --   'megalithic/zk.nvim'
    -- },

    ---  Notes & Org Mode
    ---
    -- {
    --   'nvim-orgmode/orgmode.nvim'
    --   , lazy = true
    --   , ft = 'org'
    --   -- , dependencies = {
    --   --   'milisims/tree-sitter-org'
    --   --   , 'akinsho/org-bullets.nvim'
    --   -- }
    --   , config = function()
    --     require 'configs.orgmode'
    --   end
    -- },
    -- {
    --   'milisims/tree-sitter-org'
    --   , config = function()
    --     require 'configs.treesitter.parsers.org'
    --   end
    -- },
    -- {
    --   'akinsho/org-bullets.nvim'
    --   , config = function()
    --     require('org-bullets').setup {
    --       symbols = { '◉', '○', '✸', '✿' }
    --     }
    --   end
    -- },

  }
}
