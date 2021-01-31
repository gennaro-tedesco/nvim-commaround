--[[ local function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end --]]

local function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function is_comment_single(filetype_config)
   local line = trim(vim.api.nvim_get_current_line())
   return line:sub(1, #filetype_config['single']) == filetype_config['single']
end

local function is_comment_block(filetype_config, lines)
   local first_line = trim(lines[1])
   local last_line = trim(lines[#lines])
   return (first_line:sub(1, #filetype_config['block_start']) == filetype_config['block_start']) and (last_line:sub(#last_line - #filetype_config['block_end'] + 1, #last_line) == filetype_config['block_end'])
end

local function toggle_block(filetype_config, context)
   if not is_comment_block(filetype_config, context.lines) then
	  vim.cmd('norm `<i'..filetype_config['block_start']..' ')
	  vim.cmd('norm `>a '..filetype_config['block_end'])
   else
	  context.lines[1] = context.lines[1]:sub(#filetype_config['block_start'] + 2, #context.lines[1])
	  context.lines[#context.lines] = context.lines[#context.lines]:sub(1, #context.lines[#context.lines] - #filetype_config['block_end'])
	  vim.api.nvim_buf_set_lines(0, context.start_number, context.end_number, false, context.lines)
   end
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


