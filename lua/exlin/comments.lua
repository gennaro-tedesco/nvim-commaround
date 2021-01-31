local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function is_comment_single(filetype_config)
   local line = trim(vim.api.nvim_get_current_line())
   return line:sub(1, #filetype_config['single']) == filetype_config['single']
end

local function toggle_block(filetype_config)
   vim.cmd('norm `<i'..filetype_config['block_start']..' ')
   vim.cmd('norm `>a '..filetype_config['block_end'])
end

local function toggle_single(filetype_config)
   if not is_comment_single(filetype_config) then
	  vim.cmd('norm ^i'..filetype_config['single']..' ')
   else
	  vim.cmd('norm ^'..#filetype_config['single'] + 1 ..'x')
   end
end

return {
    toggle_block = toggle_block,
    toggle_single = toggle_single,
}


