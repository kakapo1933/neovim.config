-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- keymaps --
	keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
	keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
	keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
end

-- configure/enable gitsigns
gitsigns.setup({
	current_line_blame = true,
	on_attach = on_attach,
})
