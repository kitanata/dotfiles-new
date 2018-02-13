" ==========================================================
" Kitanata's Noble VIM Configuration
" ==========================================================

" ==========================================================
" Setup Bundles - Vundle is awesome! Thanks gmarik
" ==========================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
"  " required! 
Plugin 'gmarik/vundle'

" Github Repos
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
" Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/Liquid-Carbon'
Plugin 'godlygeek/tabular'
" Plugin 'rizzatti/dash.vim'
Plugin 'sunaku/vim-dasht'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'
Plugin 'janko-m/vim-test'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-obsession'
Plugin 'MattesGroeger/vim-bookmarks'

call vundle#end()
filetype plugin indent on

set guifont=Anonymous_Pro:h18

" Other Repos

" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ctrl-jklm switch between buffers
map <c-l> :bn<CR> 
map <c-h> :bp<CR>

map <s-l> :tabn<CR>
map <s-h> :tabp<CR>

" CTRL-P
let g:ctrlp_max_depth=40 "scan deep
let g:ctrlp_max_files=50000 "scan deep
let g:ctrlp_custom_ignore = 'node_modules'

nnoremap <leader>. :CtrlPTag<cr>

" Bookmarks
nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>mf <Plug>BookmarkShowAll
nmap <Leader>mj <Plug>BookmarkNext
nmap <Leader>mk <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll
nmap <Leader>mkk <Plug>BookmarkMoveUp
nmap <Leader>mjj <Plug>BookmarkMoveDown
nmap <Leader>mg <Plug>BookmarkMoveToLine

" Open NerdTree
map <leader>N :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0

" Airline Options
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#enabled = 1

" Syntastic Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enable Rubocop for Ruby
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" Test Options
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tg :TestVisit<CR>

let test#strategy = "vtr"
let g:test#javascript#mocha#executable = './node_modules/.bin/mocha --require test/setup-tests.js'

" Fixes single buffer bug with Airline
set laststatus=2

" YouCompleteMe
nnoremap <silent> <Leader>fd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>fi :YcmCompleter GoToImplementation<CR>
nnoremap <silent> <Leader>fr :YcmCompleter GoToReferences<CR>

" JEDI
let g:jedi#use_tabs_not_buffers = 0

" DASH Integration For Dash.app (no longer used)
" :nmap <silent> <leader>d <Plug>DashSearch
" let g:dash_activate = 0 "HUD mode not APP mode

" DASH Integration For Dasht
" search related docsets ,k
nnoremap <silent> <Leader>k :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>

" search ALL the docsets ,K
nnoremap <silent> <Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<Return>

" search related docsets
nnoremap <Leader>s :Dasht<Space>

" search ALL the docsets
nnoremap <Leader><Leader>S :Dasht!<Space>

let g:dasht_filetype_docsets = {} " filetype => list of docset name regexp
let g:dasht_filetype_exclude_docsets = {} " filetype => list of docset name regexp to exclude from lookup

" fast grepping of files

" JavaScript 
map <Leader>gjs :Dispatch~/code/ripgrep.py -srnw --exclude=.git --exclude=node_modules --include=\*.js <cword> src<CR>
map <Leader>gjt :Dispatch ~/code/ripgrep.py -srnw --exclude=.git --exclude=node_modules --include=\*.js <cword> test<CR>

" Rails
map <Leader>grs :Dispatch ~/code/ripgrep.py -srnw --exclude=.git --exclude=vendor --exclude-dir="spec" --include=\*.rb <cword> engines<CR>
map <Leader>grt :Dispatch ~/code/ripgrep.py -srnw --exclude=.git --exclude=vendor --exclude-dir="app" --include=\*.rb <cword> engines<CR>
map <Leader>gra :Dispatch ~/code/ripgrep.py -srnw --exclude=.git --include=\*.rb <cword> .<CR>

" Open and close the QuickFix Window
map <Leader>c :cclose<CR>
map <Leader>C :copen<CR>

" When in Python, also search NumPy, SciPy, and Pandas:
" let g:dasht_filetype_docsets['python'] = ['(num|sci)py', 'pandas']

" When in HTML, also search CSS, JavaScript, Bootstrap, and jQuery
let g:dasht_filetype_docsets['html'] = ['css', 'js', 'bootstrap']

" When in Ruby, also search Rails
let g:dasht_filetype_docsets['ruby'] = ['rails']

" When in JavaScript, also search lodash, react, react_native, and redux
let g:dasht_filetype_docsets["javascript"] = ["Lo-Dash", "redux"]
let g:dasht_filetype_docsets["jsx"] = ["react", "react_native"]
let g:dasht_filetype_exclude_docsets["jsx"] = ["jsx"]

" Markdown Preview
let vim_markdown_preview_hotkey='<leader>m'
let vim_markdown_preview_github=1

" Markdown TableFormat w/ Tabular
" map <leader>t :TableFormat<CR>

" Tabular Tables
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" 
" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction
"

" ==========================================================
" Basic Settings
" ==========================================================

syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
filetype plugin on

set number                    " Display line numbers
set hidden                    " Hide file buffers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" ============================================================
" Make Vim work with watchdog, guard, and sniffer
" ============================================================
set nobackup
set noswapfile
set nowritebackup

if has('gui_running')
    colorscheme liquidcarbon
    set columns=142
    set lines=60
endif

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window

" show a line at column 79
 if exists("&colorcolumn")
    set colorcolumn=80
endif


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word

" set autoindent              " always set autoindenting on
" set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Jedi Popup on Dot
let g:jedi#popup_on_dot = 0

" Ruby, Coffee, HAML, SASS (Facio)
au FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 cindent cinwords=if,else,while,do,for,switch,case
au FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2 cindent cinwords=if,else,while,do,for,switch,case
au Filetype eco setlocal shiftwidth=2 tabstop=2 softtabstop=2 cindent cinwords=if,else,while,do,for,switch,case
au Filetype haml setlocal shiftwidth=2 tabstop=2 softtabstop=2 cindent cinwords=#,. cinkeys-=0# indentkeys-=0#
au Filetype javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 cindent cinwords=#,. cinkeys-=0# indentkeys-=0#

" YAML Indent
au FileType yml setlocal shiftwidth=2 tabstop=2 softtabstop=2 indentkeys-=0#
