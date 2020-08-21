![Maintenance Badge](https://img.shields.io/badge/Maintained-yes-success)
![Version Badge](https://img.shields.io/badge/Version-1.2-informational)

# list-color.vim


## Introduction
This vim plugin will colorize the lines of lists and TODO files
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
color. Each level of indentation has a different color, and all lines at that
level share that color.


## Functions
```
ListColorize
```
Reassign the colors of all 10 indentation levels.


## File types
This plugin will automatically operate on these files:
* Files with the extension `.list`
* Files with the extension `.todo`
* Files with the extension `.TODO`
* Files that are named `todo`
* Files that are named `TODO`
* Files with no file type


## Open issues
- Currently, only tab indentation is supported.
- The colors favor a darker color scheme, and there is no intelligence in choosing colors.
- The color choices do not currently have any scheme, palette, or general order.
