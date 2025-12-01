return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons", -- Hoặc "echasnovski/mini.icons" nếu bạn dùng mini
	},
	ft = { "markdown" }, -- Chỉ load khi mở file markdown để tối ưu startup time
	opts = {
		-- Cấu hình cơ bản
		code = {
			sign = false, -- Tắt sign column cho gọn nếu muốn
			width = "block", -- Hiển thị block code full chiều rộng
			right_pad = 1, -- Padding bên phải cho đẹp
		},
		heading = {
			sign = false, -- Tắt ký tự sign ở lề trái cho heading
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }, -- Icon heading đẹp hơn
		},
		-- Tích hợp tốt với màu Nord bạn đang dùng
		checkbox = {
			unchecked = { icon = "󰄱 " },
			checked = { icon = "󰱒 " },
		},
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)

		-- Map phím tắt để bật/tắt nhanh chế độ render
		-- Space + md (Markdown)
		vim.keymap.set("n", "<leader>md", require("render-markdown").toggle, { desc = "Toggle Render Markdown" })
	end,
}
