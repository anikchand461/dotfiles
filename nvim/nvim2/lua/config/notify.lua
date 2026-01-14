-- ~/.config/nvim/lua/config/notify.lua

require("notify").setup({
	stages = "fade_in_slide_out", -- smooth in/out
	timeout = 2000, -- auto-hide after 2s
	max_height = function()
		return math.floor(vim.o.lines * 0.3)
	end,
	max_width = function()
		return math.floor(vim.o.columns * 0.3)
	end,
	on_open = function(win)
		vim.api.nvim_win_set_config(win, { border = "rounded" })
	end,
})
