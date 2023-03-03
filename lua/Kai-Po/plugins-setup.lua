local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- color shceme
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	use("Mofiqul/dracula.nvim")
	-- tmux & split window navigation
	-- switch window with C + H J K L
	use("christoomey/vim-tmux-navigator")

	-- Essential plugins
	-- Use ys+w+(",',()) to add surrounded
	-- Use ds+(",',()) to delete surrounded
	use("tpope/vim-surround")

	-- Commenting with gcc / gc(amount)j
	use("numToStr/comment.nvim")

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- Fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } })

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- Fromatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- Git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- Add indentation guides to all lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Go.nvim
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
