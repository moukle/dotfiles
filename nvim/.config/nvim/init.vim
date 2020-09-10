filetype plugin on

let mapleader = "\<Space>"
" {{{ plugins
	" {{{ plug
	call plug#begin('~/.config/nvim/plugged')
	" {{{ plug itself
	Plug 'junegunn/vim-plug'
	" }}}
	" {{{ coc
		Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
		imap <C-l> <Plug>(coc-snippets-expand)
	" }}}
	" {{{ targets
			Plug 'wellle/targets.vim'
			" {{{ objects
				Plug 'kana/vim-textobj-user'
				Plug 'glts/vim-textobj-comment'
				Plug 'glts/vim-textobj-indblock'
			" }}}
		" }}}
	" {{{ editing helpers
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		Plug 'junegunn/fzf.vim'
		Plug 'donRaphaco/neotex', { 'for': 'tex' }
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-repeat'
		Plug 'dhruvasagar/vim-table-mode'
		Plug 'jiangmiao/auto-pairs'
		Plug 'AndrewRadev/splitjoin.vim'
		Plug 'junegunn/vim-easy-align'
		Plug 'lambdalisue/suda.vim'
		Plug 'chrisbra/unicode.vim'
		Plug 'honza/vim-snippets'
	" }}}
	" {{{ fancy
		" Plug 'https://github.com/romainl/flattened'
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'
		Plug 'junegunn/vim-peekaboo' " registers
		Plug 'mhinz/vim-startify'
		Plug 'Yggdroot/indentLine'
		Plug 'itchyny/vim-cursorword'
		Plug 'ap/vim-buftabline'
		Plug 'unblevable/quick-scope'
		Plug 'preservim/nerdtree'
		Plug 'ryanoasis/vim-devicons'
	" }}}
	" {{{ colors
		Plug 'ayu-theme/ayu-vim'
		Plug 'chriskempson/base16-vim'
		Plug 'drewtempelmeyer/palenight.vim'
		Plug 'dylanaraps/wal.vim'
		Plug 'morhetz/gruvbox'
		Plug 'fehawen/cs.vim'
		Plug 'NerdyPepper/vim-colors-plain', { 'branch': 'duotone' }
	" }}}
	" {{{ langs
		Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
		Plug 'alaviss/nim.nvim'
		" Plug 'lervag/vimtex'
		Plug 'jvirtanen/vim-octave'
		" Plug 'zah/nim.vim'
		" }}}
	" {{{ git
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" }}}
	" {{{ other
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	" }}}
	call plug#end()
	"}}}
	" {{{ plugin settings
		" {{{ nerdtree
			let g:NERDTreeShowHidden=1
		" }}}
		" {{{ ncm
			let g:cm_matcher = {'module': 'cm_matchers.fuzzy_matcher', 'case': 'smartcase'}
			inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
			inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

			" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
			" found' messages
			set shortmess+=c

			" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
			inoremap <c-c> <ESC>

			" When the <Enter> key is pressed while the popup menu is visible, it only
			" hides the menu. Use this mapping to close the menu and also start a new
			" line.
			inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

			" Use <TAB> to select the popup menu:
			" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
			" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

			" wrap existing omnifunc
			" Note that omnifunc does not run in background and may probably block the
			" editor. If you don't want to be blocked by omnifunc too often, you could
			" add 180ms delay before the omni wrapper:
			"  'on_complete': ['ncm2#on_complete#delay', 180,
			"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
			au User Ncm2Plugin call ncm2#register_source({
					\ 'name' : 'css',
					\ 'priority': 9,
					\ 'subscope_enable': 1,
					\ 'scope': ['css','scss'],
					\ 'mark': 'css',
					\ 'word_pattern': '[\w\-]+',
					\ 'complete_pattern': ':\s*',
					\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
					\ })
		" }}}
		" {{{ polyglot
			let g:polyglot_disabled = ['latex']
		" }}}
		" {{{ ultisnips
			let g:UltiSnipsExpandTrigger            = "<c-l>"
			let g:UltiSnipsJumpForwardTrigger       = "<c-l>"
			let g:UltiSnipsJumpBackwardTrigger      = "<c-h>"
			let g:UltiSnipsRemoveSelectModeMappings = 0
			" optional
			inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
		" }}}
		" {{{ neosnippet
			" imap <c-l>     <Plug>(neosnippet_expand_or_jump)
			" vmap <c-l>     <Plug>(neosnippet_expand_or_jump)
			" " expand parameters
			" let g:neosnippet#enable_completed_snippet=1
		" }}}
		" {{{ easyalign
			xmap ga <Plug>(EasyAlign)
			nmap ga <Plug>(EasyAlign)
		" }}}
		" {{{ ale
			map <silent> <leader>k <Plug>(ale_previous_wrap)
			map <silent> <leader>j <Plug>(ale_next_wrap)

			let g:ale_sign_column_always = 1
			let g:ale_sign_error = '!'
			let g:ale_sign_warning = '!'

			hi ALEWarningSign ctermbg=none ctermfg=2
			hi ALEErrorSign   ctermbg=none ctermfg=4
		" }}}
		" {{{ auto-pairs
			let g:AutoPairsFlyMode = 0
			let g:AutoPairsShortcutJump = '<c-n>'
		" }}}
		" {{{ fzf
			let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
		" }}}
		" {{{ startify
			hi! link StartifyHeader Normal
			hi! link StartifyFile Directory
			hi! link StartifyPath LineNr
			hi! link StartifySlash StartifyPath
			hi! link StartifyBracket StartifyPath
			hi! link StartifyNumber Normal

			let g:startify_skiplist = [
						\ 'COMMIT_EDITMSG',
						\ '^/tmp',
						\ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
						\ 'bundle/.*/doc',
						\ ]

			let g:startify_padding_left = 5
			let g:startify_relative_path = 1
			let g:startify_fortune_use_unicode = 1
			let g:startify_change_to_vcs_root = 1
			" let g:startify_session_autoload = 1
			let g:startify_update_oldfiles = 1
			let g:startify_use_env = 1

			let g:startify_fortune_use_unicode = 0
			let g:startify_session_sort = 1
			let g:startify_custom_header = [
						\ "              .            .      ",
						\ "            .,;'           :,.    ",
						\ "          .,;;;,,.         ccc;.  ",
						\ "        .;c::::,,,'        ccccc: ",
						\ "        .::cc::,,,,,.      cccccc.",
						\ "        .cccccc;;;;;;'     llllll.",
						\ "        .cccccc.,;;;;;;.   llllll.",
						\ "        .cccccc  ';;;;;;'  oooooo.",
						\ "        'lllllc   .;;;;;;;.oooooo'",
						\ "        'lllllc     ,::::::looooo'",
						\ "        'llllll      .:::::lloddd'",
						\ "        .looool       .;::coooodo.",
						\ "          .cool         'ccoooc.  ",
						\ "            .co          .:o:.    ",
						\ "              .           .'  vim    ",
						\]
		" }}}
		" {{{ buftabline
		" moved to colorscheme file
		" hi BufTabLineActive ctermbg=8 ctermfg=7
		" }}}
		" {{{ atags
			" map <Leader>t :call atags#generate()<cr>
			" let g:neotags_run_ctags = 0
		" }}}
		" {{{ limelight
		" " Color name (:help cterm-colors) or ANSI code
			let g:limelight_conceal_ctermfg = 'gray'
			let g:limelight_conceal_ctermfg = 240
		" }}}
		" {{{ vimtex
			" let g:vimtex_view_method="zathura"
			" let conceallevel=0
		" }}}
		" {{{ markdown preview
		let g:mkdp_browser = 'qutebrowser'
		" }}}
	" }}}
" }}}

" {{{ general settings
	" {{{ visual settings
		syntax on

		set cursorline
		" set termguicolors
		" let g:gruvbox_italic=1
		" colorscheme gruvbox

		colors term
		" colorscheme wal

		" set termguicolors
		" let ayucolor="mirage"
		" colorscheme ayu


		let &t_SI = "\<Esc>[6 q"
		let &t_SR = "\<Esc>[4 q"
		let &t_EI = "\<Esc>[2 q"

		set number
		set relativenumber

		set list
		set listchars=tab:\│\ ,trail:━
		" set listchars=tab:\¦\ ,trail:━
		" let g:indentLine_char = '│'
		let g:indentLine_char_list = ['│', '┆', '┊']
		let g:indentLine_color_term = 8
		" let g:indentLine_setConceal = 0


		set fillchars=vert:\│

		set lbr
		" set tw=300
		let &showbreak=' ▸ '

		" " {{{ 80 char line
		" 	augroup vimrc_autocmds
		" 		autocmd BufEnter * highlight OverLength ctermbg=0
		" 		autocmd BufEnter * match OverLength /\%>80v.\+/
		" 	augroup END
		" " }}}
	" }}}
	" {{{ statusline
		" {{{ old
			" set laststatus=1

			" set statusline=

			" " set statusline+=\[%{mode()}\]           " current mode
			" " set statusline+=\                       " blank space
			" set statusline+=%F                      " current file path
			" set statusline+=\                       " blank space
			" set statusline+=%y                      " filetype
			" set statusline+=\                       " blank space
			" set statusline+=%m                      " modified flag [+]
			" set statusline+=\                       " blank space

			" set statusline+=%=                      " right-align from now on

			" set statusline+=%{PasteForStatusline()} " paste flag
			" set statusline+=\                       " blank space
			" set statusline+=\(0x%-B\)\              " current char
			" set statusline+=%v                      " column number
			" set statusline+=\:                      " colon separator
			" set statusline+=%l                      " row number
			" set statusline+=\/                      " slash separator
			" set statusline+=%L                      " number of rows
			" set statusline+=\                       " blank space
			" set statusline+=%{winnr()}              " buffer number

			" set statusline+=\                       " blank space
			" set statusline+=[%{ALEGetStatusLine()}] " ALE

			" {{{ PasteForStatusline()
				function! PasteForStatusline()
					let paste_status = &paste
					if paste_status == 1
						return " [p] "
					else
						return ""
					endif
				endfunction
			" }}}
		" }}}

		set laststatus=2
		let g:currentmode={
					\ 'n'  : 'NORMAL ',
					\ 'no' : 'N·OPERATOR PENDING ',
					\ 'v'  : 'VISUAL ',
					\ 'V'  : 'V·LINE ',
					\ '' : 'V·BLOCK ',
					\ 's'  : 'SELECT ',
					\ 'S'  : 'S·LINE ',
					\ '' : 'S·BLOCK ',
					\ 'i'  : 'INSERT ',
					\ 'R'  : 'REPLACE ',
					\ 'Rv' : 'V·REPLACE ',
					\ 'c'  : 'COMMAND ',
					\ 'cv' : 'VIM EX ',
					\ 'ce' : 'EX ',
					\ 'r'  : 'PROMPT ',
					\ 'rm' : 'MORE ',
					\ 'r?' : 'CONFIRM ',
					\ '!'  : 'SHELL ',
					\ 't'  : 'TERMINAL '}

		hi PrimaryBlock   ctermfg=07   ctermbg=0
		hi SecondaryBlock ctermfg=15   ctermbg=0
		hi TrinaryBlock   ctermfg=6    ctermbg=0
		hi Blanks         ctermfg=none ctermbg=0

		set statusline=
		" set statusline+=%#PrimaryBlock#
		set statusline+=\ %{g:currentmode[mode()]}
		set statusline+=%#SecondaryBlock#
		set statusline+=%{StatuslineGit()}
		set statusline+=%#TrinaryBlock#
		set statusline+=\ %t
		set statusline+=%(%m%)
		set statusline+=%#Blanks#
		set statusline+=%=
		set statusline+=%#SecondaryBlock#
		set statusline+=\%p%%
		set statusline+=\ %l:%c
		set statusline+=%#PrimaryBlock#
		set statusline+=\ [%Y]

		function! GitBranch()
			return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
		endfunction

		function! StatuslineGit()
			let l:branchname = GitBranch()
			return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
		endfunction

	" }}}
	" {{{ tab
		set smarttab

		set shiftwidth=4
		set tabstop=4
		set softtabstop=4
		set noexpandtab

		set ai
		set si
		set wrap
	" }}}
	" {{{ fold settings
		set foldmethod=marker
	" }}}
	" {{{ search
		set ignorecase
		set smartcase

		set hlsearch
		set incsearch
	" }}}
	" {{{ set cursor to last known position
		autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\ exe "normal! g`\"" |
			\ endif
	" }}}
	" {{{ errorbell
		set noerrorbells
		set novisualbell
		set t_vb=
		set tm=500
	" }}}
	" {{{ backup files
		set undofile
		set undodir=~/.config/nvim/bak

		set nobackup
		set nowb
		set noswapfile
	" }}}
	" {{{ various
		" filetype plugin indent on
		set nocompatible
		set wildmenu
		set hidden
		set encoding=utf8
		set lazyredraw
		set showmatch
		set showcmd

		set backspace=eol,start,indent
		set whichwrap+=<,>,h,l

		set so=7
	" }}}
" }}}

" {{{ mappings
	" {{{ leader mappings
		nnoremap <leader>w :w<cr>
		nnoremap <leader>q :q!<cr>

		nnoremap <leader>s :%s/\<<C-r><C-w>\>/
		nnoremap <leader>x :%g/\<<C-r><C-w>\>/d

		nnoremap <leader>o o<esc>k
		nnoremap <leader>O O<esc>j

		nnoremap <leader>l :bnext<cr>
		nnoremap <leader>h :bprevious<cr>

		nnoremap <leader>b :Buffer<cr>
		nnoremap <leader>m :Marks<cr>
		nnoremap <leader>e :Files<cr>
		nnoremap <leader>f :NERDTreeToggle<cr>
		" nnoremap <leader>s :Startify<cr>

		nnoremap <silent> <leader>n :noh<cr>

		nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

		nnoremap <leader>= <esc>mmgg=G`m
		nnoremap <silent> <leader>d :%s/\s\+$//e<cr>

		nnoremap <leader>g :Goyo x70% <bar> Limelight!!<cr>


		" {{{ fzf
		nmap <leader><tab> <plug>(fzf-maps-n)
		xmap <leader><tab> <plug>(fzf-maps-x)
		omap <leader><tab> <plug>(fzf-maps-o)
		" }}}
	" }}}
	" {{{ no leader
		nnoremap j gj
		nnoremap k gk
		nnoremap Y y$
		set pastetoggle=<F6>

		autocmd Filetype cpp map <F5> :make run<CR>

		" {{{ fzf
		imap <c-x><c-k> <plug>(fzf-complete-word)
		imap <c-x><c-f> <plug>(fzf-complete-path)
		imap <c-x><c-j> <plug>(fzf-complete-file-ag)
		imap <c-x><c-l> <plug>(fzf-complete-line)
		" }}}
	" }}}
	" {{{ commands
		cmap w!! w suda://%
	" }}}
" }}}
