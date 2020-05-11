" These are all the colors that can be chosen for different indent levels.
let g:list_colors = [ "#F0F8FF", "#FAEBD7", "#00FFFF", "#7FFFD4", "#F0FFFF", "#F5F5DC", "#FFE4C4", "#FFEBCD", "#8A2BE2", "#A52A2A", "#DEB887", "#5F9EA0", "#7FFF00", "#D2691E", "#FF7F50", "#6495ED", "#FFF8DC", "#DC143C", "#008B8B", "#B8860B", "#A9A9A9", "#006400", "#BDB76B", "#8B008B", "#556B2F", "#FF8C00", "#8B0000", "#E9967A", "#8FBC8F", "#483D8B", "#00CED1", "#9400D3", "#FF1493", "#00BFFF", "#1E90FF", "#B22222", "#FFFAF0", "#228B22", "#FF00FF", "#DCDCDC", "#F8F8FF", "#FFD700", "#DAA520", "#808080", "#ADFF2F", "#F0FFF0", "#FF69B4", "#CD5C5C", "#FFFFF0", "#F0E68C", "#E6E6FA", "#FFF0F5", "#7CFC00", "#FFFACD", "#ADD8E6", "#F08080", "#E0FFFF", "#FAFAD2", "#D3D3D3", "#90EE90", "#FFB6C1", "#FFA07A", "#20B2AA", "#87CEFA", "#778899", "#B0C4DE", "#FFFFE0", "#00FF00", "#32CD32", "#FAF0E6", "#66CDAA", "#BA55D3", "#9370DB", "#3CB371", "#7B68EE", "#00FA9A", "#48D1CC", "#C71585", "#F5FFFA", "#FFE4E1", "#FFE4B5", "#FFDEAD", "#FDF5E6", "#6B8E23", "#FFA500", "#FF4500", "#DA70D6", "#EEE8AA", "#98FB98", "#AFEEEE", "#DB7093", "#FFEFD5", "#FFDAB9", "#CD853F", "#FFC0CB", "#DDA0DD", "#B0E0E6", "#663399", "#FF0000", "#BC8F8F", "#4169E1", "#8B4513", "#FA8072", "#F4A460", "#2E8B57", "#FFF5EE", "#A0522D", "#C0C0C0", "#87CEEB", "#6A5ACD", "#708090", "#FFFAFA", "#00FF7F", "#4682B4", "#D2B48C", "#008080", "#D8BFD8", "#FF6347", "#40E0D0", "#EE82EE", "#F5DEB3", "#FFFFFF", "#F5F5F5", "#FFFF00", "#9ACD32" ]

" Pick 10 different colors from the list above at random, and colorize each line in the list based on its indentation level.
function! list#colorize()
	" Set up some function variables.
	let l:list_len = len(g:list_colors)
	let l:count = 0

	" These dictionaries will hold values as we progress through the operations.
	" nums will hold the random indexes as they are selected. We will use it to make sure we don't select the same index twice.
	" colors will hold the random colors chosen from list_colors.
	let l:nums = {}
	let l:colors = {}

	" To get some random numbers for choosing the color at each indent level, we're going to dump some bytes from
	" /dev/urandom and group them into numbers. We only need 10 numbers, but we're going to grab 50 so we have plenty to
	" discard as duplicates arise.
	" --read-bytes=100  read 100 bytes from /dev/urandom
	" --width=100       put all 100 bytes onto one line (makes splitting easier)
	" --format=u2       group into 2-byte unsigned numbers (this will produce 50 numbers)
	" -An               don't print any line headers
	let l:output = system('od --read-bytes=100 --width=100 --format=u2 -An < /dev/urandom')
	for l:num in split(l:output)
		" Choose an index in list_colors based on the random number.
		let l:index = l:num % l:list_len
		" Check if we already have this index. If we do, then we'll move on to the next number.
		if !has_key(l:nums, l:index)
			" We haven't seen this index yet. Let's flag the index and then set a line's color.
			let l:nums[l:index] = 1
			exec "hi LIST" . l:count . " guifg=" . g:list_colors[l:index] . " guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE"
			let l:count += 1
			if l:count == 10
				" We've set colors for all 10 levels of indentation. We can be done now.
				break
			endif
		endif
	endfor
endfunction
