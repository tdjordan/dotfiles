local cmd    = vim.cmd

-- New <leader> of the band
cmd [[
  nnoremap <space> <nop>
  vnoremap <space> <nop>
]]

vim.g.mapleader = ' '

---  local mappings
---
local ku = require 'keymap.utility'
local nnoremap = ku.nnoremap
local inoremap = ku.inoremap
local vnoremap = ku.vnoremap
local tnoremap = ku.tnoremap

---
---  noremap bindings
---

-- Reload init.lua from standard config path
-- note that the stdpath makes this portable
-- nnoremap( '<leader><cr>', '<cmd>luafile ~/.config/nvim/init.lua<cr>' )

---
---  p* mappings
---
-- nnoremap( '<leader>pf', "<cmd>lua require('telescope.builtin').find_files()<cr>" )
-- nnoremap( '<leader>pg', "<cmd>lua require('telescope.builtin').live_grep()<cr>" )
-- nnoremap( '<leader>pl', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" )
-- nnoremap( '<leader>ps', "<cmd>lua require('telescope.builtin').live_grep()<cr>" )
-- nnoremap( 'leader>pw :Rg', "c-r>=expand("<cword>")<cr><cr>" )
-- nnoremap( '<leader>pw', "<cmd>lua require('telescope.builtin').grep_string()<cr>" )
-- nnoremap( '<leader>pc', "<cmd>lua require('telescope.builtin').colorscheme()<cr>" )
-- nnoremap( '<leader>pv', "<cmd>lua require('telescope.builtin').vim_options()<cr>" )
-- nnoremap( '<leader>pa', "<cmd>lua require('telescope.builtin').autocommands()<cr>" )

-- nnoremap( '<leader><c-p>', "<cmd>lua require('telescope.builtin').git_files()<cr>" )

---
---  f* mappings
---
-- nnoremap( '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>' )
-- nnoremap( '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>' )
-- nnoremap( '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>' )
-- nnoremap( '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>' )
-- nnoremap( '<leader>ft', '<cmd>lua require("telescope.builtin").filetypes()<cr>' )
-- nnoremap( '<leader>fr', '<cmd>lua require("telescope.builtin").reloader()<cr>' )
-- nnoremap( '<leader>fm', '<cmd>lua require("telescope.builtin").man_pages()<cr>' )
-- nnoremap( '<leader>fq', '<cmd>lua require("telescope.builtin").quickfix()<cr>' )
-- nnoremap( '<leader>fo', '<cmd>lua require("telescope.builtin").oldfiles()<cr>' )
-- nnoremap( '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>' )
-- nnoremap( '<leader>fd', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>' )
-- nnoremap( '<leader>fi', '<cmd>lua require("telescope.builtin").builtin()<cr>' )
-- nnoremap( '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>' )
-- nnoremap( '<leader>fl', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>' )

---
---  g* mappings
---

---  resize operations
---
-- nnoremap( '<leader>-', '<cmd>:resize -5<cr>' )
-- nnoremap( '<leader>=', '<cmd>:resize +5<cr>' )
-- nnoremap( [[<leader>\]], '<cmd>:vertical resize -5<cr>' )
-- nnoremap( '<leader>q', '<cmd>:vertical resize +5<cr>' )

---
---  u* mappings
---
-- nnoremap( '<leader>u', '<cmd>UndotreeToggle<cr>' )

---  Comment Handling
---
nnoremap( '<C-_>', '<plug>NERDCommenterToggle' )
vnoremap( '<C-_>', '<plug>NERDCommenterToggle' )

---  File Browser
---
-- nnoremap( '<leader>k', '<cmd>NERDTreeToggle<cr>' )

---  Window Navigation
---
---  navigate cursor to adjoining window
---
-- terminal mode
tnoremap( '<Esc>', [[<C-\><C-n>]] )
tnoremap( '<C-h>', [[<C-\><C-n><C-w>h]] )
tnoremap( '<C-j>', [[<C-\><C-n><C-w>j]] )
tnoremap( '<C-k>', [[<C-\><C-n><C-w>k]] )
tnoremap( '<C-l>', [[<C-\><C-n><C-w>l]] )
nnoremap( '<leader>t', ':split term://$SHELL<cr>' )
-- tnoremap( '', [[<c-\><c-n>:split term://$SHELL<cr>]] )
-- tnoremap( '<M-t>', [[<c-\><c-n>:split term://$SHELL<cr>]] )
tnoremap( '<A-t>', [[<c-\><c-n>:split term://$SHELL<cr>]] )
--  augroup terminal_settings
--    autocmd!
cmd [[ autocmd BufWinEnter,WinEnter,TermEnter term://* setlocal nonumber norelativenumber ]]
cmd [[ autocmd BufWinEnter,WinEnter,TermEnter term://* startinsert                        ]]
cmd [[ autocmd BufLeave                       term://* stopinsert                         ]]
cmd [[ autocmd TermClose                      term://* call nvim_input('<cr>')            ]]
--    autocmd BufWinEnter,WinEnter,TermEnter term://* startinsert
--    autocmd BufLeave                       term://* stopinsert
--    autocmd TermClose                      term://*
--      \ if    (expand('<afile>') !~ "fzf")
--      \    && (expand('<afile>') !~ "ranger")
--      \    && (expand('<afile>') !~ "coc")    |
--      \   call nvim_input('<cr>') |
--      \ endif
--  augroup END
---  normal mode
-- nnoremap <C-h> <C-w>h
-- nnoremap <C-j> <C-w>j
-- nnoremap <C-k> <C-w>k
-- nnoremap <C-l> <C-w>l
nnoremap( '<c-h>', '<cmd>wincmd h<cr>' )
nnoremap( '<c-j>', '<cmd>wincmd j<cr>' )
nnoremap( '<c-k>', '<cmd>wincmd k<cr>' )
nnoremap( '<c-l>', '<cmd>wincmd l<cr>' )
---  insert mode
-- inoremap <C-h> <Esc><C-W>h
-- inoremap <C-j> <Esc><C-w>j
-- inoremap <C-k> <Esc><C-w>k
-- inoremap <C-l> <Esc><C-w>l
---
---  move window to <position> of other windows
---
---  normal mode
-- nnoremap <C-S-H> <C-W>H
-- nnoremap <C-S-J> <C-W>J
-- nnoremap <C-S-K> <C-W>K
-- nnoremap <C-S-L> <C-W>L
-- nnoremap <C-S-T> <C-W>T

---  Comments
---
-- keymap( "n", "<c-_>",      "<Plug>kommentary_line_default",   { } )
-- keymap( "v", "<c-_>",      "<Plug>kommentary_visual_default", { } )
-- keymap( "n", "<leader>cc", "<Plug>kommentary_line_default",   { } )
-- keymap( "n", "<leader>c",  "<Plug>kommentary_motion_default", { } )
-- keymap( "v", "<leader>c",  "<Plug>kommentary_visual_default", { } )

---  Escape
---
-- cmd [[ :imap jk <esc> ]]
inoremap( 'jk',    '<esc>' )
inoremap( 'kj',    '<esc>' )
inoremap( '<C-c>', '<esc>' )

cmd [[ autocmd BufWinEnter,WinEnter TelescopePrompt :iunremap jk ]]
cmd [[ autocmd BufWinLeave,WinLeave TelescopePrompt :inoremap jk <esc> ]]

---  When opening a file, return to last edit postion
---
cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif
]]
