![Maintenance Badge](https://img.shields.io/badge/Maintained-yes-success)
![Version Badge](https://img.shields.io/badge/Version-1.2-informational)

# list-color.vim


## Introduction
This vim plugin will colorize the lines of lists and TODO files
with a random color based on the line's level of indentation.

For example, consider this file (say, in project/TODO):
```
1 Write unit tests
2 	Set up batches
3 	Validate results
4 Release
5 	Package build
6 		Determine system
7 		Determine config
8 	Finish notes
9 	Send it out
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

To reassign all colors via a key command, you can use something like this mapping, which calls the function with Leader-c:
`no <Leader>c :ListColorize<CR>`


## Settings
```
g:list_color_use_background
```
`0` - Do not choose line colors based on the `background` vim setting.
`1` - (Default) Use darker line colors for `background`=`light` and lighter line colors for `background`=`dark`.


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
