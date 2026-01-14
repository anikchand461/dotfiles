return {
	-- Highlight colors

	{
		"nvim-telescope/telescope.nvim",
		priority = 1000,
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
				end,
				desc = "Lists files in your current working directory, respects .gitignore",
			},
			-- ... other keymaps (you can add more here if needed)
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			-- ✅ Safely initialize opts and its subtables
			if not opts then
				opts = {}
			end
			if not opts.defaults then
				opts.defaults = {}
			end
			if not opts.pickers then
				opts.pickers = {}
			end
			if not opts.extensions then
				opts.extensions = {}
			end

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			})

			opts.pickers = vim.tbl_deep_extend("force", opts.pickers, {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
				live_grep = {
					cwd = vim.fn.getcwd(),
				},
			})

			opts.extensions = vim.tbl_deep_extend("force", opts.extensions, {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
						},
					},
				},
			})

			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},
}
