return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Thiết lập các tùy chọn của nord.nvim
		vim.g.nord_contrast = true
		vim.g.nord_borders = true
		vim.g.nord_disable_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = true

		-- Load theme trước
		require("nord").set()

		-- Lấy màu từ nord.nvim
		local colors = require("nord.colors")

		-- Sử dụng màu cho cấu hình khác
		local custom_theme = {
			fill = colors.nord0_gui,
			indicator = colors.nord9_gui,
			bg = colors.nord0_gui,
			buffer_bg = colors.nord0_gui,
			buffer_bg_selected = colors.nord1_gui,
			buffer_bg_visible = "#2A2F3A",
			bold = true,
			italic = true,
		}

		-- Toggle transparency
		local bg_transparent = true
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			vim.g.nord_disable_background = bg_transparent
			vim.cmd([[colorscheme nord]])
			-- Áp dụng lại highlight sau khi thay đổi transparency
			require("core.highlights").setup()
		end

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })

		-- Áp dụng highlights custom sau khi đã load colorscheme
		vim.defer_fn(function()
			require("core.highlights").setup()
		end, 100)
	end,
}
