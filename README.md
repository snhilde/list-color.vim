# list-color.vim

## Introduction
This very simple vim plugin will colorize the lines of lists and TODO files
with a random color based on the line's level of indentation.

For example, consider this file (say, in project/TODO):
```
Write unit tests
	Set up batches
	Validate results
Release
	Package build
		Determine system
		Determine config
	Finish notes
	Send it out
```

There are 3 levels of indentation in this TODO list. Lines 1 and 4 would have
one color, lines 2, 3, 5, 8, and 9 another color, and lines 6 and 7 a third
color. Each level of indentation has a different color (unless the random
selection is the same), and all lines at that level share that color.

## Open issues
- Currently, only tab indentation is supported.
- The colors favor a darker color scheme, and there is no intelligence in choosing colors.
- The color choices do not currently have any scheme, palette, or general order.
- Incongruous colors are slowly being whittled down.
