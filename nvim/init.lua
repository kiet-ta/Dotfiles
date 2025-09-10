-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("core.mappings") --for rust
require("core.options") -- Load general options
require("core.keymaps") -- Load general keymaps
require("core.snippets") -- Custom code snippets

-- Set up plugins
require("lazy").setup({
	{ "echasnovski/mini.nvim", branch = "main" }, -- Add mini.nvim to lazy.nvim
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.none-ls"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.comment"),
	-- require("plugins.hardtime"),
	-- require("plugins.preconition-nvim"),
	require("plugins.tmux"),
	require("plugins.csvview"),
	require("plugins.mutiple-cursor"),
	require("plugins.toggleterm"),
	require("plugins.treesitter_playground"),
	require("plugins.rust"),
})
--
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- Bật wrap nhưng không cắt chữ giữa chừng

vim.opt.wrap = true
vim.opt.linebreak = true -- ngắt dòng ở khoảng trắng thay vì giữa từ
vim.opt.breakindent = true -- giữ indent khi xuống dòng
