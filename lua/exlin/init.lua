local function FloatingWindow(popup_height_ratio, popup_width_ratio)
	local screen_width = vim.api.nvim_list_uis()[1].width
	local screen_height = vim.api.nvim_list_uis()[1].height
	local popup_width = math.ceil(screen_width*popup_width_ratio)
	local popup_height = math.ceil(screen_height*popup_height_ratio)

	local opts = {
		style = "minimal",
		relative = "editor",
		width = popup_width,
		height = popup_height,
		row = math.ceil((screen_height - popup_height)/2),
		col = math.ceil((screen_width - popup_width)/2),
	}

	local border = {}
	local top = "╭" .. string.rep("─", popup_width - 2) .. "╮"
	local mid = "│" .. string.rep(" ", popup_width - 2) .. "│"
	local bot = "╰" .. string.rep("─", popup_width - 2) .. "╯"

	table.insert(border, top)
	for i=1, popup_height-2 do
		table.insert(border, mid)
	end
	table.insert(border, bot)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
	vim.api.nvim_buf_set_option(buf, 'filetype', 'exlin')
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, border)
	vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_set_option('winhl', 'Normal:Floating')
end

return {
	FloatingWindow = FloatingWindow,
}
