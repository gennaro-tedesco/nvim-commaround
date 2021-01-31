local util = require("exlin.utils")
local config = require("exlin.config")

local comment_string = config.config.single
local comment_start_string = config.config.block_start
local comment_end_string = config.config.block_end

local function is_comment_single()
   local line = util.trim(vim.api.nvim_get_current_line())
   return line:sub(1, #comment_string) == comment_string
end

local function toggle_block()
   vim.cmd('norm `<i'..comment_start_string..' ')
   vim.cmd('norm `>a '..comment_end_string)
end

local function toggle_single()
   if not is_comment_single() then
	  vim.cmd('norm ^i'..comment_string..' ')
   else
	  vim.cmd('norm ^'..#comment_string + 1 ..'x')
   end
end

local function toggle_comment()
   local line_start = vim.fn.line("'<")
   local line_end = vim.fn.line("'>")
   if line_end == line_start then
	  toggle_single()
   else
	  toggle_block()
   end
end

return {
   toggle_comment = toggle_comment,
   is_comment_single = is_comment_single,
}
