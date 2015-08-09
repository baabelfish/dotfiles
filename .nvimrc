if has('nvim')
  runtime! plugin/python_setup.vim
endif

if !filereadable(expand('~/.nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.nvim/undodir
  silent !mkdir -p ~/.nvim/autoload
  ![[ -n "$(pacman -Qs the_silver_searcher)" ]] || sudo pacman -S the_silver_searcher --noconfirm --needed  !
  ![[ -n "$(pacman -Qs ctags)" ]] || !sudo pacman -S ctags --noconfirm --needed
  !nvim +'PlugUpdate | quit!'
  quit!
endif

call plug#begin('~/.nvim/plugged')

" Plug 'Yggdroot/indentLine'
" Plug 'airblade/vim-gitgutter'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'xolox/vim-lua-inspect'
" NeoBundle 'Mizuchi/STL-Syntax'
" NeoBundle 'sheerun/vim-polyglot'
" Plug 'Raimondi/delimitMate'
" Plug 'marijnh/tern_for_vim'
" Plug 'lambdalisue/vim-gita'
" Plug 'baabelfish/vim-angry'

Plug 'AndrewRadev/gapply.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Matt-Stevens/vim-systemd-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Raimondi/delimitMate', { 'for': 'clojure' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'cd ~/.nvim/plugged/vimproc.vim ;and make -f make_unix.mak' }
Plug 'SirVer/ultisnips'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe', { 'do': 'cd ~/.nvim/plugged/YouCompleteMe ;and git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang' }
Plug 'baabelfish/a.vim'
Plug 'baabelfish/mycolors'
Plug 'baabelfish/nim.vim'
Plug 'baabelfish/vim-dispatch'
Plug 'baabelfish/vim-droid256'
Plug 'baabelfish/vim-vertigo'
Plug 'bling/vim-airline'
Plug 'bps/vim-textobj-python'
Plug 'chrisbra/NrrwRgn'
Plug 'clausreinke/typescript-tools.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'flazz/vim-colorschemes'
Plug 'floobits/floobits-neovim'
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
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
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
Plug 'leafgarland/typescript-vim'
Plug 'leafo/moonscript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/vim-signify'
Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'myint/syntastic-extras'
Plug 'osyo-manga/vim-hopping'
Plug 'osyo-manga/vim-hopping'
Plug 'peterhoeg/vim-qml'
Plug 'rking/ag.vim'
Plug 'roktas/syntastic-more'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
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

call plug#end()

filetype plugin indent on

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
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
set completeopt=menu,longest
set conceallevel=0
set cscopetag
set cursorline
set display+=lastline " FIXME
" set fillchars+=vert: 
set fillchars+=vert:│
set formatoptions=qrn1tj
set gdefault smartcase ignorecase incsearch
set hidden
set history=100
set langmenu=en_US.UTF-8
set laststatus=2
set list listchars=tab:→\ ,extends:▸,precedes:◂,nbsp:␣
set magic
set modelines=0
set nofoldenable foldmethod=manual
set noshowmode
set nospell
set noswapfile
set notimeout
set nrformats-=octal
set number numberwidth=4
set path+=.,**,,
set pumheight=5
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
set ts=4 sts=4 sw=4 expandtab shiftround copyindent preserveindent
set ttimeout ttimeoutlen=0 lazyredraw
set undofile undolevels=1000 undoreload=10000 undodir=~/.vim/undodir nobackup
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
autocmd FileType ejs set filetype=javascript
autocmd FileType fish set filetype=sh
autocmd FileType html setlocal indentkeys-=*<Return> " Fix html indentation
autocmd FileType matlab set filetype=octave
autocmd InsertLeave * set nopaste
autocmd Syntax * RainbowParanthesesLoadRound
autocmd VimEnter * RainbowParenthesesToggle
autocmd VimResized * exe "normal! \<c-w>="
autocmd FileType html nnoremap <buffer><leader>F :%!tidy -q -i --show-errors  0 -xml<cr>
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
nnoremap <leader>r yiw:call SelectFunction(0)<cr>:s/\<0\>/
nnoremap <silent><A-F> :call NoDistraction()<cr>:echo ""<cr>
nnoremap <silent><A-f> :call Fullscreen()<cr>:echo ""<cr>
" nnoremap <silent><leader>cw :call StripTrailingWhitespace()<cr>
nnoremap <silent><space>C :call ToggleConceal()<cr>
nnoremap <silent><space>cp :call ColorPicker(0)<cr>
nnoremap caf :call SelectFunction(0)<cr>c
nnoremap cif :call SelectFunction(1)<cr>c
nnoremap daf :call SelectFunction(0)<cr>d
nnoremap dif :call SelectFunction(1)<cr>d
nnoremap <silent>vaf :call SelectFunction(0)<cr>
nnoremap <silent>vif :call SelectFunction(1)<cr>

" Plugin related
nnoremap <space>ct :YcmCompleter GetType<cr>
nnoremap <space>gt :YcmCompleter GoTo<cr>
nmap <; <Plug>Argumentative_MoveLeft
nmap >; <Plug>Aargumentative_MoveRight
nnoremap <silent><F5> :UndotreeToggle<cr>
nnoremap <silent><c-b> :w\|Make<cr>
nnoremap <silent><space><c-b> :Make! clean<cr>
nnoremap <silent><leader>T :NERDTree $PWD  \| wincmd = \| wincmd p \| NERDTreeFind \| wincmd p<cr>
nnoremap <silent><leader>d :NERDTreeToggle \| wincmd = \| wincmd p<cr>
nnoremap <silent><leader>t :NERDTreeFind<cr>
nnoremap <silent><leader>ue :UltiSnipsEdit<cr>
nnoremap <space>bf :vimgrep /FIXME/gj ** \| :cw<cr>
nnoremap <space>bt :vimgrep /TODO/gj ** \| :cw<cr>
nnoremap <space>bw :vimgrep /<C-r><C-w>/gj ** \| :cw<cr>
nnoremap <space>bp :vimgrep /<C-r>"/gj ** \| :cw<cr>
nnoremap <space>B :vimgrep //gj ** \| :cw<left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <silent><space>M :Vex<cr>
nnoremap <silent><space>m :Sex<cr>
nnoremap <silent><space>N :cprev<cr>
nnoremap <silent><space>n :cnext<cr>
nnoremap <silent><space>q :Bck<cr>
nnoremap <silent><space>S :Startify<cr>
nnoremap <silent><space>t :Gitv<cr>
nnoremap <silent>Ö :Switch<cr>
nnoremap <silent><leader>j :<C-U>VertigoDown n<cr>
nnoremap <silent><leader>k :<C-U>VertigoUp n<cr>
onoremap <silent><leader>j :<C-U>VertigoDown o<cr>
onoremap <silent><leader>k :<C-U>VertigoUp o<cr>
vnoremap <silent><leader>j :<C-U>VertigoDown v<cr>
vnoremap <silent><leader>k :<C-U>VertigoUp v<cr>
nnoremap <silent><leader><space> :Goyo<cr>
vnoremap <silent><space><return> :NarrowRegion<cr>
vnoremap <silent><space><return> :NarrowRegion<cr>
vnoremap <silent><space><enter> :EasyAlign<cr>
nnoremap <silent><space>O :Unite -silent tab<cr>
nnoremap <silent><space>F m':Unite outline<cr>
nnoremap <silent><space>f :CtrlPFunky<cr>
nnoremap <silent><space>o :Unite -silent buffer_tab<cr>
nnoremap <silent><space>P :Unite -silent file_rec/async<cr>
nnoremap <silent><space>p :CtrlPCurWD<cr>
nnoremap <silent><space>l :CtrlPLine<cr>
nnoremap <silent><space>y m':Unite -silent -hide-status-line history/yank<cr>
nnoremap <silent><space>w :SignifyToggle<cr>
nnoremap <silent><leader>a :TagbarToggle<cr>
nnoremap <silent><leader>A :TagbarShowTag<cr>
nnoremap <space>cc :Connect nrepl://localhost:8110<cr><cr>
nnoremap <silent><space>g/ :HoppingStart<cr>
map <space>/  <Plug>(incsearch-forward)
map <space>?  <Plug>(incsearch-backward)
nnoremap gT :YcmCompleter GetType<cr>
nnoremap gt :YcmCompleter GoTo<cr>

" Vim builtin overrides
cnoremap <C-h> <Left>
cnoremap <C-j> <down>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <Right>
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
nnoremap <leader>f :find 
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
nnoremap ¤ :'<,'>g/^/norm 
vnoremap ¤ :g/^/norm 
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
let g:airline_theme='wombat'
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

let g:cpp_class_scope_highlight = 1

let g:agprg="ag --smart-case --column"
let g:aghighlight=1
let g:agformat="%f:%l:%m"

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
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_sign_add               = '»'
let g:signify_sign_change            = '∙'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '»'
let g:signify_sign_overwrite = 0

let g:startify_bookmarks = [ '~/.vimrc' ]
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
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_warning_symbol='✗'


let g:switch_custom_definitions =
      \ [
      \  ['yes', 'no' ],
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
let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --column -i --ignore ".git" --hidden -g ""'
let g:unite_split_rule = 'bot'
let g:unite_winheight = 15

let g:Vertigo_homerow = 'asdfghjklp'
let g:Vertigo_homerow_onedigit = 'ASDFGHJKLP'

let g:vimchant_spellcheck_lang = 'fi'

let g:targets_argOpening = '[({[<]'
let g:targets_argClosing = '[]})>]'

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_add_preview_to_completeopt = 1
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
      \ 'javascript' : 1,
      \ 'markdown' : 1,
      \ 'notes' : 1,
      \ 'tex' : 1,
      \ 'text' : 1,
      \ 'unite' : 1,
      \ 'sql' : 1,
      \ 'vim' : 1,
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

hi VertSplit guifg=#222222 guibg=none
hi InterestingWord1 guifg=#000000 guibg=#7aa06b
hi InterestingWord2 guifg=#000000 guibg=#d2e564
hi InterestingWord3 guifg=#000000 guibg=#0097c1
hi InterestingWord4 guifg=#000000 guibg=#22ff22
hi InterestingWord5 guifg=#000000 guibg=#0097c1
hi InterestingWord6 guifg=#000000 guibg=#0097c1

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

" function! CurrentLineA()
"   normal! 0
"   let head_pos = getpos('.')
"   normal! $
"   let tail_pos = getpos('.')
"   return ['v', head_pos, tail_pos]
" endfunction

" function! CurrentLineI()
"   normal! ^
"   let head_pos = getpos('.')
"   normal! g_
"   let tail_pos = getpos('.')
"   let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
"   return
"         \ non_blank_char_exists_p
"         \ ? ['v', head_pos, tail_pos]
"         \ : 0
" endfunction

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
" call textobj#user#plugin('line', {
"       \   '-': {
"       \     'select-a-function': 'CurrentLineA',
"       \     'select-a': 'al',
"       \     'select-i-function': 'CurrentLineI',
"       \     'select-i': 'il',
"       \   },
"       \ })


" Random stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call unite#custom_source('menu', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('source', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('outline', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('history/yank', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
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
      \ ], '\|'))

map g? <Plug>(operator-adjust)
call operator#user#define('adjust', 'Ag_textobj')
function! Ag_textobj(motion_wiseness)
  let start = getpos("'[")
  let stop = getpos("']")
  let start_line = start[1]
  let start_col = start[2]
  let stop_line = stop[1]
  let stop_col = stop[2]
  " echo linestart colstart
  if start_line == stop_line
      let stuff = getline(start_line)[ start_col - 1 : stop_col - 1 ]
      let command = 'Ag! ' . '"' . stuff . '"'
      exec command
  endif
endfunction

call arpeggio#map('icvx', '', 0, 'jk', '<Esc>')
call arpeggio#map('icvx', '', 0, 'j.', '<Esc>:w<cr>')
call arpeggio#map('icvx', '', 0, 'hl', '<Esc>I')
call arpeggio#map('icvx', '', 0, 'jl', '<Esc>A')
call arpeggio#map('icvx', '', 0, 'kn', '<Esc>O')
call arpeggio#map('icvx', '', 0, 'ln', '<Esc>o')
call arpeggio#map('icvx', '', 0, 'h1', '<Esc>iHodor ')
call arpeggio#map('icvx', '', 0, 'h2', '<Esc>ihodor. ')
call arpeggio#map('icvx', '', 0, 'h3', '<Esc>iHodor! ')
call arpeggio#map('icvx', '', 0, 'h4', '<Esc>iHODOR! ')
call arpeggio#map('icvx', '', 0, 'ks', '<C-o>:w<cr>')
