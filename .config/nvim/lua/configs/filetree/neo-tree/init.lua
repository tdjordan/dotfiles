require 'neo-tree'.setup {
  sources = {
    'filesystem'
    , 'buffers'
    , 'git_status'
    , 'diagnostics'
  }
  , close_if_last_window = true
  , filesystem = {
    follow_current_file = true
    , group_empty_dirs = true
  }
  -- default diagnostics definition
  -- , diagnostics = {
  --   renderers = {
  --     file = {
  --       { "indent" },
  --       { "icon" },
  --       { "grouped_path" },
  --       { "name" },
  --       { "diagnostic_count", show_when_none = true },
  --       { "split_diagnostic_counts", left_padding = 1 },
  --       { "clipboard" },
  --     },
  --     diagnostic = {
  --       { "indent" },
  --       { "icon" },
  --       { "name" },
  --       { "source" },
  --       { "code" },
  --       { "position" },
  --     },
  --   }
  -- }
  -- , diagnostics = {
  --   components = {
  --     linenr = function(config, node)
  --       local lnum = tostring(node.extra.diag_struct.lnum + 1)
  --       local pad = string.rep(" ", 4 - #lnum)
  --       return {
  --         {
  --           text = pad .. lnum,
  --           highlight = "LineNr",
  --         },
  --         {
  --           text = "▕ ",
  --           highlight = "NeoTreeDimText",
  --         }
  --       }
  --     end
  --   },
  --   renderers = {
  --     file = {
  --       { "indent" },
  --       { "icon" },
  --       { "grouped_path" },
  --       { "name", highlight = "NeoTreeFileNameOpened" },
  --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Error", right_padding = 0 },
  --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Warn", right_padding = 0 },
  --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Info", right_padding = 0 },
  --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Hint", right_padding = 0 },
  --       { "clipboard" },
  --     },
  --     diagnostic = {
  --       { "indent" },
  --       { "icon" },
  --       { "linenr" },
  --       { "name" },
  --     },
  --   },
  -- },
}
