" vim-diesel
set background=light
let g:colors_name="term"

" Cursor
hi  Cursor       ctermfg=none ctermbg=none cterm=reverse

" Code
hi  Function     ctermfg=6
hi  Statement    ctermfg=3
hi  Normal       ctermfg=none
hi  Comment      ctermfg=8     cterm=italic
hi  Folded       ctermfg=8     ctermbg=none
hi  FoldColumn   ctermbg=none
hi  NonText      ctermfg=8
hi  SpecialKey   ctermfg=0
hi  Todo         ctermfg=3    ctermbg=8

" Spell
hi  SpellBad     ctermfg=9     ctermbg=0
hi  SpellCap     ctermfg=12    ctermbg=0

" Highlight
hi  Search       ctermfg=3     ctermbg=none
hi  Visual       ctermfg=0
hi  MatchParen   ctermfg=3     ctermbg=none

" Lines
hi  CursorLine   cterm=none    ctermbg=0
hi  CursorLineNr ctermfg=none     ctermbg=0
hi  LineNr       ctermfg=8     ctermbg=none

" Splits
hi  SignColumn   ctermbg=none
hi  VertSplit    ctermfg=0     ctermbg=none cterm=none

" Status line / related
hi StatusLine   ctermfg=03 ctermbg=none cterm=none
hi StatusLineNC ctermfg=07 ctermbg=none cterm=none
hi WildMenu     ctermfg=0 ctermbg=4

" Tabs
hi TabLine      ctermfg=8  ctermbg=none  cterm=none
hi TabLineFill  ctermfg=7  ctermbg=none  cterm=none
hi TabLineSel   ctermfg=3  ctermbg=none    cterm=none
hi BufTabLineActive ctermbg=none ctermfg=15

" Vimdiff
hi  DiffAdd      ctermfg=14    ctermbg=none
hi  DiffChange   ctermfg=12    ctermbg=none
hi  DiffDelete   ctermfg=10    ctermbg=none
hi  DiffText     ctermfg=9     ctermbg=none

" Pmenu
hi  Pmenu        ctermfg=white ctermbg=black
hi  PmenuSel     ctermfg=black ctermbg=white
hi  PmenuSbar    ctermfg=white ctermbg=black
hi  PmenuThumb   ctermfg=black ctermbg=white

hi EndOfBuffer ctermfg=0 ctermbg=none
