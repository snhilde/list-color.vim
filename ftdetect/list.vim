" If the file extension is list, we'll set the list filetype.
autocmd    BufEnter,BufNew *.list   setfiletype list

" If the file name ends in todo or TODO (either as a file extension or a standalone name),
" then we'll use our list filetype with it.
autocmd    BufEnter,BufNew *todo    setfiletype list
autocmd    BufEnter,BufNew *TODO    setfiletype list

" We'll also set the list filetype for files with no filetype. This will help catch random text files.
autocmd    BufEnter,BufNew,BufNewFile,BufRead *    if &filetype == '' | setfiletype list | endif
