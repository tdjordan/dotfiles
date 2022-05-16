local common = require 'lsp.common'

--  jsonls configuration
--
--      yarn global add vscode-langservers-extracted
--

-- local url_schemastore = 'https://json.schemastore.org/'
-- local url_gitcontents = 'https://raw.githubusercontent.com/'

-- local mapping_json_simple =
--   { 'packer.json'
--   , 'package.json'
--   , 'lerna.json'
--   , 'bsconfig.json'
--   , 'now.json'
--   , 'launchsettings.json'
--   , 'commands.json'
--   , 'feed.json'
-- }

-- local mapping_json_many = {
--   {
--     uri = 'prettierrc'
--     , files = {
--       '.prettierrc'
--       , 'prettierrc.json'
--       , 'prettier.config.json'
--     }
--   }
-- }

-- local mapping_git_files = {
--   {
--     uri = 'jsonresume/resume-chema/v1.9.9/schema.json'
--     , files = { '*.vsconfig' }
--   }
--   , {
--     uri = 'Kitware/CMake/master/Help/manual/presets/schema.json'
--     , files = {
--       'CMakePresets.json'
--       , 'CMakeUserPresets.json'
--     }
--   }
-- }

-- local aws_goformation = 'awslabs/goformation/v5.2.9/schema/'
-- local mapping_git_aws_files = {
--   {
--     uri = aws_goformation .. 'sam.schema.json'
--     , files = {
--       'serverless.template'
--       , '*.sam.json'
--       , 'sam.json'
--     }
--   }
--   , {
--     uri = aws_goformation .. 'cloudformation.schema.json'
--     , files = {
--       '*.cf.json'
--       , 'loudformationjson'
--     }
--   }
-- }

-- local schemas = {}

-- local expand_single_file_mappings = function(mappings, url)
--   for _, value in pairs(mappings) do
--     table.insert(schemas, {
--       fileMatch = { value },
--       url = url .. value
--     })
--   end
-- end

-- local expand_mappings = function(mappings, url_p)
--   for _, value in pairs(mappings) do
--     table.insert(schemas, {
--       fileMatch = value.files,
--       url = '' .. url_p .. value.uri
--     })
--   end
-- end

-- local expand_single_file_mappings = function(mappings, url)
--   for _, value in pairs(mappings) do
--     expand_mappings( { uri = url, files = value } )
--   end
-- end

-- local schemas = {
--   {
--     description = 'Packer template JSON configuration',
--     fileMatch = { 'packer.json' },
--     url = base_url .. 'packer.json'
--   },
--   {
--     fileMatch = { 'package.json' },
--     url = base_url .. 'package.json'
--   },
-- }

-- expand_single_file_mappings(mapping_json_simple, url_schemastore)
-- expand_mappings(mapping_json_many, url_schemastore)

-- expand_mappings(mapping_git_files, url_gitcontents)
-- expand_mappings(mapping_git_aws_files, url_gitcontents)

require 'lspconfig'.jsonls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
  , settings = {
    json = {
      schemas = require 'schemastore'.json.schemas()
    }
  }
  -- , commands = {
  --   Format = {
  --     function()
  --       vim.lsp.buf.range_formatting(
  --         {}
  --         , { 0, 0 }
  --         , { vim.fn.line('$'), 0 }
  --       )
  --     end
  --   }
  -- }
}
