local config = {
   bash = {single = "##", block = nil},
   c = {single = "//", block = {left = "/*", right = "*/"}},
   cpp = {single = "//", block = {left = "/*", right = "*/"}},
   dockerfile = {single = "##", block = nil},
   java = {single = "//", block = {left = "/*", right = "*/"}},
   javascript = {single = "//", block = {left = "/*", right = "*/"}},
   go = {single = "//", block = {left = "/*", right = "*/"}},
   lua = {single = "--", block = {left = "--[[", right = "]]"}},
   python = {single = "#", block = nil},
   r = {single = "#", block = nil},
   ruby = {single = "#", block = nil},
   rust = {single = "//", block = {left = "/*", right = "*/"}},
   sql = {single = "--", block = {left = "/*", right = "*/"}},
   tex = {single = "%", block = nil},
   vim = {single = "\"", block = nil},
}

return {
   config = config
}
