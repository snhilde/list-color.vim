if !exists("g:list_color_use_background")
	let g:list_color_use_background = 1
endif

" Pick 10 different colors from the list below at random, and colorize each line in the list based on its indentation level.
function! list#colorize()
	" These are all the colors that can be chosen for different indent levels.
	if g:list_color_use_background
		if &background == "light"
			let l:list_colors = [ "darkcyan", "darkgreen", "darkmagenta", "darkred", "brown", "magenta", "darkgray", "green", "gray", "red" ]
		else
			let l:list_colors = [ "lightred", "lightmagenta", "yellow", "lightyellow", "lightgreen", "lightblue", "cyan", "lightcyan", "lightgray", "darkgray", "white" ]
		endif
	else
		let l:list_colors = [ "red", "lightred", "darkred", "magenta", "lightmagenta", "darkmagenta", "yellow", "lightyellow", "green", "lightgreen", "darkgreen", "lightblue", "cyan", "lightcyan", "darkcyan", "brown", "gray", "lightgray", "darkgray", "white" ]
	endif

	" Set up some function variables.
	let l:list_len = len(l:list_colors)
	let l:count = 0

	" These dictionaries will hold values as we progress through the operations.
	" nums will hold the random indexes as they are selected. We will use it to make sure we don't select the same index twice.
	" colors will hold the random colors chosen from list_colors.
	let l:nums = {}
	let l:colors = {}

	" To get some random numbers for choosing the color at each indent level, we're going to dump some bytes from
	" /dev/urandom and group them into numbers. We only need 10 numbers, but we're going to grab 50 so we have plenty to
	" discard as duplicates arise.
	" -N 50  read 50 bytes from /dev/urandom
	" -t u1  group into 1-byte unsigned numbers (this will produce 50 numbers)
	" -A n   don't print any headers/trailers
	let l:output = system('od -N 50 -t u1 -A n < /dev/urandom | xargs')
	for l:num in split(l:output)
		" Choose an index in list_colors based on the random number.
		let l:index = l:num % l:list_len
		" Check if we already have this index. If we do, then we'll move on to the next number.
		if !has_key(l:nums, l:index)
			" We haven't seen this index yet. Let's flag the index and then set a line's color.
			let l:nums[l:index] = 1
			exec "hi LIST" . l:count . " guifg=" . l:list_colors[l:index] . " guibg=NONE gui=NONE ctermfg=" . l:list_colors[l:index] . " ctermbg=NONE cterm=NONE"
			let l:count += 1
			if l:count == 10
				" We've set colors for all 10 levels of indentation. We can be done now.
				break
			endif
		endif
	endfor
endfunction
