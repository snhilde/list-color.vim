" If the file extension is list, we'll set the list filetype.
autocmd BufWinEnter *.list setfiletype list

" If the file name ends in todo or TODO (either as a file extension or a standalone name),
" then we'll use our list filetype with it.
autocmd BufWinEnter *todo  setfiletype list
autocmd BufWinEnter *TODO  setfiletype list

" We'll also set the list filetype for files with no filetype. This will help catch random text files.
autocmd BufWinEnter *      if &filetype == '' | setfiletype list | endif
