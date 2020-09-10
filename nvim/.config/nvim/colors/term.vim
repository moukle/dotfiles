" vim-diesel
set background=light
let g:colors_name="term"

" Cursor
hi  Cursor       ctermfg=none ctermbg=none cterm=reverse

" Code
hi Function   ctermfg=6
hi Statement  ctermfg=3
hi Normal     ctermfg=none
hi Comment    ctermfg=8    cterm=italic
hi Folded     ctermfg=8    ctermbg=none
hi FoldColumn ctermbg=none
hi NonText    ctermfg=8
hi Special    ctermbg=NONE ctermfg=6
hi SpecialKey ctermfg=0
hi Todo       ctermfg=15    ctermbg=3

hi Identifier ctermbg=NONE ctermfg=1 cterm=bold
hi Structure  ctermbg=NONE ctermfg=5
hi Conceal    ctermbg=NONE ctermfg=0
hi Constant   ctermbg=NONE ctermfg=3
hi Error      ctermbg=1    ctermfg=7
hi Ignore     ctermbg=8    ctermfg=0
hi PreProc    ctermbg=NONE ctermfg=3
hi String     ctermbg=NONE ctermfg=2
hi Number     ctermbg=NONE ctermfg=3
hi Type       ctermbg=NONE ctermfg=3
hi Underlined ctermbg=NONE ctermfg=1 cterm=underline

" Spell
hi SpellBad   ctermbg=NONE ctermfg=1 cterm=underline
hi SpellCap   ctermbg=NONE ctermfg=4 cterm=underline
hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline
hi SpellRare  ctermbg=NONE ctermfg=6 cterm=underline

" Highlight
hi Search     ctermfg=3 ctermbg=none
hi IncSearch  ctermbg=3 ctermfg=0
hi Visual     ctermfg=0
hi MatchParen ctermfg=3 ctermbg=none

" Lines
hi  CursorLine   cterm=none    ctermbg=0
hi  CursorLineNr ctermfg=none     ctermbg=0
hi  LineNr       ctermfg=8     ctermbg=none

" Splits
hi  SignColumn   ctermbg=none
hi  VertSplit    ctermfg=0     ctermbg=none cterm=none

" Status line / related
hi StatusLine   ctermfg=03 ctermbg=8 cterm=none
hi StatusLineNC ctermfg=07 ctermbg=0 cterm=none
hi WildMenu     ctermfg=0 ctermbg=4

" Tabs
hi TabLine          ctermfg=8    ctermbg=none cterm=none
hi TabLineFill      ctermfg=7    ctermbg=none cterm=none
hi TabLineSel       ctermfg=3    ctermbg=0    cterm=bold
hi BufTabLineActive ctermbg=none ctermfg=15   cterm=bold

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

" Python
hi pythonOperator  ctermbg=NONE ctermfg=2
hi pythonFunction  ctermbg=NONE ctermfg=3
hi pythonRepeat    ctermbg=NONE ctermfg=2
hi pythonStatement ctermbg=NONE ctermfg=1 cterm=bold
hi pythonBuiltIn   ctermbg=NONE ctermfg=3 cterm=bold

" vim
hi vimUserCommand ctermbg=NONE ctermfg=1 cterm=BOLD
    hi link vimMap vimUserCommand
    hi link vimLet vimUserCommand
    hi link vimCommand vimUserCommand
    hi link vimFTCmd vimUserCommand
    hi link vimAutoCmd vimUserCommand
    hi link vimNotFunc vimUserCommand
