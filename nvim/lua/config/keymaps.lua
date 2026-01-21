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

-- File explorer with NvimTree (use <leader>e, not <leader>f)
keymap.set("n", "<leader>E", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<leader>e", ":NvimTreeToggle<Return>", opts)

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

-- Terminal
keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal Right" })
keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal Bottom" })
keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating Terminal" })
keymap.set("n", "<leader>tH", "<cmd>ToggleTerm size=100 direction=horizontal<cr>", { desc = "Max Terminal" })

-- Copilot
keymap.set("n", "<leader>cp", "<cmd>Copilot toggle<cr>", { desc = "Toggle Copilot" })

-- Clipboard
keymap.set("v", "<C-c>", '"+y', { desc = "Copy selection" })
keymap.set("n", "<C-c>", 'gg"+yG', { desc = "Copy entire file" })

-- Telescope
keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, opts)

keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, opts)

keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, opts)

-- Replace word
vim.keymap.set("n", "<leader>rr", function()
	local default_find = vim.fn.expand("<cword>")
	if default_find == "" then
		default_find = ""
	end

	local find_word = vim.fn.input("Find word: ", default_find)
	if find_word == "" then
		print("Cancelled")
		return
	end

	local replace_word = vim.fn.input("Replace '" .. find_word .. "' with: ")
	if replace_word == "" then
		print("No replacement given")
		return
	end

	find_word = vim.fn.escape(find_word, "/")
	replace_word = vim.fn.escape(replace_word, "\\")

	vim.cmd("%s/" .. find_word .. "/" .. replace_word .. "/g")
	print("Replaced all occurrences of '" .. find_word .. "' with '" .. replace_word .. "'")
end, { desc = "Replace Any Word in File" })

-- Exit terminal and toggle it closed (Tmux-safe)
vim.keymap.set("t", "<C-g>", "<C-\\><C-n>:ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Force Telescope live_grep for <leader>fg — LAST RESORT
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		vim.defer_fn(function()
			-- Remove any existing mapping
			vim.keymap.del("n", "<leader>fg", { silent = true })

			-- Set Telescope live_grep
			vim.keymap.set("n", "<leader>fg", function()
				local ok, telescope = pcall(require, "telescope.builtin")
				if ok then
					telescope.live_grep()
				else
					vim.notify("Telescope not available", vim.log.levels.ERROR)
				end
			end, { desc = "Live Grep (Telescope)", noremap = true, silent = true })
		end, 200) -- 200ms delay to ensure all plugins are loaded
	end,
})
