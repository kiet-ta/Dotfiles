return {
	"echasnovski/mini.animate",
	event = "VeryLazy",
	opts = function()
		-- Đừng dùng animate cho scroll nếu bạn định dùng plugin scroll riêng (như neoscroll)
		-- Ở đây mình tắt scroll của mini để dùng neoscroll chuyên dụng hơn ở bước 3
		local animate = require("mini.animate")
		return {
			resize = {
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
			},
			scroll = {
				enable = false, -- Tắt scroll animation của mini để tránh xung đột
			},
			cursor = {
				-- Hiệu ứng con trỏ di chuyển mượt
				enable = true,
				timing = animate.gen_timing.linear({ duration = 80, unit = "total" }),
			},
		}
	end,
	config = function(_, opts)
		require("mini.animate").setup(opts)
	end,
}
