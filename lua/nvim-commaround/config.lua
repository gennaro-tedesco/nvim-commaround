local config = {
   bash = {single = "##", block = nil},
   c = {single = "//", block = {left = "/*", right = "*/"}},
   clojure = {single = ";;", block = nil},
   cpp = {single = "//", block = {left = "/*", right = "*/"}},
   css = {single = "//", block = {left = "/*", right = "*/"}},
   dockerfile = {single = "##", block = nil},
   go = {single = "//", block = {left = "/*", right = "*/"}},
   haskell = {single = "--", block = {left = "{-", right = "-}"}},
   html = {single = nil, block = {left = "<!--", right = "-->"}},
   java = {single = "//", block = {left = "/*", right = "*/"}},
   javascript = {single = "//", block = {left = "/*", right = "*/"}},
   lua = {single = "--", block = {left = "--[[", right = "]]"}},
   make = {single = "##", block = nil},
   python = {single = "#", block = nil},
   r = {single = "#", block = nil},
   ruby = {single = "#", block = nil},
   rust = {single = "//", block = {left = "/*", right = "*/"}},
   scss = {single = "//", block = {left = "/*", right = "*/"}},
   sh = {single = "##", block = nil},
   sql = {single = "--", block = {left = "/*", right = "*/"}},
   tex = {single = "%", block = nil},
   typescript = {single = "//", block = {left = "/*", right = "*/"}},
   vim = {single = "\"", block = nil},
   xml = {single = nil, block = {left = "<!--", right = "-->"}},
   yaml = {single = '#', block = nil},
   zsh = {single = '#', block = nil},
}

return {
   config = config
}
