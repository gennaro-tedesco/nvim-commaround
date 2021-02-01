local config = {
   c = {single = "//", block = {left = "/*", right = "*/"}},
   cpp = {single = "//", block = {left = "/*", right = "*/"}},
   lua = {single = "--", block = {left = "--[[", right = "--]]"}},
   python = {single = "#", block = nil},
   r = {single = "#", block = nil},
   ruby = {single = "#", block = nil},
   vim = {single = "\"", block = nil},
}

return {
   config = config
}
