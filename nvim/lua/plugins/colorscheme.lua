-- ~/.config/nvim/lua/plugins/colorscheme.lua

local themes = {
	"sonokai",
	"tokyonight",
	"kanagawa",
	"material",
}

-- Install all themes
local plugins = {}

for _, theme in ipairs(themes) do
	table.insert(plugins, {
		theme == "sonokai" and "sainnhe/sonokai"
			or theme == "tokyonight" and "folke/tokyonight.nvim"
			or theme == "kanagawa" and "rebelot/kanagawa.nvim"
			or "marko-cerovac/material.nvim",
		name = theme,
		lazy = false,
		priority = theme == "sonokai" and 1000 or 500,
		config = function()
			if theme == "sonokai" then
				vim.g.sonokai_transparent_background = "1"
				vim.g.sonokai_enable_italic = "1"
				vim.g.sonokai_style = "andromeda"
			end
		end,
	})
end

-- ✅ DEFER THEME SETUP TO AFTER PLUGIN LOAD
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- Set default theme
		vim.cmd.colorscheme(themes[1])

		-- Toggle function
		local current_index = 1
		local function toggle_theme()
			current_index = current_index % #themes + 1
			local next_theme = themes[current_index]
			vim.cmd.colorscheme(next_theme)
			print("🎨 Theme: " .. next_theme)
		end

		-- Expose command & keymap
		vim.api.nvim_create_user_command("ToggleTheme", toggle_theme, {})
		vim.keymap.set("n", "<leader>tt", toggle_theme, { desc = "Toggle Colorscheme" })
	end,
})

return plugins
