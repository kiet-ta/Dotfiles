return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- 1. Cấu hình cơ bản cho Nord
		vim.g.nord_contrast = true
		vim.g.nord_borders = true
		vim.g.nord_disable_background = true
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = true

		-- Load theme
		require("nord").set()

		-- 2. Hàm xử lý sự không đồng bộ (Consistency Fixer)
		-- Hàm này sẽ ép các nhóm highlight cụ thể phải theo màu nền mong muốn
		local function apply_transparency(transparent)
			-- Danh sách các nhóm UI thường xuyên bị lệch màu nền
			local groups = {
				"Normal",
				"NormalNC", -- Cửa sổ chính
				"NormalFloat",
				"FloatBorder", -- Các cửa sổ nổi (LSP, Suggestion)
				"TelescopeNormal",
				"TelescopeBorder",
				"TelescopePromptNormal", -- Telescope
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"NeoTreeWinSeparator", -- Neo-tree sidebar
				"SignColumn",
				"FoldColumn", -- Cột hiển thị lỗi/gấp code bên trái
				"EndOfBuffer", -- Ký tự ~ ở cuối file
			}

			for _, group in ipairs(groups) do
				if transparent then
					vim.api.nvim_set_hl(0, group, { bg = "NONE" })
				else
					-- Nếu tắt trong suốt, ta để theme tự quyết định (hoặc reset về default)
					-- Cách đơn giản nhất là reload lại theme, nhưng ở đây ta chỉ cần set bg=NONE là đủ cho case transparent
				end
			end
		end

		-- 3. Logic Toggle tối ưu
		local bg_transparent = true

		-- Áp dụng ngay lần đầu khởi động
		apply_transparency(bg_transparent)

		local toggle_transparency = function()
			bg_transparent = not bg_transparent

			-- Cập nhật biến global của theme
			vim.g.nord_disable_background = bg_transparent

			-- Reload theme để áp dụng thay đổi gốc
			vim.cmd([[colorscheme nord]])

			-- Áp dụng thêm lớp fix của chúng ta cho các plugin
			if bg_transparent then
				apply_transparency(true)
			end

			-- Load lại các highlight custom của user (từ file core/highlights.lua)
			require("core.highlights").setup()

			print("Transparency: " .. (bg_transparent and "ON" or "OFF"))
		end

		vim.keymap.set(
			"n",
			"<leader>bg",
			toggle_transparency,
			{ noremap = true, silent = true, desc = "Toggle Transparency" }
		)

		-- 4. Đảm bảo highlight được áp dụng sau cùng (Fix race condition)
		vim.defer_fn(function()
			apply_transparency(bg_transparent)
			require("core.highlights").setup()
		end, 100)
	end,
}

