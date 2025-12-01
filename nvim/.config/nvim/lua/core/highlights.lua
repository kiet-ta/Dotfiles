return {
	setup = function()
		-- Tùy chỉnh các highlight groups
		local highlights = {
			["@comment"] = { fg = "#808080", italic = true }, -- Comment màu xám, in nghiêng
			["@function"] = { fg = "#FFAD60", bold = true }, -- Hàm màu xanh cyan
			["@boolean"] = { fg = "#51DACF" }, -- Từ khóa như class, public
			["@variable"] = { fg = "#F2F9FF" },
			["@keyword"] = { fg = "#FBA518", bold = true }, -- Từ khóa như class, public
			["@type"] = { fg = "#F6C794" }, -- Tên lớp như Node
			["@method"] = { fg = "#AEEA94" }, -- Phương thức
		}

		-- Áp dụng highlights
		for group, styles in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, styles)
		end
	end,
}
