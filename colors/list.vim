" In this simple script, we're going to set random colors for each of 10 different indent levels.
" The indent level is based on tabs, not spaces. A line starting with 0 tabs will be highlighted
" by group LIST0, a line starting with 1 tab by group LIST1, and so on. We will parse 10 random
" numbers from /dev/urandom and use them to choose colors from the array below.
" Note: This currently favors a dark colorscheme, there is no error handling or ability to
" integrate with various set-ups, and it only sets the color for 'guifg'.
"
let g:colors_name="list"

" These are all the colors that can be chosen for different indent levels.
let colors = [ "#F0F8FF", "#FAEBD7", "#00FFFF", "#7FFFD4", "#F0FFFF", "#F5F5DC", "#FFE4C4", "#FFEBCD", "#8A2BE2", "#A52A2A", "#DEB887", "#5F9EA0", "#7FFF00", "#D2691E", "#FF7F50", "#6495ED", "#FFF8DC", "#DC143C", "#008B8B", "#B8860B", "#A9A9A9", "#006400", "#BDB76B", "#8B008B", "#556B2F", "#FF8C00", "#9932CC", "#8B0000", "#E9967A", "#8FBC8F", "#483D8B", "#00CED1", "#9400D3", "#FF1493", "#00BFFF", "#1E90FF", "#B22222", "#FFFAF0", "#228B22", "#FF00FF", "#DCDCDC", "#F8F8FF", "#FFD700", "#DAA520", "#808080", "#ADFF2F", "#F0FFF0", "#FF69B4", "#CD5C5C", "#FFFFF0", "#F0E68C", "#E6E6FA", "#FFF0F5", "#7CFC00", "#FFFACD", "#ADD8E6", "#F08080", "#E0FFFF", "#FAFAD2", "#D3D3D3", "#90EE90", "#FFB6C1", "#FFA07A", "#20B2AA", "#87CEFA", "#778899", "#B0C4DE", "#FFFFE0", "#00FF00", "#32CD32", "#FAF0E6", "#66CDAA", "#BA55D3", "#9370DB", "#3CB371", "#7B68EE", "#00FA9A", "#48D1CC", "#C71585", "#191970", "#F5FFFA", "#FFE4E1", "#FFE4B5", "#FFDEAD", "#FDF5E6", "#6B8E23", "#FFA500", "#FF4500", "#DA70D6", "#EEE8AA", "#98FB98", "#AFEEEE", "#DB7093", "#FFEFD5", "#FFDAB9", "#CD853F", "#FFC0CB", "#DDA0DD", "#B0E0E6", "#663399", "#FF0000", "#BC8F8F", "#4169E1", "#8B4513", "#FA8072", "#F4A460", "#2E8B57", "#FFF5EE", "#A0522D", "#C0C0C0", "#87CEEB", "#6A5ACD", "#708090", "#FFFAFA", "#00FF7F", "#4682B4", "#D2B48C", "#008080", "#D8BFD8", "#FF6347", "#40E0D0", "#EE82EE", "#F5DEB3", "#FFFFFF", "#F5F5F5", "#FFFF00", "#9ACD32" ]

" To get some random numbers for choosing the color at each indent level, we're going to dump some bytes from
" /dev/urandom and group them into numbers. Specifically, we're going to read out 10 different 2-byte unsigned integers.
" --read-bytes=20  read 20 bytes from /dev/urandom
" --width=20       put all 20 bytes onto one line (makes splitting easier)
" --format=u2      group into 2-byte unsigned numbers
" -An              don't print any line headers
let output = system('od --read-bytes=20 --width=20 --format=u2 -An < /dev/urandom')

" This is an incrementing counter for setting successive highlight groups.
let n = 0

" Set the highlight group for each random number.
for num in split(output)
	exec "hi LIST" . n . " guifg=" . colors[num % len(colors)] . " guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE"
	let n += 1
endfor

