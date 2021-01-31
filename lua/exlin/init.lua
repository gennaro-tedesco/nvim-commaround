local comments = require("exlin.comments")
local global_config = require("exlin.config")

local function toggle_comment()
   local filetype_config = global_config.config[vim.bo.filetype]
   if filetype_config == nil then
	  print('filetype not defined')
	  return nil
   end

   local line_start = vim.fn.line("'<")
   local line_end = vim.fn.line("'>")
   if line_end == line_start then
	  comments.toggle_single(filetype_config)
   else
	  comments.toggle_block(filetype_config)
   end
end

return {
   toggle_comment = toggle_comment,
}
