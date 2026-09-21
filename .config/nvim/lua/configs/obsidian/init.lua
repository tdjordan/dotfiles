local workspaces = {
  {
    name = 'personal'
    , path = vim.fn.expand '~/.notes/obsidian/personal'
  }
  , {
    name = 'work'
    , path = vim.fn.expand '~/.notes/obsidian/work'
  }
}

local note_path_func = function(spec)
  local title = spec.title or spec.id
  local suffix = ''

  if title and title ~= '' then
    suffix = title
      :gsub(' ', '-')
      :gsub('[^A-Za-z0-9-]', '')
      :lower()
  else
    suffix = tostring(spec.id)
  end

  return suffix .. '.md'
end

return {
  workspaces = workspaces
  , notes_subdir = 'notes'
  , daily_notes = {
    folder = 'daily'
    , date_format = '%Y-%m-%d'
    , alias_format = '%B %-d, %Y'
    , default_tags = { 'daily-notes' }
    , template = 'daily.md'
  }
  , templates = {
    folder = 'templates'
    , date_format = '%Y-%m-%d'
    , time_format = '%H:%M'
    , substitutions = {}
  }
  , completion = {
    blink = true
    , min_chars = 2
  }
  , new_notes_location = 'notes_subdir'
  , preferred_link_style = 'wiki'
  , disable_frontmatter = false
  , note_path_func = note_path_func
  , note_id_func = function(title)
    if title and title ~= '' then
      return title
    end

    return tostring(os.time())
  end
  , wiki_link_func = function(opts)
    if opts.anchor ~= nil then
      return string.format('[[%s#%s|%s]]', opts.path, opts.anchor.text, opts.alias)
    elseif opts.alias ~= nil then
      return string.format('[[%s|%s]]', opts.path, opts.alias)
    else
      return string.format('[[%s]]', opts.path)
    end
  end
  , markdown_link_func = function(opts)
    return string.format('[%s](%s)', opts.alias, opts.path)
  end
  , picker = {
    name = 'telescope.nvim'
  }
  , ui = {
    enable = true
    , update_debounce = 200
    , checkboxes = {
      [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' }
      , ['x'] = { char = '', hl_group = 'ObsidianDone' }
      , ['>'] = { char = '', hl_group = 'ObsidianRightArrow' }
      , ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' }
      , ['!'] = { char = '', hl_group = 'ObsidianImportant' }
    }
    , bullets = { char = '•', hl_group = 'ObsidianBullet' }
    , external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' }
    , reference_text = { hl_group = 'ObsidianRefText' }
    , highlight_text = { hl_group = 'ObsidianHighlightText' }
    , tags = { hl_group = 'ObsidianTag' }
  }
  , attachments = {
    img_folder = 'assets/imgs'
  }
}
