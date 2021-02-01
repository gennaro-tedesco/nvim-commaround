if exists('g:loaded_commaround')
  finish
endif

vnoremap <Plug>CommaroundToggle :lua require('nvim-commaround').toggle_comment()<CR>
vmap <leader>c <Plug>CommaroundToggle

let g:loaded_commaround = 1
