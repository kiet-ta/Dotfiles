return {
	"karb94/neoscroll.nvim",
	event = "WinScrolled",
	config = function()
		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
			hide_cursor = true, -- Ẩn con trỏ khi đang cuộn để nhìn đỡ rối
			stop_eof = true, -- Dừng lại khi hết file
			use_local_scrolloff = false,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			easing_function = "quadratic",
		})
	end,
}
