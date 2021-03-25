local function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function is_comment_single(filetype_config)
   local line = trim(vim.api.nvim_get_current_line())
   return line:sub(1, #filetype_config['single']) == filetype_config['single']
end

local function is_comment_block_surround(filetype_config, lines)
   local first_line = trim(lines[1])
   local last_line = trim(lines[#lines])
   return (first_line:sub(1, #filetype_config['block']['left']) == filetype_config['block']['left']) and
		 (last_line:sub(#last_line - #filetype_config['block']['right'] + 1, #last_line) == filetype_config['block']['right'])
end

local function comment_block_surround(filetype_config)
   vim.cmd('norm `<i'..filetype_config['block']['left']..' ')
   vim.cmd('norm `>a '..filetype_config['block']['right'])
end

local function uncomment_block_surround(filetype_config, context)
   context.lines[1] = context.lines[1]:sub(#filetype_config['block']['left'] + 2, #context.lines[1])
   context.lines[#context.lines] = context.lines[#context.lines]:sub(1, #context.lines[#context.lines] -
		 #filetype_config['block']['right'] - 1)
   vim.api.nvim_buf_set_lines(0, context.start_number, context.end_number, false, context.lines)
end

local function is_comment_block_multiline(filetype_config, lines)
   local first_line = trim(lines[1])
   local last_line = trim(lines[#lines])
   return (first_line:sub(1, #filetype_config['single']) == filetype_config['single']) and
		 (last_line:sub(1, #filetype_config['single']) == filetype_config['single'])
end

local function comment_block_multiline(filetype_config)
   vim.cmd('\'<,\'>norm 0i'..filetype_config['single']..' ')
end

local function uncomment_block_multiline(filetype_config)
   vim.cmd('\'<,\'>norm 0'..#filetype_config['single'] + 1 ..'x')
end

--[[
Definition of the logic to toggle comments: it detects whether the visual
block is already commented or not and toggles the comments on and off accordingly

Arguments:
   filetype_config: a table of filetype specific comments characters
   context: a table containing the selection visual block
--]]

local function toggle_block(filetype_config, context)
   if filetype_config['block'] ~= nil then
	  if not is_comment_block_surround(filetype_config, context.lines) then
		 comment_block_surround(filetype_config)
	  else
		 uncomment_block_surround(filetype_config, context)
	  end
   else
	  if not is_comment_block_multiline(filetype_config, context.lines) then
		 comment_block_multiline(filetype_config)
	  else
		 uncomment_block_multiline(filetype_config)
	  end
   end
end

local function toggle_single(filetype_config, context)
   if filetype_config['single'] == nil then
	  toggle_block(filetype_config, context)
	  return nil
   end
   if not is_comment_single(filetype_config) then
	  vim.cmd('norm ^i'..filetype_config['single']..' ')
   else
	  vim.cmd('norm ^'..#filetype_config['single'] + 1 ..'x')
   end
end

return {
   toggle_block = toggle_block,
   toggle_single = toggle_single,
   is_comment_block_surround = is_comment_block_surround,
   is_comment_block_multiline = is_comment_block_multiline,
}


