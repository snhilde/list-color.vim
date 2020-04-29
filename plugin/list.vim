" Allow the ability to call the internal colorize function while in command mode.
" See :h command for more information.
command! -nargs=0 ListColorize call list#colorize()
