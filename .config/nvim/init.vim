" {{{ Initialization

if has('nvim')
  runtime! plugin/python_setup.vim
  call jobstart("mkdir -p \"$HOME/.config/nvim/autoload\"")
  call jobstart("mkdir -p \"$HOME/.config/nvim/view\"")
  call jobstart("mkdir -p \"$HOME/.config/nvim/undodir\"")
endif

" if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
"   " ![[ -n "$(pacman -Qs the_silver_searcher)" ]] || sudo pacman -S the_silver_searcher --noconfirm --needed  !
"   " ![[ -n "$(pacman -Qs ctags)" ]] || !sudo pacman -S ctags --noconfirm --needed
"   "" !nvim +'PlugUpdate | quit!'
"   quit!
" endif

" }}}
" {{{ Plugins
call plug#begin('$HOME/.config/nvim/plugged')

Plug 'reedes/vim-wordy'
Plug 'tkhren/vim-fake'
Plug 'dhruvasagar/vim-table-mode'
Plug 'baabelfish/indent-detector.vim'

" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1

" {{{ Development
" Plug 'baabelfish/nvim-structure'
" Plug 'baabelfish/nvim-nim'
" }}}
" {{{ Deprecated
" Plug 'Shougo/javacomplete'
" Plug 'Shougo/neco-syntax'
" Plug 'Shougo/neco-vim'
" Plug 'Shougo/echodoc.vim'
" Plug 'Shougo/neoinclude.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/deoplete.nvim'
" Plug 'scrooloose/syntastic'
" Plug 'myint/syntastic-extras'
" Plug 'airblade/vim-gitgutter'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'xolox/vim-lua-inspect'
" Plug 'Mizuchi/STL-Syntax'
" Plug 'sheerun/vim-polyglot'
" Plug 'Raimondi/delimitMate'
" Plug 'marijnh/tern_for_vim'
" Plug 'lambdalisue/vim-gita'
" Plug 'floobits/floobits-neovim'
" Plug 'wincent/ferret' " Works like shit
" Plug 'baabelfish/mycolors'
let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#303030'
" Plug 'Yggdroot/indentLine'
" }}}
" {{{ Vim enhancements
let g:move_key_modifier = 'A-C'
Plug 'matze/vim-move'
Plug 'AndrewRadev/sideways.vim'

let g:localvimrc_ask = 0
" Plug 'embear/vim-localvimrc'
Plug 'AndrewRadev/switch.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'Valloric/MatchTagAlways'
Plug 'baabelfish/vim-dispatch'
Plug 'baabelfish/vim-vertigo'
Plug 'baabelfish/teema'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/NrrwRgn' " ?
Plug 'christoomey/vim-sort-motion'
Plug 'flazz/vim-colorschemes'
Plug 'glts/vim-textobj-comment'
Plug 'habamax/vim-skipit'
Plug 'haya14busa/incsearch.vim'
Plug 'idanarye/vim-casetrate'
Plug 'idanarye/vim-dutyl'
Plug 'idanarye/vim-merginal'
Plug 'baabelfish/vader.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'
Plug 'jwhitley/vim-matchit'
Plug 'kana/vim-arpeggio'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-hopping'
Plug 'sunaku/vim-shortcut'
" Plug 't9md/vim-choosewin'
Plug 'tommcdo/vim-express'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-kangaroo'
Plug 'tommcdo/vim-lion'
Plug 'tommcdo/vim-ninja-feet'
" Plug 'tomtom/tComment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/Vimchant'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/surrparen'
Plug 'wellle/targets.vim'
" }}}
" {{{ C++
Plug 'baabelfish/a.vim'
" }}}
" {{{ Typescript / Javascript
let g:tsuquyomi_disable_quickfix = 1
Plug 'Quramy/tsuquyomi'

Plug 'leafgarland/typescript-vim'
Plug 'othree/javascript-libraries-syntax.vim'
" }}}
" {{{ Documentation
Plug 'mickaobrien/vim-stackoverflow'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'lambdalisue/vim-manpager'
Plug 'digitaltoad/vim-pug'
Plug 'KabbAmine/zeavim.vim'
" }}}
" {{{ Markup
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-jade'
" }}}
" {{{ Emacs kind of shit
Plug 'mattn/gist-vim'
" }}}
" {{{ Lib
Plug 'xolox/vim-misc'
Plug 'mattn/webapi-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'cd ~/.config/nvim/plugged/vimproc.vim && make -f make_unix.mak' }
" }}}
" {{{ Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'Shougo/unite.vim'
Plug 'sgur/unite-qf'

let g:ctrlsf_default_root = 'project'
let g:ctrlsf_mapping = {
      \ "open"    : ["<CR>", "o"],
      \ "openb"   : "O",
      \ "split"   : "<C-O>",
      \ "tab"     : "t",
      \ "tabb"    : "T",
      \ "popen"   : "p",
      \ "quit"    : "Q",
      \ "next"    : "<C-J>",
      \ "prev"    : "<C-K>",
      \ "pquit"   : "Q",
      \ "loclist" : "",
      \ }
Plug 'dyng/ctrlsf.vim'
" Plug 'gabesoft/vim-ags'

let g:ack_qhandler = 'Unite qf'
Plug 'mileszs/ack.vim'

Plug 'lambdalisue/unite-grep-vcs'
Plug 'tsukkee/unite-help'
" }}}
" {{{ New
" }}}
" {{{ IDE features
" Plug 'SirVer/ultisnips'
Plug 'idanarye/vim-vebugger'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'

" imap <C-@>     <Plug>(neosnippet_expand_or_jump)
" smap <C-@>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-@>     <Plug>(neosnippet_expand_target)
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
Plug 'Valloric/YouCompleteMe', { 'do': 'cd ~/.config/nvim/plugged/YouCompleteMe && git submodule update --init --recursive && python2 install.py' }

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
" }}}
" {{{ SQL
Plug 'cosminadrianpopescu/vim-sql-workbench'
" }}}
" {{{ Nim
" Plug 'baabelfish/nimtools'
Plug 'baabelfish/nvim-nim'
" Plug 'zah/nim.vim'
" }}}
" {{{ Language support
Plug 'artur-shaik/vim-javacomplete2'
Plug 'dag/vim-fish'
Plug 'exu/pgsql.vim'
Plug 'ElmCast/elm-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'xolox/vim-lua-ftplugin'
Plug 'rust-lang/rust.vim'
Plug 'peterhoeg/vim-qml'
Plug 'leafo/moonscript-vim'
Plug 'vim-scripts/octave.vim--'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/django.vim'
Plug 'rgrinberg/vim-ocaml'
Plug 'bps/vim-textobj-python'
Plug 'Matt-Stevens/vim-systemd-syntax'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ElmCast/elm-vim'
" }}}
" {{{ Misc
" Plug 'Konfekt/FastFold'
Plug 'kopischke/vim-stay'
Plug 'irrationalistic/vim-tasks'
Plug 'kana/vim-vspec'
Plug 'jaxbot/github-issues.vim'
Plug 'ruanyl/vim-gh-line'
" }}}
" {{{ Neomake
let g:neomake_error_sign = {
    \ 'text': '✗',
    \ 'texthl': 'SyntasticErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '✖',
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
" Plug 'benekastah/neomake', { 'commit': 'e06f85e1651f5fe8841df3c85df1c51a891ccac4' }
Plug 'baabelfish/neomake'
" }}}
" {{{ Lisps
Plug 'Raimondi/delimitMate', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'guns/vim-slamhound', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
" }}}
" {{{ Version control
Plug 'AndrewRadev/gapply.vim'
Plug 'mhinz/vim-signify'
Plug 'int3/vim-extradite'
Plug 'gregsexton/gitv'
Plug 'jreybert/vimagit'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'lambdalisue/vim-gita'
Plug 'tpope/vim-fugitive'
" }}}
call plug#end()

" }}}
" {{{ Settings

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

set autoread
set backspace=indent,eol,start
set complete-=i
set completeopt=menu,longest previewheight=20 pumheight=40
set conceallevel=0
set cscopetag
set cursorline
set display+=lastline " FIXME
set diffopt=vertical
" set fillchars+=vert: 
" set fillchars+=vert:│
set fillchars+=vert: 
set formatoptions=qrn1tj tw=400 " tcqj
set gdefault smartcase ignorecase incsearch
set hidden
set history=1000
set langmenu=en_US.UTF-8
set laststatus=2
set list listchars=tab:→\ ,extends:▸,precedes:◂,nbsp:␣
set magic
set modelines=0
set mouse=
set noai
set foldmethod=indent foldlevel=999
set noshowmode
set nospell
set notimeout
set nrformats-=octal
set number numberwidth=4
set path+=.,**,,
set regexpengine=2
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
set ts=4 sts=4 sw=4 ttimeout ttimeoutlen=0
set undofile undolevels=1000 undoreload=10000 undodir=~/.config/nvim/undodir nobackup noswapfile
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=block
set winminheight=0
set wildignore+=*/node_modules/*,*/bower_modules/*,*/tmp/*,*.so,*.swp,*.zip,*/doxygen/*,*.o,*.pyc,*.aux,*.toc,*.tar,*.gz,*.svg,*.mdr,*.mdzip,*.blg,*.bbl,*.out,*.log,*.zip,*.pdf,*.bst,*.jpeg,*.jpg,*.png,*.a,*.so,*.exe,*.dll,*.bak,*.,*.class,*.meta,*.lock,*.orig,*.jar,*/hg/*,git/*,*/bzr/*
set wildmenu wildignorecase wildmode=longest:full,full
set wrapmargin=0 nowrap linebreak breakat+=" "
set omnifunc=syntaxcomplete#Complete

" }}}
" {{{ Autocommands

autocmd!

" Always show signs
sign define dummy
autocmd BufEnter * sign define dummy and autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

autocmd! FileType typescript setlocal completeopt+=preview
autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd! FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd! FileType plaintex setlocal filetype=tex
autocmd! FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd! FileType java setlocal omnifunc=javacomplete#Complete
autocmd! FileType java nmap <buffer><F4> <Plug>(JavaComplete-Imports-AddSmart)
autocmd! FileType java nmap <buffer><F5> <Plug>(JavaComplete-Imports-Add)
autocmd! FileType java nmap <buffer><F6> <Plug>(JavaComplete-Imports-AddMissing)
autocmd! FileType java nmap <buffer><F7> <Plug>(JavaComplete-Imports-RemoveUnused)

autocmd! BufRead,BufNewFile *.md setlocal textwidth=80
autocmd! BufWritePre *.hh,*.m,*.h,*.c,*.mm,*.cpp,*.ts,*.hpp call StripTrailingWhitespace()
autocmd! BufWritePre *.java,*.php,*.feature call StripTrailingWhitespace()
autocmd! BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml,*.erb,*.haml call StripTrailingWhitespace()

autocmd! FileType cpp setlocal nowrap
autocmd! FileType ejs setlocal filetype=typescript
autocmd! FileType sql setlocal syntax=typescript
autocmd! FileType fish setlocal filetype=sh
autocmd! FileType html nnoremap <buffer><leader>F :%!tidy -q -i --show-errors  0 -xml<cr>
autocmd! FileType html setlocal indentkeys-=*<Return> " Fix html indentation
autocmd! FileType nims setlocal filetype=nim
autocmd! FileType matlab setlocal filetype=octave
autocmd! FileType plaintex setlocal filetype=tex
autocmd! FileType typescript setlocal completeopt+=preview
autocmd! FileType typescript setlocal makeprg=tscp
autocmd! FileType nim setlocal ts=4 sts=4 sw=4
autocmd! FileType jade setlocal ts=2 sts=2 sw=2
autocmd! FileType vim setlocal foldmethod=marker foldlevel=0 foldtext=MyFoldText()

autocmd! InsertLeave * set nopaste
" autocmd Syntax * RainbowParanthesesLoadRound
" autocmd VimEnter * RainbowParenthesesToggle
autocmd! VimResized * exe "normal! \<c-w>="

autocmd! BufEnter,BufWritePost * Neomake

" }}}
" {{{ Shortcuts

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
tnoremap <A-q> <C-\><C-n><C-w>c
tnoremap <A-w> <C-\><C-n>:BB<cr>
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

inoremap <silent> <Esc>o

" Custom function callers
inoremap <silent><A-c> <C-o>:call ColorPicker(1)<cr>
nnoremap <silent><A-F> :call NoDistraction()<cr>:echo ""<cr>
nnoremap <silent><A-f> :call Fullscreen()<cr>:echo ""<cr>
nnoremap <silent><space>C :call ToggleConceal()<cr>

" Plugin related
nnoremap <silent><C-@> :call Shortcut_discover()<cr>
snoremap <silent><C-^> <Plug>(TsuquyomiReferences)
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
" nmap <silent><space>a :call RunAngularFinder()<cr>
nmap <silent><space>a :Ack! --nojs --output='$1 - $2' "\.(state)\\(\"(.*)\""<cr>
nnoremap <silent><space>P :Unite file_rec/async<cr>
nnoremap <silent><space>p :Unite file_rec/git<cr>
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
" nnoremap gT :YcmCompleter GetType<cr>
" nnoremap gt :YcmCompleter GoTo<cr>
" nnoremap gd :YcmCompleter GoToDefinition<cr>
nmap [; <Plug>Argumentative_Prev
nmap ]; <Plug>Argumentative_Next
xmap [; <Plug>Argumentative_XPrev
xmap ]; <Plug>Argumentative_XNext
nmap H <Plug>Argumentative_MoveLeft
nmap L <Plug>Argumentative_MoveRight
nmap <; <Plug>Argumentative_MoveLeft
nmap >; <Plug>Argumentative_MoveRight
xmap i; <Plug>Argumentative_InnerTextObject
xmap a; <Plug>Argumentative_OuterTextObject
omap i; <Plug>Argumentative_OpPendingInnerTextObject
omap a; <Plug>Argumentative_OpPendingOuterTextObject
" nnoremap <silent>H :SidewaysLeft<cr>
" nnoremap <silent>L :SidewaysRight<cr>
" nnoremap <space>gd :!nim c --debugger:native % && cgdb %:r<cr>
nnoremap <silent><leader>f :ChooseWin<cr>
nnoremap <silent><leader>F :ChooseWinSwap<cr>

" Vim builtin overrides
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
nnoremap <C-m> <C-a>
nnoremap K i<cr><Esc>k$
nnoremap Y y$
nnoremap gy "+y
nnoremap gp "+p
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
" nnoremap H ^
" nnoremap L $
nnoremap <silent><leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>
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

" Misc
nnoremap <silent><leader><leader>s :so $MYVIMRC<cr>
nnoremap <silent><leader><leader>v :e $MYVIMRC<cr>
nnoremap <silent><leader><leader>y :e ~/.ycm_extra_conf.py<cr>
nnoremap <silent><leader>w :set wrap!<cr>
nnoremap <silent><space><space> :set nohls!<cr>
nnoremap <silent>  za
nnoremap Ä :w<cr>
nnoremap <leader>§ :let @q='<C-r><C-r>q'
nnoremap § qqqqq
nnoremap ¤ :'<,'>g/^/norm 
vnoremap ¤ :g/^/norm 
nnoremap <space>S :CtrlSF 
nmap ½ @q
vmap ½ @q
nnoremap å :w<cr>
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
nnoremap <silent><leader>h1 :match InterestingWord1 /\<<c-r><c-w>\>/<cr>
nnoremap <silent><leader>h2 :2match InterestingWord2 /\<<c-r><c-w>\>/<cr>
nnoremap <silent><leader>h3 :3match InterestingWord3 /\<<c-r><c-w>\>/<cr>
nnoremap <silent><leader>H1 :match<cr>
nnoremap <silent><leader>H2 :2match<cr>
nnoremap <silent><leader>H3 :3match<cr>
nnoremap <silent><leader>HH :match \| 2match \| 3match<cr>

" }}}
" {{{ Functions

function! MyFoldText()
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let line = '⇒ ' . strpart(line, 5, windowwidth - 2 -len(foldedlinecount))
    let lineright = foldedlinecount . ' '
    let fillcharcount = windowwidth - len(line) - len(lineright) + 6
    return line . repeat(" ", fillcharcount) . lineright
endfunction

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

function! RunAngularFinder()
    let g:unite_source_grep_command = 'nvim_angularsearch'
    execute ":Unite grep:.::*:"
endfunction

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

" }}}
" {{{ Plugin configuration

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--vimgrep -i --silent'

call arpeggio#map('icvx', '', 0, 'jk', '<Esc>')

let g:BASH_Ctrl_j = 'off'

let g:python_host_skip_check=1

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

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

let g:gissues_lazy_load = 1
let g:gissues_async_omni = 0

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

let g:signify_disable_by_default = 0
let g:signify_update_on_bufenter = 1
let g:signify_sign_add               = '․'
let g:signify_sign_change            = '․'
let g:signify_sign_delete            = '․'
let g:signify_sign_delete_first_line = '․'
let g:signify_sign_overwrite = 0

let g:startify_bookmarks = [ '$MYVIMRC' ]
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0
let g:startify_enable_special = 1
let g:startify_list_order = ['bookmarks', 'sessions', 'files']
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_persistence = 2
let g:startify_show_files_number = 30
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc'
      \ ]
let g:startify_custom_header = []

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

let g:switch_mapping ='S'
let g:switch_reverse_mapping ='<A-S>'
let g:switch_custom_definitions =
      \ [
      \  ['div', 'span' ],
      \  ['ng-show', 'ng-hide', 'ng-if' ],
      \  ['yes', 'no' ],
      \  ['ng-show', 'ng-hide' ],
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

let g:UltiSnipsExpandTrigger="<C-@>"
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
let g:ycm_key_invoke_completion = '<M-Space>'
let g:ycm_key_list_previous_completion=['<C-p>']
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_server_log_level = 'error'
let g:ycm_filetype_blacklist = {
      \ 'markdown' : 1,
      \ 'notes' : 1,
      \ 'tex' : 1,
      \ 'text' : 1,
      \ 'unite' : 1,
      \ 'vim' : 1,
      \ 'sql' : 1,
      \}
      " \ 'typescript' : 1,
      " \ 'javascript' : 1,
let g:ycm_semantic_triggers = {
      \ 'gitcommit' : ['#'],
      \ 'clojure' : ['(', '/'],
      \ 'nim' : ['.'],
      \ 'typescript' : ['.']
      \ }

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" }}}
" {{{ Colorscheme

silent! colorscheme teema

let g:used_javascript_libs = 'angularjs,angularui,angularuirouter,chai,underscore'

" }}}
" {{{ Abbrevations

abbr teh the
abbr ture true
abbr flase false
cabbrev vh vert help
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev E e

" }}}
" {{{ Custom text objects / operators

call textobj#user#plugin('line', {
      \   '-': {
      \     'select-a-function': 'CurrentLineA',
      \     'select-a': 'aL',
      \     'select-i-function': 'CurrentLineI',
      \     'select-i': 'iL',
      \   },
      \ })

nmap g/ <Plug>(operator-ags)
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
      let command = 'CtrlSF ' . stuff
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

" }}}
" {{{ Random stuff

call unite#filters#sorter_default#use(['sorter_length'])
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
      \ '.png$',
      \ '.jpg$',
      \ '.lib$',
      \ '.jar$',
      \ '.pdf$'
      \ ], '\|'))
" call unite#custom_source('file_rec/async', 'matchers', ['matcher_fuzzy'])

" }}}
" {{{ Better shortcuts / launcher

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
call shortcut#map('<space> s s',     'Git - Get syntax group',             'call SynStack()')
call shortcut#map('<space> o #',     'Toggle - Highlight - Hex c',         'ColorToggle')
call shortcut#map('<space> o d',     'Toggle - Distraction-free w',        'Goyo')
call shortcut#map('<space> o <Tab>', 'Toggle - Indentlines',               'IndentLinesToggle')
call shortcut#map('<space> o N',     'Toggle - Line numbering (relative)', 'setlocal relativenumber!')
call shortcut#map('<space> o Q',     'Toggle - Automatic f',               'call shortcut#toggle_flag("formatoptions", "a", "t")')
call shortcut#map('<space> o ]',     'Toggle - Tag l',                     'TlistToggle')
call shortcut#map('<space> o c',     'Open - Color picker',                'call ColorPicker(0)')
call shortcut#map('<space> o n',     'Toggle - Line n',                    'setlocal number!')
call shortcut#map('<space> o p',     'Toggle - Paste v',                   'setlocal paste!')
call shortcut#map('<space> o q',     'Toggle - QuickFix w',                'QFix')
call shortcut#map('<space> o s',     'Open - Startify',                    'Startify')
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
call shortcut#map('<space> G s',     'Gists - Save',                       'Gist -p')
call shortcut#map('<space> G l',     'Gists - List',                       'Gist -l')
call shortcut#map('<space> r',       'Run',                                'call RunFile()')

function! RunFile()
  let file = expand("%:p")
  new
  exec "term nim c --threads:on -r " . file
endfunction

let g:neomake_typescript_tscp_maker = {
      \ 'bin': 'tscp',
      \ 'args': [],
      \ 'errorformat': 
      \ '%E%f %#(%l\,%c): error %m,' .
      \ '%E%f %#(%l\,%c): %m,' .
      \ '%Eerror %m,' .
      \ '%C%\s%\+%m'
      \ }
let g:neomake_typescript_enabled_makers = ['tscp']

" }}}
" {{{ Extensions

if filereadable(expand("~/.localdf/nvim.vim"))
  source ~/.localdf/nvim.vim
endif

function! GConflict()
  let conflicts = split(system("git status --short | grep \"^UU \" | cut -c4-"), "\n")
  if len(conflicts) > 0
    if &diff
      echo "Diff already in progress (save it with :Gw)"
    else
      exec ":e " . conflicts[0]
      exec ":Gdiff"
    endif
  else
    echo "No more conflicts!"
  endif
endfunction

function! RunInSplit(cmd)
  new
  exec "term " . a:cmd
endfunction

function! BuffersClean()
  for buf in tabpagebuflist()
    if getbufvar(2, "&mod")
      echom "Can't pull: " . bufname(2) . " has modifications"
      return 0
    endif
  endfor
  return 1
endfunction

function! RunGitCommand(cmd)
  new
  resize 8
  call termopen(a:cmd)
  normal! G
endfunction

function! GPull()
    if BuffersClean()
        call RunGitCommand("git pull --rebase")
    endif
endfunction

command! Gconflict :call GConflict()
command! Grc :call RunInSplit("git rebase --continue")
command! Gpsh :call RunInSplit("git push")

function! Run()
    if &ft == "nim"
        call RunInSplit("nim c --verbosity:0 --threads:on -r " . expand("%:p"))
    elseif &ft == "typescript"
        call RunInSplit("tsc")
    else
        echo "Nope."
    endif
endfunction

nnoremap <space>r :call Run()<cr>

" }}}
