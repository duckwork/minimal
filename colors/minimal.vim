" -----------------------------------------------------------------------------
" File: minimal.vim
" Description: A minimal colorscheme for Vim
" Author: duckwork <casedizz@gmail.com>
" Source: https://github.com/duckwork/minimal
" Last Modified: 29 November 2015
" -----------------------------------------------------------------------------

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

let s:is_dark = (&background == 'dark')

" Palette
let s:c = {}
let s:c.dark0 = ['#121212', 233]
let s:c.dark1 = ['#424242', 238]
let s:c.dark2 = ['#565656', 248]
let s:c.lite2 = ['#a9a9a9', 248]
let s:c.lite1 = ['#cccccc', 251]
let s:c.lite0 = ['#f8f8f8', 255]

let s:c.blue   = ['#42a9ee', 069]
let s:c.yellow = ['#a9a912', 226]
let s:c.red    = ['#ee1242', 160]
let s:c.green  = ['#12ee42', 084]

if s:is_dark
  let s:fg0 = s:c.lite1
  let s:fg1 = s:c.lite0
  let s:bg0 = s:c.dark0
  let s:bg1 = s:c.dark1
  let s:hh  = s:c.dark2
  set background=dark
else
  let s:fg0 = s:c.dark1
  let s:fg1 = s:c.dark0
  let s:bg1 = s:c.lite0
  let s:bg0 = s:c.lite1
  let s:hh  = s:c.lite2
  set background=light
endif

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

call s:HL('Normal', s:fg0, s:bg0)
call s:HL('Bold', s:fg0, s:none, s:bold)
call s:HL('Italic', s:fg0, s:none, s:italic)
call s:HL('BoldItalic', s:fg0, s:none, s:bold . s:italic)

call s:HL('Constant', s:fg1)
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

call s:HL('Underlined', s:fg0, s:none, s:underline)

call s:HL('Error', s:c.red, s:none, s:underline . s:inverse)

call s:HL('Todo', s:c.yellow, s:none, s:inverse)

call s:HL('Cursor', s:fg0, s:none, s:inverse)
hi! link CursorLine Normal
call s:HL('LineNr', s:hh, s:none, s:italic)
call s:HL('CursorLineNr', s:fg0, s:none, s:italic)

hi! link Title Bold

call s:HL('StatusLine', s:none, s:fg0)
call s:HL('StatusLineNC', s:fg0, s:hh)

call s:HL('NonText', s:hh)
call s:HL('SpecialKey', s:hh)
call s:HL('Comment', s:c.yellow, s:none, s:italic)
call s:HL('VertSplit', s:hh, s:hh)
call s:HL('Visual', s:fg1, s:bg1, s:inverse)
hi! link Directory BoldItalic
call s:HL('MatchParen', s:fg0, s:none, s:bold . s:inverse)
call s:HL('Search', s:c.green, s:fg0, s:inverse)
hi! link IncSearch Search
hi! link WildMenu Search
