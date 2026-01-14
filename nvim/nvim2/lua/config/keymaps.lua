local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Terminal: Right side (vertical split)
keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal Right" })

-- Terminal: Bottom (horizontal split)
keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal Bottom" })

-- Terminal: Floating popup
keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating Terminal" })

-- Terminal: Full-width bottom
keymap.set("n", "<leader>tH", "<cmd>ToggleTerm size=100 direction=horizontal<cr>", { desc = "Max Terminal" })

keymap.set("n", "<leader>cp", "<cmd>Copilot toggle<cr>", { desc = "Toggle Copilot" })

-- Copy to system clipboard
keymap.set("v", "<C-c>", '"+y', { desc = "Copy selection" })
keymap.set("n", "<C-c>", 'gg"+yG', { desc = "Copy entire file" })

-- File explorer (non-conflicting)
keymap.set("n", "<leader>e", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<leader>E", ":NvimTreeToggle<Return>", opts)

-- Telescope
keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end)
keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end)
keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end)
keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end)

vim.keymap.set("n", "<leader>rr", function()
	-- Step 1: Get default word (under cursor)
	local default_find = vim.fn.expand("<cword>")
	if default_find == "" then
		default_find = ""
	end

	-- Step 2: Ask user for word to find
	local find_word = vim.fn.input("Find word: ", default_find)
	if find_word == "" then
		print("Cancelled")
		return
	end

	-- Step 3: Ask for replacement
	local replace_word = vim.fn.input("Replace '" .. find_word .. "' with: ")
	if replace_word == "" then
		print("No replacement given")
		return
	end

	-- Step 4: Escape special regex characters
	find_word = vim.fn.escape(find_word, "/")
	replace_word = vim.fn.escape(replace_word, "\\")

	-- Step 5: Perform global replace
	vim.cmd("%s/" .. find_word .. "/" .. replace_word .. "/g")
	print("Replaced all occurrences of '" .. find_word .. "' with '" .. replace_word .. "'")
end, { desc = "Replace Any Word in File" })
