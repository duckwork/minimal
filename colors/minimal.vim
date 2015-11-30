" -----------------------------------------------------------------------------
" File: minimal.vim
" Description: A minimal colorscheme for Vim
" Author: duckwork <casedizz@gmail.com>
" Source: https://github.com/duckwork/minimal
" Last Modified: 29 November 2015
" -----------------------------------------------------------------------------
set background=light
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "minimal"

if !has('gui_running') && &t_Co != 256
  finish
endif

" Palette
let s:c = {}
let s:c.dark0 = ['#121212', 233]
let s:c.dark1 = ['#424242', 238]
let s:c.gray  = ['#a9a9a9', 248]
let s:c.lite1 = ['#cccbca', 251]
let s:c.lite0 = ['#f8f8f8', 255]

let s:c.blue   = ['#42a9ee', 069]
let s:c.yellow = ['#a9a912', 226]
let s:c.red    = ['#ee1242', 160]
let s:c.green  = ['#12ee42', 084]

let s:fg = s:c.dark1
let s:bg = s:c.lite0
let s:hh = s:c.gray

let s:bold      = 'bold,'
let s:italic    = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse   = 'inverse,'

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none   = ['NONE', 'NONE']

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp
  let fg = a:fg
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0],      'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0],      'ctermbg=' . bg[1],
        \ 'gui='   . emstr[:-2], 'cterm='   . emstr[:-2]
        \ ]

  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

call s:HL('Normal', s:fg, s:bg)
call s:HL('Bold', s:fg, s:bg, s:bold)
call s:HL('Italic', s:fg, s:bg, s:italic)
call s:HL('BoldItalic', s:fg, s:bg, s:bold . s:italic)

hi! link Constant  Normal
hi! link String    Constant
hi! link Character Constant
hi! link Number    Constant
hi! link Boolean   Constant
hi! link Float     Constant

hi! link Identifier Normal
hi! link Function   Identifier
hi! link VarId      Identifier

hi! link Statement   Bold
hi! link Conditional Statement
hi! link Repeat      Statement
hi! link Label       Statement
hi! link Operator    Statement
hi! link Keyword     Statement
hi! link Exception   Statement

hi! link PreProc   Normal
hi! link Include   PreProc
hi! link Define    PreProc
hi! link Macro     PreProc
hi! link PreCondit PreProc

hi! link Type         Italic
hi! link StorageClass Type
hi! link Structure    Type
hi! link Typedef      Type
hi! link ConId        Type

hi! link Special        Normal
hi! link SpecialChar    Special
hi! link Tag            Special
hi! link Delimiter      Special
hi! link SpecialComment Special
hi! link Debug          Special

call s:HL('Underlined', s:fg, s:bg, s:underline)

call s:HL('Error', s:c.red, s:bg, s:underline . s:inverse)

call s:HL('Todo', s:c.yellow, s:bg, s:inverse)

call s:HL('Cursor', s:fg, s:bg, s:inverse)
hi! link CursorLine Normal
call s:HL('LineNr', s:c.lite1, s:bg, s:italic)
call s:HL('CursorLineNr', s:fg, s:bg, s:italic)

hi! link Title Bold

call s:HL('StatusLine', s:bg, s:fg)
call s:HL('StatusLineNC', s:fg, s:hh)

call s:HL('NonText', s:hh)
call s:HL('SpecialKey', s:hh)
call s:HL('Comment', s:c.yellow, s:bg, s:italic)
call s:HL('VertSplit', s:c.gray, s:c.gray)
call s:HL('Visual', s:c.green, s:fg, s:inverse)
hi! link Directory BoldItalic
call s:HL('MatchParen', s:fg, s:bg, s:bold . s:inverse)
call s:HL('Search', s:c.green, s:fg, s:inverse)
hi! link IncSearch Search
hi! link WildMenu Search
