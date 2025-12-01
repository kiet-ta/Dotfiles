return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"typescript",
			"vimdoc",
			"vim",
			"regex",
			"terraform",
			"sql",
			"dockerfile",
			"toml",
			"json",
			"java",
			"groovy",
			"go",
			"gitignore",
			"graphql",
			"yaml",
			"make",
			"cmake",
			"markdown",
			"markdown_inline",
			"bash",
			"tsx",
			"css",
			"html",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- some languages depend on vim's regex highlighting system (such as ruby) for indent rules.
			--  if you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	},
	-- config = function()
	-- 	vim.api.nvim_set_hl(0, "@function", { fg = "#A31D1D", bold = true }) -- Hàm màu xanh cyan
	-- 	vim.api.nvim_set_hl(0, "@keyword", { fg = "#FF0000", italic = true }) -- Từ khóa màu đỏ, in nghiêng
	-- 	vim.api.nvim_set_hl(0, "@string", { fg = "#FFFFFF" }) -- Chuỗi màu xanh lá cây
	-- 	vim.api.nvim_set_hl(0, "@variable", { fg = "#FFD700" }) -- Biến màu vàng
	-- 	vim.api.nvim_set_hl(0, "@comment", { fg = "#808080", italic = true }) -- Comment màu xám, in nghiêng
	-- 	vim.api.nvim_set_hl(0, "@type", { fg = "#FF69B4" }) -- Kiểu dữ liệu màu hồng
	-- 	vim.api.nvim_set_hl(0, "@parameter", { fg = "#ADD8E6" }) -- Tham số màu xanh nhạt
	-- end,
	-- There are additional nvim-treesitter modules that you can use to interact
	-- with nvim-treesitter. You should go explore a few and see what interests you:
	--
	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
