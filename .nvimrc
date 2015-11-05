if has('nvim')
  runtime! plugin/python_setup.vim
endif

silent !mkdir -p "$HOME/.nvim/undodir"
silent !mkdir -p "$HOME/.nvim/autoload"

if !filereadable(expand('~/.nvim/autoload/plug.vim'))
  ![[ -n "$(pacman -Qs the_silver_searcher)" ]] || sudo pacman -S the_silver_searcher --noconfirm --needed  !
  ![[ -n "$(pacman -Qs ctags)" ]] || !sudo pacman -S ctags --noconfirm --needed
  !nvim +'PlugUpdate | quit!'
  quit!
endif

set rtp+=/usr/share/ocamlmerlin/vim

call plug#begin('~/.nvim/plugged')

" Plug 'airblade/vim-gitgutter'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'xolox/vim-lua-inspect'
" NeoBundle 'Mizuchi/STL-Syntax'
" NeoBundle 'sheerun/vim-polyglot'
" Plug 'Raimondi/delimitMate'
" Plug 'marijnh/tern_for_vim'
" Plug 'lambdalisue/vim-gita'
" Plug 'floobits/floobits-neovim'
" Plug 'wincent/ferret' " Works like shit
" Plug 'baabelfish/mycolors'

let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#303030'
" Plug 'Yggdroot/indentLine'

let g:tsuquyomi_disable_quickfix = 1
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-jade'

let g:move_key_modifier = 'A-C'
Plug 'matze/vim-move'

Plug 'gabesoft/vim-ags'

Plug 'jreybert/vimagit'
Plug 'rgrinberg/vim-ocaml'
Plug 'the-lambda-church/merlin', { 'do': 'cd ~/.nvim/plugged/merlin && ./configure --bindir /usr/bin --sharedir /usr/share --vimdir /usr/share/ocamlmerlin/vim && make && clear && sudo make install' }
Plug 'int3/vim-extradite'
Plug 'digitaltoad/vim-jade'
Plug 'KabbAmine/zeavim.vim'
Plug 'tsukkee/unite-help'
Plug 'irrationalistic/vim-tasks'
Plug 'blueyed/vim-diminactive'
Plug 'sunaku/vim-shortcut'
Plug 'habamax/vim-skipit'
Plug 'cosminadrianpopescu/vim-sql-workbench'
Plug 'morhetz/gruvbox'
Plug 'dyng/ctrlsf.vim'
Plug 'AndrewRadev/gapply.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Matt-Stevens/vim-systemd-syntax'
Plug 'PeterRincker/vim-argumentative'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Raimondi/delimitMate', { 'for': 'clojure' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'Shougo/unite.vim'
Plug 'lambdalisue/unite-grep-vcs'
Plug 'Shougo/vimproc.vim', { 'do': 'cd ~/.nvim/plugged/vimproc.vim && make -f make_unix.mak' }
Plug 'SirVer/ultisnips'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe', { 'do': 'cd ~/.nvim/plugged/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang' }
Plug 'baabelfish/a.vim'
Plug 'baabelfish/nimtools'
Plug 'zah/nim.vim'
Plug 'baabelfish/vim-dispatch'
Plug 'baabelfish/vim-droid256'
Plug 'baabelfish/vim-vertigo'
Plug 'bling/vim-airline'
Plug 'bps/vim-textobj-python'
Plug 'chrisbra/NrrwRgn'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'flazz/vim-colorschemes'
Plug 'glts/vim-textobj-comment'
Plug 'gregsexton/gitv'
Plug 'groenewege/vim-less'
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'guns/vim-slamhound'
Plug 'haya14busa/incsearch.vim'
Plug 'idanarye/vim-casetrate'
Plug 'idanarye/vim-dutyl'
Plug 'idanarye/vim-merginal'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'
Plug 'jwhitley/vim-matchit'
Plug 'kana/vim-arpeggio'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lambdalisue/vim-gita'
Plug 'lambdalisue/vim-manpager'
Plug 'leafo/moonscript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'mrtazz/DoxygenToolkit.vim'
" Plug 'scrooloose/syntastic'
" Plug 'myint/syntastic-extras'
Plug 'osyo-manga/vim-hopping'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'peterhoeg/vim-qml'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mickaobrien/vim-stackoverflow'

let g:neomake_error_sign = {
    \ 'text': '✖',
    \ 'texthl': 'SyntasticErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '✗',
    \ 'texthl': 'SyntasticWarningSign',
    \ }
let g:neomake_informational_sign = {
    \ 'text': 'ℹ',
    \ 'texthl': 'SyntasticInfoSign',
    \ }
let g:neomake_message_sign = {
    \ 'text': '➤',
    \ 'texthl': 'SyntasticMsgSign',
    \ }
Plug 'benekastah/neomake'
" Plug 'baabelfish/neomake'

Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
Plug 'tommcdo/vim-express'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tommcdo/vim-kangaroo'
Plug 'tommcdo/vim-lion'
Plug 'tommcdo/vim-ninja-feet'
Plug 'tomtom/tComment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/Vimchant'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/django.vim'
Plug 'vim-scripts/octave.vim--'
Plug 'vim-scripts/surrparen'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc'
Plug 'lambdalisue/vim-manpager'
Plug 'peterhoeg/vim-qml'
Plug 't9md/vim-choosewin'

call plug#end()

filetype plugin indent on

if has("multi_byte") && has("starting")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  " set encoding=utf-8
  setglobal fileencoding=utf-8
  scriptencoding utf-8
endif

if &shell =~# 'fish$'
  set shell=/bin/zsh
endif

" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread
set backspace=indent,eol,start
set complete-=i
set completeopt=menu,longest previewheight=2 pumheight=40
set conceallevel=0
set cscopetag
set cursorline
set display+=lastline " FIXME
" set fillchars+=vert: 
" set fillchars+=vert:│
set fillchars+=vert: 
set formatoptions=qrn1tj tw=400 " tcqj
set gdefault smartcase ignorecase incsearch
set hidden
set history=100
set langmenu=en_US.UTF-8
set laststatus=2
set list listchars=tab:→\ ,extends:▸,precedes:◂,nbsp:␣
set magic
set modelines=0
set mouse=
set nofoldenable foldmethod=manual foldlevel=999
set noshowmode
set nospell
set noswapfile
set notimeout
set nrformats-=octal
set number numberwidth=4
set path+=.,**,,
set regexpengine=1
set scrolljump=8 sidescroll=1
set shortmess+=filmnrxoOtTI
set showcmd
set showfulltag
set splitbelow splitright
set suffixesadd=.java,.py,.cpp,.hpp,.html,.js,.hh,.h,.c,.cc,.sh,.md,.json
set synmaxcol=1024
set novisualbell noerrorbells
set tildeop
set titlestring=Vim:\ %f\ %h%r%m
set expandtab shiftround copyindent preserveindent
set ts=4 sts=4 sw=4 ttimeout ttimeoutlen=0 lazyredraw
set undofile undolevels=1000 undoreload=10000 undodir=~/.nvim/undodir nobackup
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=block
set wildignore+=*/components/*,*/node_modules/*,*/bower_modules/*,*/tmp/*,*.so,*.swp,*.zip,*/doxygen/*,*.o,*.pyc,*.aux,*.toc,*.tar,*.gz,*.svg,*.mdr,*.mdzip,*.blg,*.bbl,*.out,*.log,*.zip,*.pdf,*.bst,*.jpeg,*.jpg,*.png,*.a,*.so,*.exe,*.dll,*.bak,*.,*.class,*.meta,*.lock,*.orig,*.jar,*/hg/*,git/*,*/bzr/*
set wildmenu wildignorecase wildmode=longest:full,full
set wrapmargin=0 nowrap linebreak breakat+=" "

if has("gui_running")
  set number
  set guifont=Termsyn\ 10
  set guicursor+=a:blinkon0
endif


" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType typescript setlocal completeopt+=preview
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType plaintex set filetype=tex
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd BufWritePre *.hh,*.m,*.h,*.c,*.mm,*.cpp,*.hpp call StripTrailingWhitespace()
autocmd BufWritePre *.java,*.php,*.feature call StripTrailingWhitespace()
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml,*.erb,*.haml call StripTrailingWhitespace()
autocmd FileType cpp set nowrap
autocmd FileType javascript set filetype=typescript
autocmd FileType ejs set filetype=typescript
autocmd FileType fish set filetype=sh
autocmd FileType html setlocal indentkeys-=*<Return> " Fix html indentation
autocmd FileType matlab set filetype=octave
autocmd InsertLeave * set nopaste
autocmd Syntax * RainbowParanthesesLoadRound
autocmd VimEnter * RainbowParenthesesToggle
autocmd VimResized * exe "normal! \<c-w>="
autocmd FileType html nnoremap <buffer><leader>F :%!tidy -q -i --show-errors  0 -xml<cr>
autocmd! BufWritePost * Neomake
autocmd! BufEnter * Neomake
" autocmd CursorHold * SyntasticCheck


" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = 'ö'
let maplocalleader = 'ä'
nnoremap <F3> :set paste! \| echo ""<cr>
inoremap <F3> <c-o>:set paste! \| echo ""<cr>

" Window related
inoremap <C-q> <C-o>ciW
inoremap <A-q> <Esc><C-w>c:echo ""<cr>
inoremap <A-z> <C-o>zz
" FIXME: clojure...
nnoremap <A-H> H
nnoremap <A-J> J
nnoremap <A-K> K
nnoremap <A-L> L
nnoremap <A-Q> :tabclose<cr>:echo ""<cr>
" nnoremap <A-R> R
" nnoremap <A-W> :BF<cr>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-m> <C-w>v
nnoremap <A-M> <C-w>s
nnoremap <A-q> <C-w>c
nnoremap <A-r> r
nnoremap <A-w> :BB<cr>
nnoremap <leader>1 1<C-w><C-w>
nnoremap <leader>2 2<C-w><C-w>
nnoremap <leader>3 3<C-w><C-w>
nnoremap <leader>4 4<C-w><C-w>
nnoremap <leader>5 5<C-w><C-w>
nnoremap <leader>6 6<C-w><C-w>
nnoremap <leader>7 7<C-w><C-w>
nnoremap <leader>8 8<C-w><C-w>
nnoremap <leader>9 9<C-w><C-w>
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<cr>
" nnoremap <silent><space>r :Root<cr>

" Custom function callers
inoremap <silent><A-c> <C-o>:call ColorPicker(1)<cr>
nnoremap <silent><A-F> :call NoDistraction()<cr>:echo ""<cr>
nnoremap <silent><A-f> :call Fullscreen()<cr>:echo ""<cr>
nnoremap <silent><space>C :call ToggleConceal()<cr>

" Plugin related
nnoremap <silent><space><return> :call Shortcut_discover()<cr>
snoremap <silent><C-^> <Plug>(TsuquyomiReferences)
nnoremap <space>ct :YcmCompleter GetType<cr>
nnoremap <space>gt :YcmCompleter GoTo<cr>
nnoremap <silent><F5> :UndotreeToggle<cr>
nnoremap <silent><c-b> :w\|Make<cr>
nnoremap <silent><space><c-b> :Make! clean<cr>
nnoremap <space>bf :vimgrep /FIXME/gj ** \| :cw<cr>
nnoremap <space>bt :vimgrep /TODO/gj ** \| :cw<cr>
nnoremap <space>bw :vimgrep /<C-r><C-w>/gj ** \| :cw<cr>
nnoremap <space>bp :vimgrep /<C-r>"/gj ** \| :cw<cr>
nnoremap <space>B :vimgrep //gj ** \| :cw<left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <silent><space>M :Vex<cr>
nnoremap <silent><space>m :Sex<cr>
nnoremap <silent><space>N :cprev<cr>
nnoremap <silent><space>n :cnext<cr>
nnoremap <silent><leader>j :<C-U>VertigoDown n<cr>
nnoremap <silent><leader>k :<C-U>VertigoUp n<cr>
onoremap <silent><leader>j :<C-U>VertigoDown o<cr>
onoremap <silent><leader>k :<C-U>VertigoUp o<cr>
vnoremap <silent><leader>j :<C-U>VertigoDown v<cr>
vnoremap <silent><leader>k :<C-U>VertigoUp v<cr>
nmap <tab><enter> <Plug>(LiveEasyAlign)
vmap <tab><enter> <Plug>(LiveEasyAlign)
vmap <tab><tab> :EasyAlign*\ <cr>
vmap <tab>1 :EasyAlign1\ <cr>
vmap <tab>2 :EasyAlign2\ <cr>
vmap <tab>3 :EasyAlign3\ <cr>
vmap <tab>4 :EasyAlign4\ <cr>
vmap <tab>= :EasyAlign=<cr>
vmap <tab>: :EasyAlign:<cr>
nnoremap <silent><space>O :Unite -silent tab<cr>
nnoremap <silent><space>P :call RunFileFinder()<cr>
nnoremap <silent><space>p :call RunFileFinderGit()<cr>
nnoremap <silent><space>a :Unite grep:.::\\.(filter\|provider\|controller\|directive\|factory\|service)\\(\\'.+\\'<cr>
" nnoremap <silent><space>P :CtrlPCurWD<cr>
nnoremap <silent><space>o :Unite -silent buffer_tab<cr>
nnoremap <silent><space>f m':Unite outline<cr>
nnoremap <silent><space>F :CtrlPFunky<cr>
nnoremap <silent><space>l :CtrlPLine<cr>
nnoremap <silent><space>y m':Unite -silent history/yank<cr>

" nnoremap <leader>gj <plug>(signify-next-hunk)
" nnoremap <leader>gk <plug>(signify-prev-hunk)
nmap <leader><space>j <plug>(signify-next-hunk)
nmap <leader><space>k <plug>(signify-prev-hunk)
nnoremap <space>cc :Connect nrepl://localhost:8110<cr><cr>
nnoremap <silent><space>g/ :HoppingStart<cr>
map <space>/  <Plug>(incsearch-forward)
map <space>?  <Plug>(incsearch-backward)
nnoremap gT :YcmCompleter GetType<cr>
nnoremap gt :YcmCompleter GoTo<cr>
nmap [; <Plug>Argumentative_Prev
nmap ]; <Plug>Argumentative_Next
xmap [; <Plug>Argumentative_XPrev
xmap ]; <Plug>Argumentative_XNext
nmap <; <Plug>Argumentative_MoveLeft
nmap >; <Plug>Argumentative_MoveRight
xmap i; <Plug>Argumentative_InnerTextObject
xmap a; <Plug>Argumentative_OuterTextObject
omap i; <Plug>Argumentative_OpPendingInnerTextObject
omap a; <Plug>Argumentative_OpPendingOuterTextObject
nnoremap <space>gd :!nim c --debugger:native % && cgdb %:r<cr>
nnoremap <silent><leader>f :ChooseWin<cr>
nnoremap <silent><leader>F :ChooseWinSwap<cr>


function! RunFileFinderGit()
    let g:unite_source_rec_async_command = 'git ls-files'
    execute ":Unite -silent file_rec/async"
endfunction


function! RunFileFinder()
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --column -S --ignore ".git" --hidden -g "" --silent'
    execute ":Unite -silent file_rec/async"
endfunction


" Vim builtin overrides
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
nnoremap <C-m> <C-a>
nnoremap K i<cr><Esc>k$
nnoremap Y y$
nnoremap ` '
nnoremap ' `
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
nnoremap x "_x
vnoremap x "_x
nnoremap gV `[v`]
nnoremap <expr> gP '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <silent># :set hlsearch<cr>:norm! #<cr>
nnoremap <silent>* :set hlsearch<cr>:norm! *<cr>
nnoremap H ^
nnoremap L $
nnoremap <silent><leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>
inoremap <c-l> <c-x><c-l>
inoremap <c-f> <c-x><c-f>
inoremap <c-e> <c-x><c-o>
nnoremap <A-up> :resize +5<cr>
nnoremap <A-down> :resize -5<cr>
nnoremap <A-left> :vertical resize +5<cr>
nnoremap <A-right> :vertical resize -5<cr>

nnoremap J mzJ`z

" Shell interaction
nnoremap <A-S> :shell<cr>
" nnoremap <silent><leader>C :!clear && octave -q %<cr>
nnoremap <silent><leader>umlc :!suml --font-family=termsyn --png --class "$(cat %)" > %.png && feh %.png <cr> <cr>
nnoremap <silent><leader>umls :!suml --png --sequence "$(cat %)" > %.png && feh %.png <cr><cr>
nnoremap <silent><space>T :!export TERM=screen-256color && tig<cr><cr>
" vnoremap <leader>C :w !octave -q<cr>
" vnoremap <leader>c :!octave --silent --no-window-system\|cut -c8-<cr>

" Refactoring
nnoremap <leader>* :%s/\<<C-r><C-w>\>/
nnoremap S yiwvip:s/<C-r>0/

" Misc
nnoremap <silent><leader><leader>s :so ~/.nvimrc<cr>
nnoremap <silent><leader><leader>v :e ~/.nvimrc<cr>
nnoremap <silent><leader><leader>y :e ~/.ycm_extra_conf.py<cr>
nnoremap <silent><leader>w :set wrap!<cr>
nnoremap <silent><space><space> :set nohls!<cr>
nnoremap <silent><space>D :cd %:p:h<cr>
nnoremap <silent><space>d :lcd %:p:h<cr>
nnoremap Ä :w<cr>
nnoremap <leader>§ :let @q='<C-r><C-r>q'
nnoremap § qqqqq
nnoremap ¤ :'<,'>g/^/norm! 
vnoremap ¤ :g/^/norm! 
nmap ½ @q
vmap ½ @q
nnoremap å :w<cr>
nnoremap Å :Gwrite<cr>
nnoremap <space>Å :Gcommit<cr>
nnoremap <space>åi :w \| source $MYVIMRC \| PlugInstall<cr>
nnoremap <space>åu :w \| source $MYVIMRC \| PlugUpdate<cr>
nnoremap <space>åc :w \| source $MYVIMRC \| PlugClean<cr>

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

" Ex stuff
nnoremap <leader>m :move.<left><left><left><left><left>
vnoremap <leader>m :.move
nnoremap <leader>M :.move
nnoremap <leader>c :copy.<left><left><left><left><left>
vnoremap <leader>c :copy.
nnoremap <leader>C :.copy

" From others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://bitbucket.org/s/dotfiles/src/tip/vim/vimrc
nnoremap <silent><leader>h1 :match InterestingWord2 /\<<c-r><c-w>\>/<cr>
nnoremap <silent><leader>h2 :2match InterestingWord1 /\<<c-r><c-w>\>/<cr>
nnoremap <silent><leader>h3 :3match InterestingWord5 /\<<c-r><c-w>\>/<cr>
nnoremap <silent><leader>H1 :match<cr>
nnoremap <silent><leader>H2 :2match<cr>
nnoremap <silent><leader>H3 :3match<cr>

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:BASH_Ctrl_j = 'off'

let g:python_host_skip_check=1

" let g:airline_branch_prefix = ''
let g:airline_detect_iminsert=0
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#paste#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_exclude_preview = 0
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#trailing_format = '%s'
let g:airline#extensions#whitespace#mixed_indent_format = '%s'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'v',
      \ 'V'  : 'V',
      \ '' : '^V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

let g:AutoPairsShortcutToggle = '<A-a>'
" let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

let BckOptions = 'cirw'

let g:bl_no_implystart = 1

" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_max_height = 40
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


let g:cpp_class_scope_highlight = 1


let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace", "defroutes", "GET", "POST", "PUT", "DELETE"]
    \ }

let g:clang_user_options="-std=c++1y"

let g:clang_format#style_options = {
      \"BasedOnStyle": "LLVM",
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "Standard" : "C++11",
      \ "BreakBeforeBraces" : "Stroustrup"}

" let g:clojure_fuzzy_indent = 1
" let g:clojure_fuzzy_indent_patterns = ['.']
" let g:clojure_fuzzy_indent_blacklist = []

let g:goyo_width = 120

let g:undotree_WindowLayout = 2

let g:gitgutter_max_signs = 4000
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_signs = 1

let g:indentLine_faster = 1

let g:livepreview_previewer = 'zathura'

let g:lua_check_syntax = 0

let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10

" let NERDTreeDirArrows = 0
let NERDTreeHijackNetrw = 0
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0

let g:neomake_verbose = 0

let g:plug_window = 'topleft new'

let g:pydiction_location = '/usr/share/pydiction/complete-dict'

let g:sexp_enable_insert_mode_mappings = 0

let g:signify_disable_by_default = 1
let g:signify_update_on_bufenter = 1
let g:signify_sign_add               = '»'
let g:signify_sign_change            = '∙'
let g:signify_sign_delete            = '†'
let g:signify_sign_delete_first_line = '»'
let g:signify_sign_overwrite = 0

let g:startify_bookmarks = [ '~/.nvimrc' ]
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0
let g:startify_enable_special = 1
let g:startify_list_order = ['bookmarks', 'sessions', 'files']
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_persistence = 2
let g:startify_show_files_number = 30
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc'
      \ ]
let g:startify_custom_header = [
      \'',
      \'     _/      _/  _/',
      \'    _/      _/      _/_/_/  _/_/',
      \'   _/      _/  _/  _/    _/    _/',
      \'    _/  _/    _/  _/    _/    _/',
      \'     _/      _/  _/    _/    _/',
      \'',
      \'',
      \ ]

let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt/QtCore', '/usr/include/qt/QtGui' ]
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_javascript_checkers = ['jslint', 'jshint']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html', 'ts', 'tsc', 'typescript'] }
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_warning_symbol='✗'

let g:choosewin_overlay_enable = 0
let g:choosewin_blink_on_land  = 0
let g:choosewin_label = 'ASDFGHJKLZXCV'
let g:choosewin_label_align = 'left'
let g:choosewin_label_padding = 0
let g:choosewin_return_on_single_win = 1
let g:choosewin_label_fill = 1
let g:choosewin_color_label = {
    \ 'gui': ['#202020', '#22ff22', 'bold'],
    \ }
let g:choosewin_color_other = {
    \ 'gui': ['#202020', '#22ff22'],
    \ }

let g:switch_custom_definitions =
      \ [
      \  ['yes', 'no' ],
      \  ['horizontal', 'vertical' ],
      \  ['resolve', 'reject' ],
      \  ['on', 'off' ],
      \  ['active', 'passive' ],
      \  ['start', 'stop' ],
      \  ['begin', 'end' ],
      \  ['float', 'double' ],
      \  ['up', 'right', 'left', 'down' ]
      \ ]

let g:tagbar_left = 0
" let g:tagbar_width = 36
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
  \ }

let g:indentLine_color_term = 236
let g:indentLine_char = '│'

let g:omni_sql_no_default_maps = 1

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsListSnippets="<c-r><tab>"
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetDirectories = ["ultisnips"]

let g:unite_enable_ignore_case = 1
let g:unite_enable_start_insert = 1
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable =1
let g:unite_split_rule = 'bot'
let g:unite_winheight = 15

let g:Vertigo_homerow = 'asdfghjklp'
let g:Vertigo_homerow_onedigit = 'ASDFGHJKLP'

let g:vimchant_spellcheck_lang = 'fi'

let g:targets_argOpening = '[({[<]'
let g:targets_argClosing = '[]})>]'

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<c-e>'
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_server_log_level = 'error'
let g:ycm_filetype_blacklist = {
      \ 'gitcommit' : 1,
      \ 'markdown' : 1,
      \ 'notes' : 1,
      \ 'tex' : 1,
      \ 'text' : 1,
      \ 'unite' : 1,
      \ 'sql' : 1,
      \ 'vim' : 1,
      \ 'typescript' : 1,
      \}
      " \ 'javascript' : 1,
let g:ycm_semantic_triggers = {
      \ 'clojure' : ['(', '/'],
      \ 'nim' : ['.'],
      \ }

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Colorscheme
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:droid_transparent = 1

syntax on

if has("gui_running")
  colorscheme gotham
elseif &t_Co == 256 
  colorscheme gotham
else
  colorscheme delek
endif

let g:used_javascript_libs = 'angularjs,angularui,angularuirouter,chai,underscore'

hi ColorColumn       guibg=#0c0c0c

" hi Normal            guifg=#99d1ce guibg=none    gui=none
hi Normal            guifg=#99d1ce guibg=#111111    gui=none
hi NonText           guifg=#111111 guibg=none    gui=none
hi VertSplit         guifg=#222222 guibg=none
hi CtrlPNoEntries    guifg=#FF8B00 guibg=none
hi CtrlPMatch        guifg=#BAFF00 guibg=none
hi CtrlPLinePre      guifg=none    guibg=none
hi CtrlPPrtBase      guifg=#A8A8A8 guibg=none
hi CtrlPPrtText      guifg=#C8C8C8 guibg=none
hi CtrlPPrtCursor    guifg=none    guibg=none
hi CtrlPTabExtra     guifg=#FFFFFF guibg=none
hi CtrlPBufName      guifg=#FFFFFF guibg=none
hi CtrlPTagKind      guifg=#FFFFFF guibg=none
hi CtrlPqfLineCol    guifg=#FFFFFF guibg=none
hi CtrlPUndoT        guifg=#FFFFFF guibg=none
hi CtrlPUndoBr       guifg=#FFFFFF guibg=none
hi CtrlPUndoNr       guifg=#FFFFFF guibg=none
hi CtrlPUndoSv       guifg=#FFFFFF guibg=none
hi CtrlPUndoPo       guifg=#FFFFFF guibg=none
hi CtrlPBookmark     guifg=#FFFFFF guibg=none
" hi mbechanged              guifg=255     guibg=none    gui=none
" hi mbenormal               guifg=187     guibg=none    gui=none
" hi mbevisiblechanged       guifg=255     guibg=none    gui=none
" hi mbevisiblenormal        guifg=252     guibg=none    gui=none
" hi multiple_cursors_cursor guifg=232     guibg=none
" hi perlspecialmatch        guifg=176     guibg=none    gui=none
" hi perlspecialstring       guifg=176     guibg=none    gui=none
" hi taglisttagname          guifg=105     guibg=none    gui=none
hi SignColumn        guifg=none    guibg=#111111    gui=none
hi SignifyLineAdd    guifg=none    guibg=#032007 gui=bold
hi SignifyLineChange guifg=none    guibg=#1F1900 gui=bold
hi SignifyLineDelete guifg=none    guibg=#180505 gui=bold
hi SignifySignAdd    guifg=#36bF2A guibg=none    gui=bold
hi SignifySignChange guifg=#bFb92A guibg=none    gui=bold
hi SignifySignDelete guifg=#bB0F0F guibg=none    gui=bold
hi InterestingWord1  guifg=#000000 guibg=#7aa06b
hi InterestingWord2  guifg=#000000 guibg=#d2e564
hi InterestingWord3  guifg=#000000 guibg=#0097c1
hi InterestingWord4  guifg=#000000 guibg=#22ff22
hi InterestingWord5  guifg=#000000 guibg=#0097c1
hi InterestingWord6  guifg=#000000 guibg=#0097c1

" Syntax
" hi Block                     guifg=#79AE4E  guibg=none gui=bold
" hi Boolean                     guifg=154  guibg=none gui=bold
" hi Character                   guifg=112  guibg=none gui=none
" hi Comment                     guifg=239  guibg=none gui=italic
" hi Constant                    guifg=154  guibg=none gui=bold
" hi Define                      guifg=129  guibg=none gui=none
" hi Delimiter                   guifg=106  guibg=none gui=none
" hi Exception                   guifg=252  guibg=none
" hi Float                       guifg=112  guibg=none gui=none
" hi Identifier                  guifg=255  guibg=none gui=italic
" hi Include                     guifg=245  guibg=none gui=none
" hi Keyword                     guifg=106  guibg=none gui=none
" hi Macro                       guifg=129  guibg=none gui=none
" hi Operator                    guifg=247  guibg=none
" hi PreCondit                   guifg=129  guibg=none gui=none
" hi PreProc                     guifg=200  guibg=none gui=none
" hi Special                     guifg=148  guibg=none gui=none
" hi StorageClass                guifg=245  guibg=none gui=none
" hi Structure                   guifg=246  guibg=none gui=bold
" hi Tag                         guifg=142  guibg=none gui=none
" hi Todo                        guifg=196  guibg=none gui=italic,bold
" hi Type                        guifg=148  guibg=none gui=italic
hi Function    guifg=#79EC1C guibg=none gui=bold
hi Number      guifg=#af5f87 guibg=none gui=none
hi Statement   guifg=#C16FE8 guibg=none gui=none
hi String      guifg=#79AE4E guibg=none gui=bold
hi Conditional guifg=#37BEBE guibg=none gui=bold

" Javascript is special
hi javaScriptNumber           guifg=#af5f87 guibg=none gui=none
hi javaScriptIdentifier       guifg=#DCB323 guibg=none gui=none
hi javaScriptBraces           guifg=#777777 guibg=none gui=none
hi javaScriptParens           guifg=#888888 guibg=none gui=none
hi javascriptRTop             guifg=#C99EFF guibg=none gui=none
hi javascript_collections     guifg=#C99EFF guibg=none gui=none
hi javascript_objects         guifg=#C99EFF guibg=none gui=none
hi javascript_lodash          guifg=#C99EFF guibg=none gui=none
hi javascript_arrays          guifg=#C99EFF guibg=none gui=none
hi javascript_chaining        guifg=#D9AEFF guibg=none gui=italic
hi javascript_chaining        guifg=#D9AEFF guibg=none gui=italic
hi javascriptBModelAttrs      guifg=#777777 guibg=none gui=none
hi javascriptBCollectionAttrs guifg=#779777 guibg=none gui=italic

" hi Cursor                      guifg=232  guibg=254  gui=none
" hi Debug                       guifg=214  guibg=none gui=none
" hi DiffAdd                     guifg=112  guibg=none gui=bold
" hi DiffChange                  guifg=220  guibg=none gui=bold
" hi DiffDelete                  guifg=160  guibg=none gui=bold
" hi Directory                   guifg=172  guibg=none gui=none
" hi EasyMotionTarget            guifg=46   guibg=233
" hi Error                       guifg=196  guibg=none gui=bold
hi ErrorMsg                    guifg=#ff9999  guibg=none gui=none
" hi Folded                      guifg=103  guibg=238  gui=none
" hi Label                       guifg=249  guibg=none gui=italic
" hi MatchParen                  guifg=118  guibg=none gui=underline
" hi ModeMsg                     guifg=249  guibg=none gui=none
" hi Question                    guifg=178  guibg=none gui=none
" hi Repeat                      guifg=254  guibg=none gui=bold
" hi Search                      guifg=227  guibg=none gui=bold
" hi SpecialKey                  guifg=235  guibg=none gui=none
" hi SpellBad                    guifg=166  guibg=none gui=none
" hi SpellCap                    guifg=166  guibg=none gui=none
" hi SpellLocal                  guifg=166  guibg=none gui=none
" hi SpellRare                   guifg=166  guibg=none gui=bold
" hi StartifyBracket             guifg=236
" hi StartifyHeader              guifg=154
" hi StartifyNumber              guifg=148
" hi StartifyPath                guifg=246
" hi StartifySlash               guifg=240
" hi StatusLine                  guifg=255  guibg=235  gui=none
" hi StatusLineNC                guifg=236  guibg=235  gui=none
" hi TabLine                     guifg=none guibg=none gui=none
" hi TabLineFill                 guifg=247  guibg=none gui=none
" hi TabLineSel                  guifg=none guibg=255  gui=none
" hi Title                       guifg=143  guibg=none gui=none
" hi Underlined                  gui=underline
" hi VertSplit                   guifg=236  guibg=none gui=none
" hi Visual                      guifg=none guibg=235  gui=none
" hi cformat                     guifg=176  guibg=238  gui=none
" hi cspecialcharacter           guifg=172  guibg=234  gui=none
" hi cspecialcharacter           guifg=176  guibg=238  gui=none
" hi cursorim                    guifg=238  guibg=105  gui=none
" hi doxygenbrief                guifg=215  guibg=none gui=none
" hi doxygencomment              guifg=130  guibg=none gui=none
" hi doxygenparam                guifg=222  guibg=none gui=none
" hi doxygenprev                 guifg=222  guibg=none gui=none
" hi doxygensmallspecial         guifg=222  guibg=none gui=none
" hi doxygenspecial              guifg=222  guibg=none gui=none
" hi doxygenspecialmultilinedesc guifg=130  guibg=none gui=none
" hi doxygenspecialonelinedesc   guifg=130  guibg=none gui=none
" hi lcursor                     guifg=238  guibg=120  gui=none
" hi mbechanged                  guifg=255  guibg=237  gui=none
" hi mbenormal                   guifg=187  guibg=237  gui=none
" hi mbevisiblechanged           guifg=255  guibg=60   gui=none
" hi mbevisiblenormal            guifg=252  guibg=60   gui=none
" hi multiple_cursors_cursor     guifg=232  guibg=253
" hi perlspecialmatch            guifg=176  guibg=238  gui=none
" hi perlspecialstring           guifg=176  guibg=238  gui=none
" hi taglisttagname              guifg=105  guibg=none gui=none
hi CursorColumn         guifg=none    guibg=#262626 gui=none
hi CursorLine           guibg=#111111 gui=none
hi CursorLineNr         guifg=#67cf30 guibg=none    gui=none
hi LineNr               guifg=#444944 guibg=none    gui=none
hi PMenu                guifg=#dadada guibg=#262626 gui=none
hi PMenuSbar            guifg=none    guibg=#3a3a3a gui=none
hi PMenuSel             guifg=#afff00 guibg=#121212 gui=none
hi PMenuThumb           guifg=#afff00 guibg=#afff00 gui=none
hi SyntasticErrorSign   guifg=#ff4444 guibg=none
hi SyntasticWarningSign guifg=#d7ff5f guibg=none
hi SyntasticInfoSign    guifg=#e0e0e0 guibg=none
hi SyntasticMsgSign     guifg=#cbffff guibg=none
hi WildMenu             guifg=#080808 guibg=#afd700 gui=bold

" Abbrevations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr teh the
abbr ture true
cabbrev vh vert help
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev E e


" " Functions
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
  if c ==# "b"
    let c = "("
  elseif c ==# "B"
    let c = "{"
  elseif c ==# "d"
    let c = "["
  endif
  exe "normal!".a:dir.c."v".a:motion.c
endfunction

function! GoyoBefore()
  Limelight
  set scrolloff=999
endfunction

function! GoyoAfter()
  Limelight!
  set scrolloff=0
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

function! OpenCw()
  execute ":redraw"
  execute ":Copen"
  execute ":bo cw 2"
endfunc

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  silent! %s/\s\+$//e
  call cursor(l, c)
endfun

let g:dfm_fullscreen=0
let g:dfm_nd=0
function! Fullscreen()
  if g:dfm_nd
    call NoDistraction()
  endif
  if g:dfm_fullscreen
    tab close
    set showtabline=1
  else
    tab split
    set showtabline=0
  endif
  let g:dfm_fullscreen=!g:dfm_fullscreen
endfunction

function! NoDistraction()
  SignifyToggle
  SyntasticToggleMode
  LiteDFMToggle
  set cursorline!
  let g:dfm_nd=!g:dfm_nd
endfunction

function! ColorPicker(insert)
  let color = '\#' . expand('<cword>')
  let @z = system("zenity --color-selection --color " . color . " | cut -c 2-3,6-7,10-11 | tr -d \"\n\"")
  if strlen(@z) != 0
    if a:insert == 0
      normal! diw"zP
    else
      let @z = '#' . @z
      normal! "zp
    endif
  endif
endfunction

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
        \ non_blank_char_exists_p
        \ ? ['v', head_pos, tail_pos]
        \ : 0
endfunction

function! ToggleConceal()
  if(&conceallevel == 2)
    set conceallevel=0
  else
    set conceallevel=2
  endif
endfunction

function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction


" Textobjs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call textobj#user#plugin('line', {
      \   '-': {
      \     'select-a-function': 'CurrentLineA',
      \     'select-a': 'aL',
      \     'select-i-function': 'CurrentLineI',
      \     'select-i': 'iL',
      \   },
      \ })


" Random stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call unite#custom_source('menu', 'matchers', ['matcher_fuzzy'])
" call unite#custom_source('source', 'matchers', ['matcher_fuzzy'])
" call unite#custom_source('outline', 'matchers', ['matcher_fuzzy'])
" call unite#custom_source('history/yank', 'matchers', ['matcher_fuzzy'])

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--vimgrep -i --silent'
endif

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.tscache/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ 'lib/Cake/',
      \ 'node_modules/',
      \ 'vendor/',
      \ 'Vendor/',
      \ 'app_old/',
      \ 'acf-laravel/',
      \ 'plugins/',
      \ 'bower_components/',
      \ '.sass-cache',
      \ 'web/wp',
      \ 'nimcache',
      \ '.toc$',
      \ '.bak$',
      \ '.log$',
      \ '.out$',
      \ '.aux$',
      \ '.a$',
      \ '.o$',
      \ '.obj$',
      \ '.so$',
      \ '.lib$',
      \ '.jar$',
      \ '.pdf$'
      \ ], '\|'))
" call unite#custom_source('file_rec/async', 'matchers', ['matcher_fuzzy'])

map <space>?a <Plug>(operator-ags)
call operator#user#define('ags', 'Ags_textobj')
function! Ags_textobj(motion_wiseness)
  let start = getpos("'[")
  let stop = getpos("']")
  let start_line = start[1]
  let start_col = start[2]
  let stop_line = stop[1]
  let stop_col = stop[2]
  " echo linestart colstart
  if start_line == stop_line
      let stuff = getline(start_line)[ start_col - 1 : stop_col - 1 ]
      let command = 'Ags ' . '"' . stuff . '"'
      exec command
  endif
endfunction

map <space>?s <Plug>(operator-stackoverflow)
call operator#user#define('stackoverflow', 'SO_textobj')
function! SO_textobj(motion_wiseness)
  let start = getpos("'[")
  let stop = getpos("']")
  let start_line = start[1]
  let start_col = start[2]
  let stop_line = stop[1]
  let stop_col = stop[2]
  " echo linestart colstart
  if start_line == stop_line
      let stuff = getline(start_line)[ start_col - 1 : stop_col - 1 ]
      let command = 'StackOverflow ' . '"' . stuff . '"'
      exec command
  endif
endfunction

call arpeggio#map('icvx', '', 0, 'jk', '<Esc>')
call arpeggio#map('icvx', '', 0, 'wtf', '<Esc>:StackOverflow <c-r>"<cr>')
call arpeggio#map('icvx', '', 0, 'j.', '<Esc>:w<cr>')
call arpeggio#map('icvx', '', 0, 'hl', '<Esc>I')
call arpeggio#map('icvx', '', 0, 'jl', '<Esc>A')
call arpeggio#map('icvx', '', 0, 'kn', '<Esc>O')
call arpeggio#map('icvx', '', 0, 'ln', '<Esc>o')
call arpeggio#map('icvx', '', 0, 'h1', ' <Esc>sHodor')
call arpeggio#map('icvx', '', 0, 'h2', ' <Esc>shodor.')
call arpeggio#map('icvx', '', 0, 'h3', ' <Esc>sHodor!')
call arpeggio#map('icvx', '', 0, 'h4', ' <Esc>sHODOR! ')
call arpeggio#map('icvx', '', 0, 'ks', '<C-o>:w<cr>')
call arpeggio#map('icvx', '', 0, 'jf', '<Esc><C-w>c<c-l>')

" https://github.com/sunaku/.vim/tree/spacey/shortcut
call shortcut#map('<space> Z K',     'Zeal - Search for.',                 'ZvK')
call shortcut#map('<space> Z d',     'Zeal - Select d',                    'ZvKD')
call shortcut#map('<space> Z v',     'Zeal - Find visual s',               'ZvV')
call shortcut#map('<space> Z w',     'Zeal - Find word under c',           'Zeavim')
call shortcut#map('<space> b R',     'Buffer - Reload (force)',            'edit!')
call shortcut#map('<space> b S',     'Buffer - Save as',                   'call feedkeys(":write ", "n")')
call shortcut#map('<space> b W',     'Buffer - Save',                      'write')
call shortcut#map('<space> b n',     'Buffer - Focus next',                'bnext')
call shortcut#map('<space> b p',     'Buffer - Focus previous',            'bprevious')
call shortcut#map('<space> b r',     'Buffer - R',                         'confirm edit')
call shortcut#map('<space> b s',     'Buffer - Save as.',                  'call feedkeys(":saveas ", "n")')
call shortcut#map('<space> c P',     'Comment - Yank - Paste a',           'normal! `[P')
call shortcut#map('<space> c p',     'Comment - Yank - Paste b',           'normal! `]p')
call shortcut#map('<space> g %',     'Git - D',                            'Gdiff')
call shortcut#map('<space> g C',     'Git - Commit (amend)',               'Gcommit --amend')
call shortcut#map('<space> g D',     'Git - Delete file (force)',          'Gremove!')
call shortcut#map('<space> g H',     'Git - Hunk - H',                     'SignifyToggleHighlight')
call shortcut#map('<space> g M',     'Git - Move file (force)',            'call feedkeys(":Gmove! ", "n")')
call shortcut#map('<space> g R',     'Git - Revert file (force)',          'Gread!')
call shortcut#map('<space> g W',     'Git - Add file (force)',             'Gwrite!')
call shortcut#map('<space> g b',     'Git - B',                            'Gblame')
call shortcut#map('<space> g c',     'Git - C',                            'Gcommit')
call shortcut#map('<space> g d',     'Git - Delete f',                     'Gremove')
call shortcut#map('<space> g e',     'Git - E',                            'Gedit')
call shortcut#map('<space> g g',     'Git - G',                            'call feedkeys(":Ggrep ", "n")')
call shortcut#map('<space> g h',     'Git - Hunk - S',                     'SignifyToggle')
call shortcut#map('<space> g l',     'Git - L',                            'Gitv')
call shortcut#map('<space> g m',     'Git - Move f',                       'call feedkeys(":Gmove ", "n")')
call shortcut#map('<space> g r',     'Git - Revert f',                     'Gread')
call shortcut#map('<space> g s',     'Git - S',                            'Gstatus')
call shortcut#map('<space> g w',     'Git - Add f',                        'Gwrite')
call shortcut#map('<space> o #',     'Toggle - Highlight - Hex c',         'ColorToggle')
call shortcut#map('<space> o d',     'Toggle - Distraction-free w',        'Goyo')
call shortcut#map('<space> o <Tab>', 'Toggle - Indentlines',               'IndentLinesToggle')
call shortcut#map('<space> o N',     'Toggle - Line numbering (relative)', 'setlocal relativenumber!')
call shortcut#map('<space> o Q',     'Toggle - Automatic f',               'call shortcut#toggle_flag("formatoptions", "a", "t")')
call shortcut#map('<space> o ]',     'Toggle - Tag l',                     'TlistToggle')
call shortcut#map('<space> o c',     'Open - Color picker',                           'call ColorPicker(0)')
call shortcut#map('<space> o n',     'Toggle - Line n',                    'setlocal number!')
call shortcut#map('<space> o p',     'Toggle - Paste v',                   'setlocal paste!')
call shortcut#map('<space> o q',     'Toggle - QuickFix w',                'QFix')
call shortcut#map('<space> o s',     'Open - Startify',                           'Startify')
call shortcut#map('<space> o s',     'Toggle - Spelling c',                'setlocal spell!')
call shortcut#map('<space> o u',     'Toggle - Edit history (undo tree)',  'UndotreeToggle')
call shortcut#map('<space> o z',     'Toggle - Code f',                    'setlocal foldenable!')
call shortcut#map('<space> s w',     'Strip W',                            'call StripTrailingWhitespace()')
call shortcut#map('<space> t :',     'Tab - For each l',                   'call feedkeys(":tabdo ", "n")')
call shortcut#map('<space> t < <',   'Tab - Move - F',                     'tabmove 0')
call shortcut#map('<space> t <',     'Tab - Move - L',                     'tabmove -')
call shortcut#map('<space> t > >',   'Tab - Move - L',                     'tabmove $')
call shortcut#map('<space> t >',     'Tab - Move - R',                     'tabmove +')
call shortcut#map('<space> t A',     'Tab - Open - L',                     '$tabnew')
call shortcut#map('<space> t D',     'Tab - Close - A',                    '%tabclose')
call shortcut#map('<space> t I',     'Tab - Open - F',                     '0tabnew')
call shortcut#map('<space> t M',     'Tab - Close - Only',                 'tabonly')
call shortcut#map('<space> t a',     'Tab - Open - New',                   'tabnew')
call shortcut#map('<space> t d',     'Tab - C',                            'tabclose')
call shortcut#map('<space> t i',     'Tab - Open - L',                     '-tabnew')
call shortcut#map('<space> t n',     'Tab - Focus - N',                    'tabnext')
call shortcut#map('<space> t p',     'Tab - Focus - P',                    'tabprevious')
call shortcut#map('<space> t t',     'Tab - Find and f',                   'Unite -no-split tab')
call shortcut#map('<space> u e',     'UltiSnips - E',                      'UltiSnipsEdit')
call shortcut#map('<space>no',       'NERDTreeToggle - Open',              'NERDTreeToggle | wincmd = | wincmd p')
call shortcut#map('<space>nf',       'NERDTreeToggle - Find file',         'NERDTree | wincmd = | wincmd p | NERDTreeFind | wincmd = | wincmd p')
call shortcut#map('<space> s 8',     'Set tabwidth to 8',                  'set ts=8 sts=8 sw=8')
call shortcut#map('<space> s 4',     'Set tabwidth to 4',                  'set ts=4 sts=4 sw=4')
call shortcut#map('<space> s 2',     'Set tabwidth to 2',                  'set ts=2 sts=2 sw=2')
call shortcut#map('<space> T l',     'Todo - local',                       'e ~/todo.todo')
call shortcut#map('<space> T d',     'Todo - Mark as done',                'call <Plug>() TaskComplete()')
call shortcut#map('<space> T c',     'Todo - Cancel task',                 'call <Plug>() TaskCancel()')
call shortcut#map('<space> T a',     'Todo - Archive task',                'call <Plug>() TaskArchive()')
call shortcut#map('<space> T n',     'Todo - New task under',              'call <Plug>() NewTask(1)')
call shortcut#map('<space> T N',     'Todo - New task over',               'call <Plug>() NewTask(-1)')
call shortcut#map('<leader> a',      'Tagbar - Toggle',                    'nnoremap <silent><leader>a :TagbarToggle<cr>')
call shortcut#map('<leader> A',      'Tagbar - Show tag',                  'nnoremap <silent><leader>A :TagbarShowTag<cr>')
call shortcut#map('<space> N s',     'Nim - Server start',                 'NimServerStart')
call shortcut#map('<space> N S',     'Nim - Server stop',                  'NimServerStop')
call shortcut#map('<space> N d',     'Nim - Server debug',                 'NimServerDebug')

" call shortcut#map('<space> T u',     'Todo - Update archive',              'call <Plug>() TaskArchive()')

if filereadable(expand("~/.localdf/nvim.vim"))
  source ~/.localdf/nvim.vim
endif
