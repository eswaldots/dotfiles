vim.o.number = true;

vim.g.mapleader = " "

vim.o.ignorecase = true
vim.opt.smartcase = true

-- THE BEST SETTING OF ALL THE CONFIG
vim.o.swapfile = false

vim.o.relativenumber = true;

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })

vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.diagnostic.config({
  virtual_text = {
    severity_limit = vim.diagnostic.severity.ALL,
  },
  float = {
    border = "rounded",
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.pack.add({
	'https://github.com/vague-theme/vague.nvim',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/ibhagwan/fzf-lua',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/stevearc/conform.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	{src = 'https://github.com/saghen/blink.cmp'},
{ src = "https://github.com/ThePrimeagen/harpoon",    version = "harpoon2" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	'https://github.com/wakatime/vim-wakatime',
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
		version = vim.version.range "*", -- use latest release, remove to use latest commit
	},
	'https://github.com/smjonas/inc-rename.nvim',
	'https://github.com/andweeb/presence.nvim'
	-- 'https://github.com/folke/trouble.nvim'
})

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})
local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
