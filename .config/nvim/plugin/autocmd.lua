-- local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup

---  When opening a file, return to last edit position
---
autocmd( 'BufReadPost' , {
  pattern = '*'
  , command = [[ if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif ]]
  , group = autogrp( 'LastEditPosition', { clear = true } )
})

---  Text Yank
---
autocmd( 'TextYankPost' , {
  pattern = '*'
  , callback = function()
    vim.hl.on_yank { timeout = 100 }
  end
  , group = autogrp( 'TextYank', { clear = true } )
})

---  Resize splits when the window is resized
---
autocmd( 'VimResized' , {
  pattern = '*'
  , command = [[ silent :wincmd = ]]
  , group = autogrp( 'WindowResizing', { clear = true } )
})

---  Always set TSComment to italic
---
autocmd( 'ColorScheme' , {
  pattern = '*'
  , command = [[ silent highlight TSComment gui=italic ]]
  , group = autogrp( 'ItalicComments', { clear = true } )
})

---  Toggle off side columns for certain sidebars
---
-- local sidebars_buffers = {
--   'nofile'
-- }
local sidebars = {
  'qf'
  , 'help'
  , 'query'
  , 'tsplayground'
  , 'lazy'
  , 'lazy_backdrop'
  , 'snacks_picker_list'
  -- , ''
}
local no_side_column = autogrp( 'NoSideColumn', { clear = true } )
autocmd( { 'BufWinEnter', 'WinEnter', 'WinLeave', 'BufNewFile', 'BufReadPost' }, {
  pattern = '*'
  , callback = function()
    -- if vim.tbl_contains(sidebars_buffers, vim.bo.buftype) then
    --   vim.opt.relativenumber = false
    --   vim.opt.number = false
    --   vim.opt.signcolumn = 'no'
    -- end
    if vim.tbl_contains(sidebars, vim.bo.filetype) then
      vim.opt.relativenumber = false
      vim.opt.number = false
      vim.opt.signcolumn = 'no'
    end
  end
  , group = no_side_column
})

---  Toggle relative line numbers for only active windows
---
local disabled_filetypes = {
  'gitcommit'
  , 'help'
  , 'man'
  , 'packer'
  , 'NvimTree'
  , 'Trouble'
  , 'trouble'
  , 'lazy'
  , 'lazy_backdrop'
  , 'DiffviewFileHistory'
  , 'DiffviewFiles'
  , 'neo-tree'
  , 'qf'
  , 'octo_panel'
  , 'query'
  , 'tsplayground'
  , 'git'
  , ''
  , 'Outline'
  , 'checkhealth'
  , 'snacks_picker_list'
}
autocmd( { 'WinEnter', 'BufWinEnter' }, {
  pattern = '*'
  , callback = function()
    -- vim.print( vim.bo.filetype )
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
      -- vim.print( vim.bo.filetype )
      -- vim.diagnostic.config( { virtual_lines = false } )
      -- require 'lsp_lines'.toggle()
      -- vim.print( vim.inspect(vim.diagnostic.config()) )
      return
    end
    vim.opt.relativenumber = true
  end
  , group = no_side_column
})
autocmd( 'WinLeave', {
  pattern = '*'
  , callback = function()
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
      -- vim.print( vim.bo.filetype )
      -- vim.print( vim.inspect(vim.diagnostic.config()) )
      -- vim.diagnostic.config( {
      --   virtual_lines = {
      --     only_current_line = true
      --   }
      -- } )
      -- vim.print( vim.inspect(vim.diagnostic.config()) )
      -- require 'lsp_lines'.toggle()
      return
    end
    vim.opt.relativenumber = false
  end
  , group = no_side_column
})

---  Enable spell checking for some filetypes
---
autocmd( { 'BufRead', 'BufNewFile' }, {
  pattern = {
    '*.txt',
    '*.md',
    '*.norg'
  }
  , callback = function()
    vim.opt.spell = true
    -- vim.opt.spelllang = 'en_us'
  end
  , group = autogrp( 'EnableSpellChecking', { clear = true } )
})

-- ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
-- local progress = vim.defaulttable()
-- vim.api.nvim_create_autocmd("LspProgress", {
--   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
--     if not client or type(value) ~= "table" then
--       return
--     end
--     local p = progress[client.id]
--
--     for i = 1, #p + 1 do
--       if i == #p + 1 or p[i].token == ev.data.params.token then
--         p[i] = {
--           token = ev.data.params.token,
--           msg = ("[%3d%%] %s%s"):format(
--             value.kind == "end" and 100 or value.percentage or 100,
--             value.title or "",
--             value.message and (" **%s**"):format(value.message) or ""
--           ),
--           done = value.kind == "end",
--         }
--         break
--       end
--     end
--
--     local msg = {} ---@type string[]
--     progress[client.id] = vim.tbl_filter(function(v)
--       return table.insert(msg, v.msg) or not v.done
--     end, p)
--
--     local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
--     vim.notify(table.concat(msg, "\n"), "info", {
--       id = "lsp_progress",
--       title = client.name,
--       opts = function(notif)
--         notif.icon = #progress[client.id] == 0 and " "
--           or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
--       end,
--     })
--   end,
-- })

-- vim.api.nvim_create_autocmd("LspProgress", {
--   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
--   callback = function(ev)
--     local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
--     vim.notify(vim.lsp.status(), "info", {
--       id = "lsp_progress",
--       title = "LSP Progress",
--       opts = function(notif)
--         notif.icon = ev.data.params.value.kind == "end" and " "
--           or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
--       end,
--     })
--   end,
-- })
