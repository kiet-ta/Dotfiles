return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({
			-- Các tùy chọn cấu hình cơ bản
			headerMaxWidth = 80, -- Giới hạn chiều rộng header
			transient = true, -- Tự động xóa buffer grug-far khi đóng
			keymaps = {
				-- Phím tắt nội bộ khi đang ở trong cửa sổ Grug-far
				close = { n = "q" }, -- Nhấn q để đóng
				replace = { n = "<leader>r" }, -- Nhấn <leader>r để thực hiện replace
				syncLocations = { n = "<leader>s" }, -- Sync vị trí con trỏ
				refresh = { n = "<leader>f" }, -- Refresh lại kết quả tìm kiếm
			},
		})
	end,
	keys = {
		{
			"<leader>rr", -- Phím tắt mở giao diện: Space + r + r
			function()
				require("grug-far").open({
					transient = true, -- Buffer này sẽ biến mất khi đóng, không rác buffer list
				})
			end,
			mode = { "n", "v" }, -- Hoạt động cả Normal và Visual mode
			desc = "Project Find & Replace (Grug-far)",
		},
		{
			"<leader>rw", -- Phím tắt tìm & thay thế từ dưới con trỏ: Space + r + w
			function()
				require("grug-far").open({
					prefills = {
						search = vim.fn.expand("<cword>"), -- Lấy từ hiện tại điền vào ô tìm kiếm
					},
				})
			end,
			mode = { "n" },
			desc = "Replace Current Word (Project)",
		},
	},
}
