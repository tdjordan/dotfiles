local cmd    = vim.cmd
-- local api    = vim.api
-- local keymap = api.nvim_set_keymap

-- function nnoremap(key, command)
--   keymap('n', key, command, { noremap = true, silent = true })
-- end

-- nnoremap('<space>', '<nop>')

-- New <leader> of the band
cmd [[
  nnoremap <space> <nop>
  vnoremap <space> <nop>
  let g:mapleader=' '
]]

---
---  noremap bindings
---

-- Reload init.lua from standard config path
-- note that the stdpath makes this portable
cmd [[
  nnoremap <leader><cr> <cmd>luafile ~/.config/nvim/init.lua<cr>
]]

---
---  p* mappings
---
cmd [[
  nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>pg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>pl <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
  nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep()<cr>
  "nnoremap <leader>pw :Rg <c-r>=expand("<cword>")<cr><cr>
  nnoremap <leader>pw <cmd>lua require('telescope.builtin').grep_string()<cr>
  nnoremap <leader>pc <cmd>lua require('telescope.builtin').colorscheme()<cr>
  nnoremap <leader>pv <cmd>lua require('telescope.builtin').vim_options()<cr>
  nnoremap <leader>pa <cmd>lua require('telescope.builtin').autocommands()<cr>

  nnoremap <leader><c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
]]

---
---  f* mappings
---
cmd [[
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
  nnoremap <leader>ft <cmd>lua require('telescope.builtin').filetypes()<cr>
  nnoremap <leader>fr <cmd>lua require('telescope.builtin').reloader()<cr>
  nnoremap <leader>fm <cmd>lua require('telescope.builtin').man_pages()<cr>
  nnoremap <leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>
  nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
  nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
  nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>
  nnoremap <leader>fi <cmd>lua require('telescope.builtin').builtin()<cr>
  nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<cr>
  nnoremap <leader>fl <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
]]

---
---  g* mappings
---

---  resize operations
---
cmd [[
  nnoremap <silent><leader>- :resize -5<cr>
  nnoremap <silent><leader>= :resize +5<cr>
  nnoremap <silent><leader>\ :vertical resize -5<cr>
  nnoremap <silent><leader>q :vertical resize +5<cr>
]]

---
---  u* mappings
---
cmd [[
  nnoremap <leader>u :UndotreeToggle<cr>
]]

---  Comment Handling
---
cmd [[
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle
]]

---  File Browser
---
cmd [[
nnoremap <leader>k <cmd>NERDTreeToggle<cr>
]]

---  Window Navigation
---
---  navigate cursor to adjoining window
---
-- terminal mode
cmd [[
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <silent> <leader>t :split term://$SHELL<cr>
  tnoremap <silent> <leader>t <c-\><c-n>:split term://$SHELL<cr>
]]
--  augroup terminal_settings
--    autocmd!
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
cmd [[
  nnoremap <silent><c-h> <cmd>wincmd h<cr>
  nnoremap <silent><c-j> <cmd>wincmd j<cr>
  nnoremap <silent><c-k> <cmd>wincmd k<cr>
  nnoremap <silent><c-l> <cmd>wincmd l<cr>
]]
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
cmd [[
  inoremap jk    <esc>
  inoremap kj    <esc>
  inoremap <C-c> <esc>
]]
