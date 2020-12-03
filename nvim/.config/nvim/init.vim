" ====================================================== */
" Mappings
" ====================================================== */

let mapleader = ' '

" Navigation - Wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Navigation - Windows / Buffers
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" Tab shifting - (keep selection)
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Visually select function block
nnoremap <Leader>vf va{V

" Search - unset highlight from last search pattern onEnter (carriage return)
nnoremap <silent> <CR> :nohlsearch<CR>

" Suspend Vim to open full shell prompt (write fg in shell to put V into foreground)
nnoremap <Leader>sh :sus<CR>

" Commenting
vmap <Leader>cc <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine<CR>

" Quick vimrc refresh
nnoremap <Leader>sv :so ~/.config/nvim/init.vim<CR> <BAR> :echo 'init.vim reloaded'<CR>

" Quick writes and quits
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>

" Replace word under cursor with..
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" Insert line below/above cursor in normalmode and return to last postition
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j

" Buffer navigation
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

" Open various plugs / fzf
nnoremap <leader>b :Buffer<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>e :Files<cr>
nnoremap <leader>f :NERDTreeToggle<cr>

" Change dir to current file
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Goyo + Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <silent> <leader>g :Limelight<CR>
nmap <silent> <leader>G :Limelight!<CR>

" fzf navigation
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" coc
imap <C-l> <Plug>(coc-snippets-expand)
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:cm_matcher = {'module': 'cm_matchers.fuzzy_matcher', 'case': 'smartcase'}
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
imap <C-l> <Plug>(coc-snippets-expand)

" Image paste in markdown files
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" command for sudo writing
cmap w!! w suda://%

" ====================================================== */
" General Settings
" ====================================================== */

" Suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" Hybrid line number
set relativenumber number

" Tabs & indents
filetype plugin indent on
set autoindent copyindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab

" Window
set title
set titlestring=%t
set mouse=a " enables mousewheel

" Some servers have issues with backup files, see #649 (COC)
set nobackup
set nowritebackup
set noswapfile

" undofile
set undofile
set undodir=~/.config/nvim/bak

" Search casing
set ignorecase smartcase
set hlsearch
set incsearch

set laststatus=0 "hide status bar
set noshowmode " hide mode indicator
set backspace=eol,indent,start "no backspace past end of line

set autochdir
set splitright
set splitbelow
set clipboard=unnamedplus
set hidden
    
" Nvim native autocomplete
set completeopt=menuone,noinsert

" list chars
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set list lcs=tab:\┊\  "draw tabline
set fillchars+=vert:\  "draw verticle split
set ve+=onemore "allow cursor to go to end of line

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


" set cursor to last known position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

set nocursorcolumn "cursor tracking
set nocursorline "cursor tracking
set cursorline "cursor tracking

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif



" ====================================================== */
" Plugins
" ====================================================== */

call plug#begin('~/.vim/plugged')

" Colorschemes & other fancy stuff
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo' " registers
Plug 'mhinz/vim-startify'
Plug 'itchyny/vim-cursorword'
Plug 'ap/vim-buftabline'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Session
Plug 'tpope/vim-obsession'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
let g:mkdp_browser = 'qutebrowser'
let g:mkdp_markdown_css = '/home/ritzo/dotfiles/nvim/.config/nvim/markdown.css'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 1
    \ }

Plug 'ferrine/md-img-paste.vim'
" Plug 'plasticboy/vim-markdown'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" Targets & objects
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'glts/vim-textobj-indblock'

" Search and List
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" Code completion - COC
Plug 'neoclide/coc.nvim', {'branch': 'release'} |
           \ Plug 'antoinemadec/coc-fzf' |
           \ Plug 'wellle/tmux-complete.vim' " coc completion from open tmux panes
let g:coc_global_extensions = [
			\ 'coc-actions',
			\ 'coc-explorer',
			\ 'coc-css',
			\ 'coc-git',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-pairs',
			\ 'coc-snippets',
			\ 'coc-flutter',
			\ 'coc-sh',
			\ 'coc-r-lsp',
			\ 'coc-python',
			\ 'coc-markdownlint',
			\ ]

			" \ 'coc-spell-checker',
			" \ 'coc-cspell-dicts',
" Utils
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'wfxr/minimap.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'junegunn/vim-easy-align'
Plug 'chaoren/vim-wordmotion'

Plug 'preservim/nerdcommenter'
let NERDSpaceDelims = 1
let NERDDefaultAlign = 'left'
let NERDCommentEmptyLines = 1
let NERDToggleCheckAllLines = 1

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Statusline
" Plug 'itchyny/lightline.vim'
" Plug 'maximbaz/lightline-ale'

call plug#end()


" ====================================================== */
" Themes - Colorschemes
" ====================================================== */
colorscheme wal

" Vim cursor (for some terminals | pipe <==> block)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set lbr
set wrap
let &showbreak=' ▸ '

" minimap
let g:minimap_auto_start=1
let g:minimap_width=6
let g:minimap = 'NonText'
" hi MinimapCurrentLine ctermfg=0 guifg=0 guibg=0
" let g:minimap_highlight = 'MinimapCurrentLine'

" nerdtree
" auto open and focus on file
" autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden = 0
let NERDTreeWinSize = 15
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeHighlightCursorline = 1
let g:NERDTreeMouseMode = 2
" let NERDTreeChDirMode=2
" autocmd FileType nerdtree nmap <buffer> <right> C
" autocmd FileType nerdtree nmap <buffer> <left> u
" autocmd FileType nerdtree nmap <buffer> <return> o
" autocmd FileType nerdtree nmap <buffer> . I
" autocmd FileType nerdtree nmap <buffer> r R
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

" startify
let g:startify_custom_header = [
	\ '  _  _    _   __       *   _  _  _   ',
	\ ' / |/ |  |/  /  \_|  |_|  / |/ |/ |  ',
	\ '   |  |_/|__/\__/  \/  |_/  |  |  |_/',
	\ ' - - - - - - - - - - - - - - - - - - ',
	\ ]
let g:startify_files_number = 5
let g:startify_bookmarks = [
	\ '~/.config/nvim/init.vim',
	\ '~/.config/bspwm/bspwmrc',
	\ '~/.config/sxhkd/sxhkdrc',
	\ '~/.config/polybar/config',
	\ '~/.zshrc',
	\ ]
let g:startify_commands = [
	\ ['plug install', 'PlugInstall']
	\ ]
let g:startify_lists = [
			\ { 'type': 'files',     'header': ['   recents']        },
			\ { 'type': 'bookmarks', 'header': ['   bookmarks']      },
			\ { 'type': 'commands',  'header': ['   commands']       }
			\ ]


" hide splits
hi VertSplit cterm=NONE
" hide empty line tilde
hi! EndOfBuffer ctermbg=None ctermfg=0 guibg=0 guifg=0
" minimap
hi MinimapCurrentLine ctermfg=1 ctermbg=NONE
let g:minimap_highlight = 'MinimapCurrentLine'
" nerdtree
hi NERDTreeDirSlash ctermbg=NONE ctermfg=8
hi NERDTreeExecFile ctermbg=NONE ctermfg=8
hi NERDTreeOpenable ctermbg=NONE ctermfg=8
hi NERDTreeClosable ctermbg=NONE ctermfg=8
hi NERDTreeDir ctermbg=NONE ctermfg=8
hi NERDTreeFile ctermbg=NONE ctermfg=8
hi NERDTreeLinkFile ctermbg=NONE ctermfg=8
hi NERDTreeLinkDir ctermbg=NONE ctermfg=8
hi NERDTreeLinkTarget ctermbg=NONE ctermfg=8
hi NERDTreeCurrentNode ctermbg=NONE ctermfg=7
hi NERDTreeCWD ctermbg=NONE ctermfg=6

" dim bg windows
" hi ActiveWindow ctermfg=7 
hi InactiveWindow ctermfg=8 ctermbg=NONE
set winhighlight=NormalNC:InactiveWindow
" italics
hi Directory cterm=italic
hi Comment cterm=italic
hi String cterm=italic
hi Statement cterm=italic

" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '!'

hi ALEWarningSign ctermbg=none ctermfg=2
hi ALEErrorSign   ctermbg=none ctermfg=4
