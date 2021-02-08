describe("testing block comments", function()
   local comments = require("nvim-commaround.commaround")
   local global_config = require("nvim-commaround.config")
   local lua_ft_cfg, sql_ft_cfg, vim_ft_cfg, py_ft_cfg

   setup(function()
	  lua_ft_cfg = global_config.config['lua']
	  sql_ft_cfg = global_config.config['sql']
	  vim_ft_cfg = global_config.config['vim']
	  py_ft_cfg = global_config.config['python']
   end)

   it("is_comment_block_surround #surround", function()
	  local lua_lines = {" --[[ first line", "second line", "third line ]]"}
	  assert.is_true(comments.is_comment_block_surround(lua_ft_cfg, lua_lines))

	  local sql_lines = {" /* first line", "second line", "third line */"}
	  assert.is_true(comments.is_comment_block_surround(sql_ft_cfg, sql_lines))

	  assert.is_false(comments.is_comment_block_surround(sql_ft_cfg, lua_lines))
	  assert.is_false(comments.is_comment_block_surround(lua_ft_cfg, sql_lines))
   end)

   it("is_comment_block_multiline #multiline", function()
	  local vim_lines = {"\" first line", "\" second line", "\" third line"}
	  assert.is_true(comments.is_comment_block_multiline(vim_ft_cfg, vim_lines))

	  local py_lines = {"# first line", "# second line", "# third line"}
	  assert.is_true(comments.is_comment_block_multiline(py_ft_cfg, py_lines))
   end)

end)
