lua exlin = require("exlin")

let g:peekaboo_window=":lua exlin.FloatingWindow(0.7, 0.6)"

nnoremap <leader>q :lua exlin.FloatingWindow(0.7, 0.6)<CR>
