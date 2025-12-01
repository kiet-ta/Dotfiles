return {
	-- Di chuyển liền mạch giữa tmux pane và Neovim splits
	{
		"christoomey/vim-tmux-navigator",
		lazy = false, -- Tải ngay khi khởi động
	},

	-- Tích hợp nâng cao với tmux
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				copy_sync = { enable = true }, -- Đồng bộ clipboard tmux và Neovim
				navigation = { enable = true }, -- Di chuyển pane tmux từ Neovim
			})
		end,
	},
}
