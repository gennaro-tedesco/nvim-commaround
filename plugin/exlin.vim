echo "exlin.vim sourced"

lua exlin = require("exlin")
nnoremap <leader>q :lua exlin.FloatingWindow(0.7, 0.6)<CR>
