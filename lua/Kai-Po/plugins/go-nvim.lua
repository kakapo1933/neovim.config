local setup, go_nvim = pcall(require, "go")

if not setup then
	return
end

go_nvim.setup()

local go_format_setup, go_format = pcall(require, "go.format")

if not go_format_setup then
	return
end

go_format.goimport()

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})
