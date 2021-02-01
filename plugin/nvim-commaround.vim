if exists('g:loaded_commaround')
  finish
endif

vnoremap <leader>q :lua require('nvim-commaround').toggle_comment()<CR>

let g:loaded_commaround = 1
