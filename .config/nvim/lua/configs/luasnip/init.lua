local ls = require 'luasnip'

---  Snippet Chain Functions
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require 'luasnip.extras'.lambda
-- local rep = require 'luasnip.extras'.rep
-- local p = require 'luasnip.extras'.partial
-- local m = require 'luasnip.extras'.match
-- local n = require 'luasnip.extras'.nonempty
-- local dl = require 'luasnip.extras'.dynamic_lambda
-- local fmt = require 'luasnip.extras.fmt'.fmt
-- local fmta = require 'luasnip.extras.fmt'.fmta
local types = require 'luasnip.util.types'
-- local conds  = require 'luasnip.extras.conditions'

ls.config.set_config {
  --  This tells LuaSnip to remember to keep around the last snippet.
  --  You can jump back into it even if you move outside of the selection.
  history = true,

  --  If you have dynamic snippets, it updates as you type.
  update_events = "TextChanged,TextChangedI",

  --  Snippets are not automatically removed if their text is deleted.
  --
  --    `delete_check_events`
  --      determines on which events (:h events),
  --      a check for deleted snippets is performed.
  --
  --    This can be especially useful when `history` is enabled.
  delete_check_events = "TextChanged",

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{"●", "TSBoolean"}}
      }
    },
    [types.insertNode] = {
      active = {
        virt_text = {{"●", "TSString"}}
      }
    }
  },

  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 300,

  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = true,

  -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
  -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
  store_selection_keys = "<Tab>",

  -- luasnip uses this function to get the currently active filetype. This
  -- is the (rather uninteresting) default, but it's possible to use
  -- eg. treesitter for getting the current filetype by setting ft_func to
  -- require("luasnip.extras.filetype_functions").from_cursor (requires
  -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
  -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
  -- ft_func = function()
  --  return vim.split(vim.bo.filetype, ".", true)
  -- end,
}

local copy = function(args)
  return args[1]
end

-- complicated function for dynamicNode.
local function jdocsnip(args, _, old_state)
  local nodes = {
    t({ "/**", " * " }),
    i(1, "A short Description"),
    t({ "", "" }),
  }

  -- These will be merged with the snippet; that way, should the snippet be updated,
  -- some user input eg. text can be referred to in the new snippet.
  local param_nodes = {}

  if old_state then
    nodes[2] = i(1, old_state.descr:get_text())
  end
  param_nodes.descr = nodes[2]

  -- At least one param.
  if string.find(args[2][1], ", ") then
    vim.list_extend(nodes, { t({ " * ", "" }) })
  end

  local insert = 2
  for _, arg in ipairs(vim.split(args[2][1], ", ", true)) do
    -- Get actual name parameter.
    arg = vim.split(arg, " ", true)[2]
    if arg then
      local inode
      -- if there was some text in this parameter, use it as static_text for this new snippet.
      if old_state and old_state[arg] then
        inode = i(insert, old_state["arg" .. arg]:get_text())
      else
        inode = i(insert)
      end
      vim.list_extend(
        nodes,
        { t({ " * @param " .. arg .. " " }), inode, t({ "", "" }) }
      )
      param_nodes["arg" .. arg] = inode

      insert = insert + 1
    end
  end

  if args[1][1] ~= "void" then
    local inode
    if old_state and old_state.ret then
      inode = i(insert, old_state.ret:get_text())
    else
      inode = i(insert)
    end

    vim.list_extend(
      nodes,
      { t({ " * ", " * @return " }), inode, t({ "", "" }) }
    )
    param_nodes.ret = inode
    insert = insert + 1
  end

  if vim.tbl_count(args[3]) ~= 1 then
    local exc = string.gsub(args[3][2], " throws ", "")
    local ins
    if old_state and old_state.ex then
      ins = i(insert, old_state.ex:get_text())
    else
      ins = i(insert)
    end
    vim.list_extend(
      nodes,
      { t({ " * ", " * @throws " .. exc .. " " }), ins, t({ "", "" }) }
    )
    param_nodes.ex = ins
    insert = insert + 1
  end

  vim.list_extend(nodes, { t({ " */" }) })

  local snip = sn(nil, nodes)
  -- Error on attempting overwrite.
  snip.old_state = param_nodes
  return snip
end

---  Some Snippets
-- ls.add_snippets( 'all',
--   {
--     -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
--     s("fn", {
--       -- Simple static text.
--       t("//Parameters: "),
--       -- function, first parameter is the function, second the Placeholders
--       -- whose text it gets as input.
--       f(copy, 2),
--       t({ "", "function " }),
--       -- Placeholder/Insert.
--       i(1),
--       t("("),
--       -- Placeholder with initial text.
--       i(2, "int foo"),
--       -- Linebreak
--       t({ ") {", "\t" }),
--       -- Last Placeholder, exit Point of the snippet.
--       i(0),
--       t({ "", "}" }),
--     }),
--   }, {
--     key = 'all'
--   }
-- )
-- ls.add_snippets("all", {
-- s("ternary", {
--     -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
--     i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
--   })
-- })
-- ls.add_snippets( 'all', {
--   s('fnn', {
--     --  Simple static text
--     t '-- Parameters: ',
--     --  function, first parameter is the function, second the Placeholders
--     --  whose text it gets as input.
--     f( copy, 2 ),
--     t { "", 'function ' },
--     --  Placeholder / Isert
--     i( 1 ),
--     t '(',
--     --  Placeholder with initial teext.
--     i( 2, 'int foo' ),
--     --  Linebreak
--     t { ') {', "\t" },
--     --  Last Plavceholder, exit Point of the snippet.
--     --  EVERY 'outer' SNIPPET NEEDS Placeholder 0
--     i( 0 ),
--     t { '', '}' }
--   })
-- })
ls.snippets = {
  lua = {
    s("fnn", {
      --  Simple static text
      t '-- Parameters: ',
      --  function, first parameter is the function, second the Placeholders
      --  whose text it gets as input.
      f( copy, 2 ),
      t { "", 'function ' },
      --  Placeholder / Isert
      i( 1 ),
      t '(',
      --  Placeholder with initial teext.
      i( 2, 'int foo' ),
      --  Linebreak
      t { ') {', "\t" },
      --  Last Plavceholder, exit Point of the snippet.
      --  EVERY 'outer' SNIPPET NEEDS Placeholder 0
      i( 0 ),
      t { '', '}' }
    })
  },
  java = {
    -- Very long example for a java class.
    s("fn", {
      d(6, jdocsnip, { 2, 4, 5 }),
      t({ "", "" }),
      c(1, {
        t("public "),
        t("private "),
      }),
      c(2, {
        t("void"),
        t("String"),
        t("char"),
        t("int"),
        t("double"),
        t("boolean"),
        i(nil, ""),
      }),
      t(" "),
      i(3, "myFunc"),
      t("("),
      i(4),
      t(")"),
      c(5, {
        t(""),
        sn(nil, {
          t({ "", " throws " }),
          i(1),
        }),
      }),
      t({ " {", "\t" }),
      i(0),
      t({ "", "}" }),
    }),
  },
}

require 'luasnip.loaders.from_vscode'.lazy_load()
-- require 'luasnip.loaders.from_snipmate'.lazy_load()
-- require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets" } })

-- require 'luasnip.loaders.from_lua'.load({ paths = "~/.config/nvim/snippets" })
