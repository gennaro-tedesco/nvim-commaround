local config = {
   bash = {vim.api.nvim_buf_get_option(0, 'commentstring') = "##", block = nil},
   c = {vim.api.nvim_buf_get_option(0, 'commentstring') = "//", block = {left = "/*", right = "*/"}},
   clojure = {vim.api.nvim_buf_get_option(0, 'commentstring') = ";;", block = nil},
   cpp = {vim.api.nvim_buf_get_option(0, 'commentstring') = "//", block = {left = "/*", right = "*/"}},
   dockerfile = {vim.api.nvim_buf_get_option(0, 'commentstring') = "##", block = nil},
   go = {vim.api.nvim_buf_get_option(0, 'commentstring') = "//", block = {left = "/*", right = "*/"}},
   java = {vim.api.nvim_buf_get_option(0, 'commentstring') = "//", block = {left = "/*", right = "*/"}},
   javascript = {vim.api.nvim_buf_get_option(0, 'commentstring') = "//", block = {left = "/*", right = "*/"}},
   lua = {vim.api.nvim_buf_get_option(0, 'commentstring') = "--", block = {left = "--[[", right = "]]"}},
   make = {vim.api.nvim_buf_get_option(0, 'commentstring') = "##", block = nil},
   python = {vim.api.nvim_buf_get_option(0, 'commentstring') = "#", block = nil},
   r = {vim.api.nvim_buf_get_option(0, 'commentstring') = "#", block = nil},
   ruby = {vim.api.nvim_buf_get_option(0, 'commentstring') = "#", block = nil},
   rust = {vim.api.nvim_buf_get_option(0, 'commentstring') = "//", block = {left = "/*", right = "*/"}},
   sh = {vim.api.nvim_buf_get_option(0, 'commentstring') = "##", block = nil},
   sql = {vim.api.nvim_buf_get_option(0, 'commentstring') = "--", block = {left = "/*", right = "*/"}},
   tex = {vim.api.nvim_buf_get_option(0, 'commentstring') = "%", block = nil},
   vim = {vim.api.nvim_buf_get_option(0, 'commentstring') = "\"", block = nil},
}

return {
   config = config
}
