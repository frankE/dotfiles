require("frank.packer")
require("frank.set")
require("frank.remap")

-- colorscheme
require('onedark').setup {
  colors = {
    green = "#eeeeee",
  },
  style = 'dark'
}
require('onedark').load()

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- lsp-zero

require("mason").setup()
require("mason-lspconfig").setup()

local lsp_zero = require('lsp-zero')

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = ''
})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  }
})

local lua_opts = lsp_zero.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)

require('mason-lspconfig').setup({
  ensure_installed = {'rust_analyzer'},
})

-- lsp_zero.nvim_workspace({
--     library = vim.api.nvim_get_runtime_file('', true)
-- })
-- 
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()
require('luasnip.loaders.from_vscode').lazy_load()
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

cmp.setup({
  formatting = cmp_format,
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- confirm completion item
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- toggle completion menu
    ['<C-e>'] = cmp_action.toggle_completion(),

    -- tab complete
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    -- navigate between snippet placeholder
    ['<C-d>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- scroll documentation window
    ['<C-f>'] = cmp.mapping.scroll_docs(-1),
    ['<C-d>'] = cmp.mapping.scroll_docs(1),
  }),
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
})

--
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
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fg',  function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Treesitter 
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "rust", "php", "javascript", "typescript", "html", "css" },

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

-- mason-nvim-dap
require("mason-nvim-dap").setup()
local dapui = require("dapui")
dapui.setup()

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- indent-blank blank line
require "ibl".setup({ scope = { show_start = false }})

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
local dap = require('dap')


-- the following settins assume you've installed the vscode-debug-php adapter using mason.nvim
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = {
    vim.loop.os_homedir() .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
  },
}
require("dap.ext.vscode").load_launchjs(vim.fn.getcwd() .. "/.nvim/launch.json", {})
-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '', -- adjust as needed, must be absolute path
--   name = 'lldb'
-- }
-- 
-- dap.configurations.rust = {
--   {
--     name = 'Launch',
--     type = 'lldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
-- 
--     -- 💀
--     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--     --
--     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     --
--     -- Otherwise you might get the following error:
--     --
--     --    Error on launch: Failed to attach to the target process
--     --
--     -- But you should be aware of the implications:
--     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--     -- runInTerminal = false,
--     initCommands = function()
--       -- Find out where to look for the pretty printer Python module
--       local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
-- 
--       local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
--       local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
-- 
--       local commands = {}
--       local file = io.open(commands_file, 'r')
--       if file then
--         for line in file:lines() do
--           table.insert(commands, line)
--         end
--         file:close()
--       end
--       table.insert(commands, 1, script_import)
-- 
--       return commands
--     end,
--     -- ...,
--   }
-- }

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

-- Start debugging session
--vim.keymap.set("n", "<leader>ds", ":RustLsp debuggables<CR>")
vim.keymap.set("n", "<leader>ds", function()
  vim.cmd("RustLsp debuggables")
  -- dapui.toggle({})
  --vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>dt", dapui.toggle)
vim.keymap.set("n", "<leader>k", dapui.eval)
vim.keymap.set("n", "<leader>dC", function()
  dap.clear_breakpoints()
  require("notify")("Breakpoints cleared", "warn")
end)
-- 
---- Close debugger and clear breakpoints
vim.keymap.set("n", "<leader>de", function()
  --dap.clear_breakpoints()
  -- dapui.toggle({})
  dap.terminate()
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
end)
