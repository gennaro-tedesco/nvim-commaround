if exists('g:loaded_commaround')
  finish
endif

vnoremap <Plug>ToggleCommaround :lua require('nvim-commaround').toggle_comment()<CR>

if exists('g:toggle_commaround')
	echo g:toggle_commaround
	execute 'vmap ' . g:toggle_commaround . ' <Plug>ToggleCommaround'
else
	vmap <leader>c <Plug>ToggleCommaround
endif


let g:loaded_commaround = 1
