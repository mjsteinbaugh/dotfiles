# Coreutils

## dircolors

Configuration file for `dircolors`, a utility to help you set the `LS_COLORS`
environment variable used by GNU `ls` with the `--color` option.

See also:
- `dircolors -p`
- `dircolors -b`
- http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
- https://github.com/arcticicestudio/nord-dircolors/blob/develop/src/dir_colors
- https://github.com/joshbenham/linux-dotfiles/blob/master/dircolors/Dracula.dircolors
- https://github.com/arcticicestudio/nord-dircolors
- https://github.com/seebi/dircolors-solarized

### 8 color codes

The default color codes use the capabilities of an 8 color terminal with some
additional attributes as per the following codes:

Attribute codes:

| #  | attribute  |
| -- | ---------- |
| 00 | none       |
| 01 | bold       |
| 04 | underscore |
| 05 | blink      |
| 07 | reverse    |
| 08 | concealed  |

Text color codes:

| #  | color   |
| -- | ------- |
| 30 | black   |
| 31 | red     |
| 32 | green   |
| 33 | yellow  |
| 34 | blue    |
| 35 | magenta |
| 36 | cyan    |
| 37 | white   |

Background color codes:

| #  | color   |
| -- | ------- |
| 40 | black   |
| 41 | red     |
| 42 | green   |
| 43 | yellow  |
| 44 | blue    |
| 45 | magenta |
| 46 | cyan    |
| 47 | white   |

### 256 color codes

Text color coding: `38;5;COLOR_NUMBER`
Background color coding: `48;5;COLOR_NUMBER`

`COLOR_NUMBER` is from 0 to 255.

Run this to get color list:

```sh
env TERM=xterm-256color emacs -nw -f list-colors-display
```

See also:
- http://www.mail-archive.com/bug-coreutils@gnu.org/msg11030.html

## Basic file types

Below are the color init strings for the basic file types.
One can use codes for 256 or more colors supported by modern terminals.

| -b | -p                    | description                                     |
| -- | --------------------- | ----------------------------------------------- |
| rs | RESET                 | Reset to "normal" color                         |
| no | NORMAL                | Global default                                  |
| fi | FILE                  | Normal file                                     |
| di | DIR                   | Directory                                       |
| ln | LINK                  | Symbolic link. Can use 'target'                 |
| ex | EXEC                  | File (+x)                                       |
| ow | OTHER_WRITABLE        | Directory (o+w)                                 |
| st | STICKY                | Directory (+t)                                  |
| tw | STICKY_OTHER_WRITABLE | Directory (+t,o+w)                              |
| su | SETUID                | File (u+s)                                      |
| sg | SETGID                | File (g+s)                                      |
| or | ORPHAN                | Symbolic link pointing to a non-existent file   |
| mi | MISSING               | Non-existent file pointed to by a symlink       |
| pi | FIFO                  | Named pipe                                      |
| do | DOOR                  | Door                                            |
| bd | BLK                   | Block device                                    |
| cd | CHR                   | Character device                                |
| so | SOCK                  | Socket                                          |
| lc | LEFTCODE, LEFT        | Opening terminal code                           |
| rc | RIGHTCODE, RIGHT      | Closing terminal code                           |
| ec | ENDCODE, END          | Non-filename text                               |

