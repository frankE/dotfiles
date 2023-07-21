require("frank.packer")
require("frank.set")
require("frank.remap")

-- colorscheme
function ColorWithTransparentBG(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

ColorWithTransparentBG()

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- lsp-zero
local lsp = require('lsp-zero').preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    'intelephense',
})

-- lsp.skip_server_setup({'rust_analyzer'})
-- pass arguments to a language server
-- see :help lsp-zero.configure()
lsp.skip_server_setup({'intelephense'})
--lsp.skip_server_setup({'phpactor'})
lsp.configure('intelephense', {
  on_attach = function(client, bufnr)
  end,
  settings = {
      intelephense = {
          files = {
              maxSize = 1024 * 200
          },
          environment = {
              phpVersion = "7.4.0",
              includePaths = {
                  "/home/frank/src/sepia/sbs3/"
              }
          }
      }
  }
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace({
    library = vim.api.nvim_get_runtime_file('', true)
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- lualine (Statusline)
require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'onedark',
		-- component_separators = '|',
		-- section_separators = '',
	},
}

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
--vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fr',  function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Treesitter 
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help", "rust", "php", "javascript", "typescript", "html", "css" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 200 * 1024 -- 200 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- indent-blank blank line
require('indent_blankline').setup {
    -- show_trailing_blankline_indent = false,
}

--local lspconfig = require 'lspconfig'
--local configs = require 'lspconfig.configs'

-- Manual add rust_hdl server
--if not configs.rust_hdl then
--  configs.rust_hdl = {
--    default_config = {
--      cmd = {'vhdl_ls'},
--      filetypes = { "vhdl", 'vhd' },
--      root_dir = lspconfig.util.root_pattern(unpack({'vhdl_ls.toml','.vhdl_ls.toml'})),
--      single_file_support = true,
--      settings = {};
--    },
--  }
--end
--require('Comment').setup()
require'lspconfig'.vhdl_ls.setup{}

