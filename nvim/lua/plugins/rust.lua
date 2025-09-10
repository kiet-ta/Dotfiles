return {
	{
		"rust-lang/rust.vim",
		ft = { "rust" },
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"saecki/crates.nvim",
		ft = { "rust" },
		config = function()
			require("crates").setup({
				complete = {
					cmp = {
						enable = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = {
					{ name = "crates" },
				},
			})
		end,
	},
}
