" Set some generic settings for our filetype.
setlocal nowrap
setlocal autoindent
setlocal foldmethod=indent
setlocal foldlevel=10
setlocal colorcolumn=0
setlocal textwidth=0

" Only build the line colors if we haven't already done so.
if !exists("g:ListColored")
	let g:ListColored = 1
	call list#colorize()
endif
