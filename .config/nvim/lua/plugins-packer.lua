----------
---
---  Plugins
---
----------

local cmd    = vim.cmd
local fn     = vim.fn
local input  = fn.input
local system = fn.system

---   packer.vim : config section
local packer_exists = pcall( cmd, [[packadd packer.nvim]] )

if not packer_exists then
  if input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    fn.stdpath('data')
  )

  fn.mkdir(directory, 'p')

  local out = system(string.format(
      'git clone %s %s',
      'https://github.com/wbthomason/packer.nvim',
      directory .. '/packer.nvim'
    )
  )

  print(out)
  print('Downloading packer.nvim...')

  return
end

--vim._update_package_paths()

return require 'packer'.startup(function(use)
  ---  Packer itself
  ---
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  ---  Language Protocol Server - LSP
  ---
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }
  use { 'nvim-lua/lsp_extensions.nvim' }

  ---  tree sitter
  ---
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate'
  }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/completion-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'romgrk/nvim-treesitter-context' }

  ---  Telescope
  ---
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim'
      , 'nvim-lua/plenary.nvim'
    }
  }

  ---  history
  ---
  use { 'mbbill/undotree' }

  ---  terminals
  ---
  use { 'voldikss/vim-floaterm' }
  --use { 'norcalli/nvim-terminal.lua' }

  ---  debugger
  ---
  use { 'puremourning/vimspector' }
  --use { 'critiqjo/lldb.nvim' }

  ---  matchup
  ---
  --use { 'andymass/vim-matchup' }
  use { 'jkramer/vim-checkbox' }

  ---  snippets
  ---
  use { 'Shougo/neosnippet' }
  use { 'Shougo/neosnippet-snippets' }
  use { 'honza/vim-snippets' }
  --use { 'SirVer/ultisnips' }
  --use { 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }

  ---  search
  ---
  --use { 'rking/ag.vim' }
  use {
    'junegunn/fzf',
    run = 'fzf#install()'
  }
  use { 'junegunn/fzf.vim' }
  use { 'stsewd/fzf-checkout.vim' }
  --use { 'junegunn/fzf',
  --  \ { 'dir': '~/.fzf', 'do': './install --all' }
  use { 'lotabout/skim' } --, { 'dir': '~/.skim', 'do': './install -all' }
  --use { 'wsdjeg/FlyGrep.vim' }

  ---  themes
  ---
  use { 'flazz/vim-colorschemes' }
  --use { 'morhetz/gruvbox' }
  --use { 'gruvbox-community/gruvbox' }
  use { 'sainnhe/gruvbox-material' }
  use { 'vim-airline/vim-airline' }
  --use { 'vim-airline/vim-airline-themes' }
  --use { 'itchyny/lightline.vim' }
  use { 'norcalli/nvim-colorizer.lua' }
  --use { 'fatih/molokai' }
  --use { 'kyazdani42/nvim-tree.lua' }
  --use { 'hardcoreplayers/spaceline.vim' }
  --use { 'glepnir/spaceline.vim' }
  use { 'kyazdani42/nvim-web-devicons' }
  --use { 'ryanoasis/vim-devicons' }
  --use { 'ryanoasis/nerd-fonts' }

  ---  language navigation
  ---
  --use { 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  --use { 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

  ---  editor configs
  ---
  use { 'editorconfig/editorconfig-vim' }

  ---  convience
  ---
  --use { 'benekastah/neomake' }
  use { 'scrooloose/nerdcommenter' }

  ---  file trees
  use {
    'scrooloose/nerdtree',
    cmd = 'NERDTreeToggle'
  }
  --use { 'justinmk/vim-dirvish' }

  ---  version control systems
  ---
  use { 'Xuyuanp/nerdtree-git-plugin' }
  use { 'tpope/vim-fugitive' }
  --use { 'jlfwong/vim-mercenary' }
  use {
    'ludovicchabant/vim-lawrencium',
    cmd = 'Hg'
  }
  --use { 'gregsexton/gitv' }
  --use { 'airblade/vim-gitgutter' }
  use { 'mhinz/vim-signify' }

  ---  guides
  ---
  use { 'Yggdroot/indentLine' }
  use { 'nathanaelkane/vim-indent-guides' }

  ---  performance
  ---
  use { 'tweekmonster/startuptime.vim' }

  ---  braces
  ---
  --use { '9mm/vim-closer' }
  --use { 'jiangmiao/auto-pairs' }

  ---  language syntax
  ---
  --use { 'scrooloose/syntastic' }
  --use { 'w0rp/ale' }
  use { 'gisphm/vim-gradle' }
  --use { 'udalov/kotlin-vim' }
  use { 'sheerun/vim-polyglot' }
  --use { 'prurigro/vim-polyglot-darkcloud' }
  --use { 'dleonard0/pony-vim-syntax' }
  --use { 'saltstack/salt-vim' }
  --use { 'fatih/vim-go' }
  --use { 'garyburd/go-explorer' }
  use { 'pearofducks/ansible-vim' }
  --let g:ansible_extra_keywords_highlight = 1
  --use { 'glench/vim-jinja2-syntax' }
  use { 'PProvost/vim-ps1' }
  use { 'lambdatoast/elm.vim' }
  --use { 'ElmCast/elm-vim' }
  use { 'tmux-plugins/vim-tmux' }
  --use { 'google/vim-jsonnet' }
  --use { 'zinit-zsh/zinit-vim-syntax' }
  --use { 'numirias/semshi', {'do': ':UpdateRemoteuseins'}

  ---  annoyances
  ---
  use {
    'ntpeters/vim-better-whitespace',
    --run = function()
      --vim.g.strip_whitespace_on_save = true
      --vim.g.strip_whitespace_confirm = false
    --end
    --config = 'vim.g.strip_whitespace_on_save = 1'
  }

  ---  automation ?
  ---
  use { 'tpope/vim-surround' }
  use { 'terryma/vim-multiple-cursors' }
  --use { 'jszakmeister/vim-togglecursor' }
  use { 'matze/vim-move' }
  ---  Utility - Alignment
  use { 'junegunn/vim-easy-align' }
  --use { 'godlygeek/tabular' }

  ---  preview panels
  ---
  --use { 'atweiden/vim-uzbl' }
  use { 'xu-cheng/brew.vim' }

  ---  service hooks
  ---
  --use { 'mrtazz/simplenote.vim' }


  --use {'lervag/vimtex', opt=true }

end)

