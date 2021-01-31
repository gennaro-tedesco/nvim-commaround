if exists('g:loaded_exlin')
  finish
endif

vnoremap <leader>q :lua require('exlin').toggle_comment()<CR>

let g:loaded_exlin = 1
