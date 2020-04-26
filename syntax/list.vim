" Create a highlight group for every level of indentation. Each group
" will match an entire line that starts with the specified number of
" tabs. Space indentation is not currently supported. This would be the
" place to add it.
syntax match LIST0  "^\t\{0}.*$"
syntax match LIST1  "^\t\{1}.*$"
syntax match LIST2  "^\t\{2}.*$"
syntax match LIST3  "^\t\{3}.*$"
syntax match LIST4  "^\t\{4}.*$"
syntax match LIST5  "^\t\{5}.*$"
syntax match LIST6  "^\t\{6}.*$"
syntax match LIST7  "^\t\{7}.*$"
syntax match LIST8  "^\t\{8}.*$"
syntax match LIST9  "^\t\{9}.*$"

" If a line begins with a space, it will be highlighted as a comment.
syntax match Comment "^\t* .*$"
