local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
  	  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  	  ts_update()
    end,
  }
  use {
    -- 'nvim-telescope/telescope.nvim', tag = '0.1.1',
    'nvim-telescope/telescope.nvim', brach = '0.1.x',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'navarasu/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'mbbill/undotree'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-fugitive'
  use 'kg8m/vim-simple-align'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
                                             -- Autocompletion
      {'hrsh7th/nvim-cmp'},                  -- Required
      {'hrsh7th/cmp-nvim-lsp'},              -- Required
      {'hrsh7th/cmp-buffer'},                -- Optional
      {'hrsh7th/cmp-path'},                  -- Optional
      {'saadparwaiz1/cmp_luasnip'},          -- Optional
      {'hrsh7th/cmp-nvim-lua'},              -- Optional
                                             -- Snippets
      {'L3MON4D3/LuaSnip'},                  -- Required
      {'rafamadriz/friendly-snippets'},      -- Optional
    }
  }
  -- Debug Adapter Protocol
  use 'https://github.com/mfussenegger/nvim-dap'
  use 'https://github.com/rcarriga/nvim-dap-ui'
  use "jay-babu/mason-nvim-dap.nvim"
  -- Debugging
  --use 'nvim-lua/plenary.nvim'
  use {'mrcjkb/rustaceanvim', version = '^3', ft = { 'rust' }, }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
