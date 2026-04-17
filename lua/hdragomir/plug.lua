local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('folke/tokyonight.nvim')

Plug('elixir-editors/vim-elixir')
Plug('rescript-lang/vim-rescript')

Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')

Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })
Plug('junegunn/fzf.vim')
Plug('mbbill/undotree')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('tpope/vim-fugitive')
Plug('https://tpope.io/vim/surround.git')

Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x'})
Plug('moll/vim-bbye')
Plug('lewis6991/gitsigns.nvim', { ['do'] = function()
  require('gitsigns').setup()
end })

Plug('autozimu/LanguageClient-neovim', {
  ['branch'] = 'next',
  ['do'] = "bash install.sh",
})

Plug('numToStr/Comment.nvim', { ['do'] = function()
  require('Comment').setup()
end })

Plug('Shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })

vim.call('plug#end')

