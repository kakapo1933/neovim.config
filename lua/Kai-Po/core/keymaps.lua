vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- telescope
-- BurntSushi/ripgrep is required for live_grep and grep_string and is the first priority for find_files.
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
