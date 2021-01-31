local comments = require("exlin.comments")
local global_config = require("exlin.config")

local function toggle_comment()
   local filetype_config = global_config.config[vim.bo.filetype]
   if filetype_config == nil then
	  print('filetype not defined')
	  return nil
   end

   local lines = vim.api.nvim_buf_get_lines(0, vim.fn.line("'<")-1, vim.fn.line("'>"), false)
   local context = {lines = lines, start_number = vim.fn.line("'<")-1, end_number = vim.fn.line("'>")}
   if #lines > 1 then
	  comments.toggle_block(filetype_config, context)
   else
	  comments.toggle_single(filetype_config)
   end
end

return {
   toggle_comment = toggle_comment,
}
