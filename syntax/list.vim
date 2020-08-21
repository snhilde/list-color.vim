" Create a highlight group for every level of indentation. Each group
" will match an entire line that starts with the specified number of
" tabs. Space indentation is not currently supported. This would be the
" place to add it.

" If a line begins with a space, it will be highlighted as a comment. We have to match this
" first so it doesn't clobber the matches later.
syntax match Comment " .*$"

syntax match LIST0  "^\(\t\{0}\| \{0}\)\S.*$"
syntax match LIST1  "^\(\t\{1}\| \{4}\)\S.*$"
syntax match LIST2  "^\(\t\{2}\| \{8}\)\S.*$"
syntax match LIST3  "^\(\t\{3}\| \{12}\)\S.*$"
syntax match LIST4  "^\(\t\{4}\| \{16}\)\S.*$"
syntax match LIST5  "^\(\t\{5}\| \{20}\)\S.*$"
syntax match LIST6  "^\(\t\{6}\| \{24}\)\S.*$"
syntax match LIST7  "^\(\t\{7}\| \{28}\)\S.*$"
syntax match LIST8  "^\(\t\{8}\| \{32}\)\S.*$"
syntax match LIST9  "^\(\t\{9}\| \{36}\)\S.*$"
