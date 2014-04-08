""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prequests:
" mkdir -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" sudo pacman -S the_silver_searcher
" mkdir ~/.vim/undodir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,~/.vim/after

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" After install/update
" cd ~/.vim/plugged/vimproc.vim && make -f make_unix.mak
" cd ~/.vim/plugged/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang

" NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'Matt-Stevens/vim-systemd-syntax'
NeoBundle 'Mizuchi/STL-Syntax'
NeoBundle 'PeterRincker/vim-argumentative'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-session'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'b4winckler/vim-angry'
NeoBundle 'baabelfish/Bck'
NeoBundle 'baabelfish/a.vim'
NeoBundle 'baabelfish/vim-dispatch'
NeoBundle 'baabelfish/vim-droid256'
NeoBundle 'baabelfish/vim-vertigo'
NeoBundle 'bilalq/lite-dfm'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'dag/vim-fish'
NeoBundle 'drmikehenry/vim-fixkey'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'glts/vim-textobj-comment'
NeoBundle 'gregsexton/gitv'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'guns/vim-sexp'
NeoBundle 'guns/vim-slamhound'
NeoBundle 'jaxbot/github-issues.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'justinmk/vim-gtfo'
NeoBundle 'jwhitley/vim-matchit'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'kurkale6ka/vim-pairs'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mechatroner/minimal_gdb'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mhinz/vim-toplevel'
NeoBundle 'mrtazz/DoxygenToolkit.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scottymoon/vim-twilight'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/Vimchant'
NeoBundle 'vim-scripts/VisIncr'
NeoBundle 'vim-scripts/bufkill.vim'
NeoBundle 'vim-scripts/django.vim'
NeoBundle 'vim-scripts/octave.vim--'
NeoBundle 'vim-scripts/surrparen'
NeoBundle 'wellle/targets.vim'
NeoBundle 'xuhdev/vim-latex-live-preview'
NeoBundleLazy 'jiangmiao/auto-pairs', { 'autoload' : { 'filetypes' : ['clojure', 'html'] } }

NeoBundleCheck

" Old
" cd .vim/plugged/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang
" Plug 'Rip-Rip/clang_complete'
" Plug 'Shougo/neocomplete.vim'

filetype plugin indent on
setlocal spell spelllang=en_us

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  scriptencoding utf-8
endif

if &term =~ '256color'
  set t_ut=
endif

if &shell =~# 'fish$'
  set shell=/bin/zsh
endif


" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set complete-=i
set completeopt=menu,longest
set cscopetag
set cursorline
set display+=lastline " FIXME
set fillchars+=vert:│
set formatoptions=qrn1tj
set gdefault smartcase ignorecase incsearch
set hidden
set history=100
set langmenu=en_US.UTF-8
set laststatus=2
set list listchars=tab:→\ ,trail:·,extends:↷,precedes:↶,nbsp:█
set magic
set modelines=0
set nofoldenable foldmethod=syntax
set noshowmode
set nospell
set noswapfile
set notimeout
set nrformats-=octal
set number numberwidth=4
set path+=.,**,,
set pumheight=5
set regexpengine=1
set shortmess+=filmnrxoOtTI
set showcmd
set showfulltag
set scrolljump=8 sidescroll=1
set splitbelow splitright
set suffixesadd=.java,.py,.cpp,.hpp,.html,.js,.hh,.h,.c,.cc,.sh,.md,.json
set t_vb= novisualbell noerrorbells
set tildeop
set titlestring=Vim:\ %f\ %h%r%m
set ts=4 sts=4 sw=4 expandtab shiftround copyindent preserveindent
set ttyfast ttimeout ttyscroll=1 ttimeoutlen=0 lazyredraw
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
autocmd FileType js nnoremap <silent><space>b :%!js-beautify -i<cr>
autocmd FileType matlab set filetype=octave
autocmd InsertLeave * set nopaste
autocmd Syntax * RainbowParanthesesLoadRound
autocmd VimEnter * RainbowParenthesesToggle
autocmd VimResized * exe "normal! \<c-w>="
autocmd FileType html nnoremap <buffer><leader>F :%!tidy -q -i --show-errors  0 -xml<cr>


" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = 'ö'
let maplocalleader = 'ä'
set pastetoggle=<F3>

" Window related
inoremap <C-q> <C-o>ciW
inoremap <M-q> <Esc><C-w>c:echo ""<cr>
inoremap <M-z> <C-o>zz
" FIXME: clojure...
nnoremap <M-H> H
nnoremap <M-J> J
nnoremap <M-K> K
nnoremap <M-L> L
nnoremap <M-Q> :tabclose<cr>:echo ""<cr>
" nnoremap <M-R> R
" nnoremap <M-W> :BF<cr>
nnoremap <M-h> h
nnoremap <M-j> j
nnoremap <M-k> k
nnoremap <M-l> l
nnoremap <M-m> <C-w>v
nnoremap <M-M> <C-w>s
nnoremap <M-q> <C-w>c
nnoremap <M-r> r
nnoremap <M-w> :BB<cr>
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
inoremap <silent><M-c> <C-o>:call ColorPicker(1)<cr>
nnoremap <leader>r yiw:call SelectFunction(0)<cr>:s/\<0\>/
nnoremap <silent><M-F> :call NoDistraction()<cr>:echo ""<cr>
nnoremap <silent><M-f> :call Fullscreen()<cr>:echo ""<cr>
" nnoremap <silent><leader>cw :call StripTrailingWhitespace()<cr>
nnoremap <silent><space>cp :call ColorPicker(0)<cr>
nnoremap caf :call SelectFunction(0)<cr>c
nnoremap cif :call SelectFunction(1)<cr>c
nnoremap daf :call SelectFunction(0)<cr>d
nnoremap dif :call SelectFunction(1)<cr>d
nnoremap <silent>vaf :call SelectFunction(0)<cr>
nnoremap <silent>vif :call SelectFunction(1)<cr>

" Plugin related
nmap <; <Plug>Argumentative_MoveLeft
nmap >; <Plug>Argumentative_MoveRight
nnoremap <silent><F5> :GundoToggle<cr>
nnoremap <silent><c-b> :w\|Make<cr>
nnoremap <silent><space><c-b> :Make! clean<cr>
nnoremap <silent><leader>T :NERDTree $PWD  \| wincmd = \| wincmd p \| NERDTreeFind \| wincmd p<cr>
nnoremap <silent><leader>d :NERDTreeToggle \| wincmd = \| wincmd p<cr>
nnoremap <silent><leader>t :NERDTreeFind<cr>
nnoremap <silent><leader>ue :UltiSnipsEdit<cr>
nnoremap <silent><space>bf :Bck FIXME<cr>
nnoremap <silent><space>bt :Bck TODO<cr>
nnoremap <silent><space>bw :Bck <C-r><C-w><cr>
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
vnoremap <silent><space><return> :NarrowRegion<cr>
vnoremap <silent><space><return> :NarrowRegion<cr>
vnoremap <silent><space><enter> :EasyAlign<cr>
nnoremap <silent><space>O :Unite -silent tab<cr>
nnoremap <silent><space>F m':Unite -hide-status-line outline<cr>
nnoremap <silent><space>f :CtrlPFunky<cr>
nnoremap <silent><space>o :Unite -silent buffer_tab<cr>
nnoremap <silent><space>P :Unite -silent file_rec/async<cr>
nnoremap <silent><space>p :CtrlPCurWD<cr>
nnoremap <silent><space>y m':Unite -silent -hide-status-line history/yank<cr>
nnoremap <silent><space>w :SignifyToggle<cr>
nnoremap <space>cc :Connect nrepl://localhost:8110<cr><cr>

" Vim builtin overrides
cnoremap <C-h> <Left>
cnoremap <C-j> <down>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <Right>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap K i<cr><Esc>k$
nnoremap Y y$
nnoremap ` '
nnoremap ' `
nnoremap j gj
nnoremap k gk
nnoremap x "_x
vnoremap x "_x
nnoremap gV `[v`]
nnoremap <silent># :set hlsearch<cr>:norm! #<cr>
nnoremap <silent>* :set hlsearch<cr>:norm! *<cr>

" Shell interaction
nnoremap <M-S> :shell<cr>
" nnoremap <silent><leader>C :!clear && octave -q %<cr>
nnoremap <silent><leader>umlc :!suml --font-family=termsyn --png --class "$(cat %)" > %.png && feh %.png <cr> <cr>
nnoremap <silent><leader>umls :!suml --png --sequence "$(cat %)" > %.png && feh %.png <cr><cr>
nnoremap <silent><space>T :!export TERM=screen-256color && tig<cr><cr>
" vnoremap <leader>C :w !octave -q<cr>
" vnoremap <leader>c :!octave --silent --no-window-system\|cut -c8-<cr>

" Refactoring
nnoremap <leader>* :%s/\<<C-r><C-w>\>/
nnoremap <leader>S yiwvip:s/<C-r>0/

" Misc
nnoremap <leader>f :find 
nnoremap <silent><leader><leader>s :so $MYVIMRC<cr>
nnoremap <silent><leader><leader>v :e $MYVIMRC<cr>
nnoremap <silent><leader><leader>y :e ~/.ycm_extra_conf.py<cr>
nnoremap <silent><leader>w :set wrap!<cr>
nnoremap <silent><space><space> :set nohls!<cr>
nnoremap <silent><space>D :cd %:p:h<cr>
nnoremap <silent><space>d :lcd %:p:h<cr>
nnoremap Ä :w<cr>
nnoremap <leader>§ :let @q='<C-r><C-r>q'
nnoremap § qqqqq
nnoremap ¤ :'<,'>g/^/norm 
vnoremap ¤ :g/^/norm! 
nnoremap ½ @q
vnoremap ½ @q

" Ex stuff
nnoremap <leader>m :move.<left><left><left><left><left>
vnoremap <leader>m :.move
nnoremap <leader>M :.move
nnoremap <leader>c :copy.<left><left><left><left><left>
vnoremap <leader>c :copy.
nnoremap <leader>C :.copy


" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:BASH_Ctrl_j = 'off'

let g:airline_branch_prefix = ''
let g:airline_detect_iminsert=0
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_whitespace=0
let g:airline_enable_branch=1
let g:airline_enable_syntastic=0
let g:airline_exclude_preview = 0
" let g:airline_left_sep = '▶'
" let g:airline_linecolumn_prefix = '¶'
" let g:airline_paste_symbol = 'ρ'
let g:airline_powerline_fonts=1
" let g:airline_right_sep = '◀'
let g:airline_theme='wombat'
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

let g:AutoPairsShortcutToggle = '<M-a>'
" let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

let BckOptions = 'cirw'

let g:bl_no_implystart = 1

" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

let g:clang_user_options="-std=c++1y"

" let g:clojure_fuzzy_indent = 1
" let g:clojure_fuzzy_indent_patterns = ['.']
" let g:clojure_fuzzy_indent_blacklist = []

let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_width = 40

let g:livepreview_previewer = 'zathura'

let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10

let NERDTreeDirArrows = 0
let NERDTreeHijackNetrw = 0
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0

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

let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt/QtCore', '/usr/include/qt/QtGui' ]
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_error_symbol='»'
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_warning_symbol='»'

let g:switch_custom_definitions =
      \ [
      \  ['on', 'off' ],
      \  ['active', 'passive' ],
      \  ['start', 'stop' ],
      \  ['begin', 'end' ],
      \  ['float', 'double' ],
      \  ['up', 'right', 'left', 'down' ]
      \ ]

let g:indentLine_color_term = 236
let g:indentLine_char = '│'

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsListSnippets="<Nul>"
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

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<c-e>'
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_server_log_level = 'error'
let g:ycm_filetype_blacklist = {
      \ 'gitcommit' : 1,
      \ 'javascript' : 1,
      \ 'tex' : 1,
      \ 'markdown' : 1,
      \ 'notes' : 1,
      \ 'text' : 1,
      \ 'unite' : 1,
      \ 'vim' : 1,
      \}
      " \ 'javascript' : 1,
let g:ycm_semantic_triggers = {
      \ 'clojure' : ['(', '/'],
      \ }

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_refresh_always = 0
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endif


" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:droid_transparent = 0

syntax on
if has("gui_running")
  colorscheme twilight
elseif &t_Co == 256 
  colorscheme droid256
else
  colorscheme delek
endif


" Abbrevations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr teh the
abbr ture true
cabbrev vh vert help
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev E e


" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function OpenCw()
  execute ":redraw"
  execute ":Copen"
  execute ":bo cw 2"
endfunc

function SynStack()
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

fun! SelectFunction(inside)
  if &ft == "cpp" || &ft == "c" || &ft == "js" ||
        \ &ft == "java" || &ft == "js" || &ft == "cs" || &ft == "scala"
    execute "normal! V"
    if a:inside == 1
      execute "normal! iBiBiBiBiBiBiB"
    else
      execute "normal! aBaBaBaBaBaBaB"
    endif
    execute "normal! oV0"
  elseif &ft == 'clojure'
    execute "normal! V"
    if a:inside == 1
      execute "normal! ibibibibibibib"
    else
      execute "normal! ababababababab"
    endif
  elseif &ft == "vim"
    execute "normal! $"
    call search("^fun!.*(.*)", "b")
    if a:inside == 1
      execute "normal! j"
    endif
    execute "normal! V"
    call search("^endfun")
    if a:inside == 1
        execute "normal! k"
    endif
  endif
endfunction

fun! CppHeaderToSource()
  let @z = input('Prefix: ')
  execute ":silent! g/^public\:/d"
  execute ":silent! g/^class/d"
  execute ":silent! g/protected\:/d"
  execute ":silent! g/^private\:/d"
  execute ":silent! g/^#include/d"
  execute ":silent! g/^#pragma/d"
  execute ":silent! g/}/d"
  execute ":silent! g/{/d"
  execute ":silent! g/^\s*$/d"
  execute ":%s/^\\s\\+//e"
  execute ":silent! g/^static/norm 0daw"
  execute ":silent! g/^virtual/norm 0daw"
  execute ":silent! g!/^.*(.*).*;/norm ddGp0f;Bd0f;xA()I, "
  execute ":silent! g/^.*(.*).*;/norm 0f(B\"zP"
  execute ":silent! g/^.*(.*).*;/norm f;C {o}"
  execute ":normal! G(xxkddVG"
endfunction

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

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
      \     'select-a': 'al',
      \     'select-i-function': 'CurrentLineI',
      \     'select-i': 'il',
      \   },
      \ })


" Random stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call unite#custom_source('menu', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('source', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('outline', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('history/yank', 'matchers', ['matcher_fuzzy'])
call arpeggio#map('icvx', '', 0, 'jk', '<Esc>')
call arpeggio#map('icvx', '', 0, 'hl', '<Esc>I')
call arpeggio#map('icvx', '', 0, 'jl', '<Esc>A')
call arpeggio#map('icvx', '', 0, 'kn', '<Esc>O')
call arpeggio#map('icvx', '', 0, 'ln', '<Esc>o')

" " FROM http://vim.wikia.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " If you are using a console version of Vim, or dealing
" " with a file that changes externally (e.g. a web server log)
" " then Vim does not always check to see if the file has been changed.
" " The GUI version of Vim will check more often (for example on Focus change),
" " and prompt you if you want to reload the file.
" "
" " There can be cases where you can be working away, and Vim does not
" " realize the file has changed. This command will force Vim to check
" " more often.
" "
" " Calling this command sets up autocommands that check to see if the
" " current buffer has been modified outside of vim (using checktime)
" " and, if it has, reload it for you.
" "
" " This check is done whenever any of the following events are triggered:
" " * BufEnter
" " * CursorMoved
" " * CursorMovedI
" " * CursorHold
" " * CursorHoldI
" "
" " In other words, this check occurs whenever you enter a buffer, move the cursor,
" " or just wait without doing anything for 'updatetime' milliseconds.
" "
" " Normally it will ask you if you want to load the file, even if you haven't made
" " any changes in vim. This can get annoying, however, if you frequently need to reload
" " the file, so if you would rather have it to reload the buffer *without*
" " prompting you, add a bang (!) after the command (WatchForChanges!).
" " This will set the autoread option for that buffer in addition to setting up the
" " autocommands.
" "
" " If you want to turn *off* watching for the buffer, just call the command again while
" " in the same buffer. Each time you call the command it will toggle between on and off.
" "
" " WatchForChanges sets autocommands that are triggered while in *any* buffer.
" " If you want vim to only check for changes to that buffer while editing the buffer
" " that is being watched, use WatchForChangesWhileInThisBuffer instead.
" "
" command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
" command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
" command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
"
" " WatchForChanges function
" "
" " This is used by the WatchForChanges* commands, but it can also be
" " useful to call this from scripts. For example, if your script executes a
" " long-running process, you can have your script run that long-running process
" " in the background so that you can continue editing other files, redirects its
" " output to a file, and open the file in another buffer that keeps reloading itself
" " as more output from the long-running command becomes available.
" "
" " Arguments:
" " * bufname: The name of the buffer/file to watch for changes.
" "     Use '*' to watch all files.
" " * options (optional): A Dict object with any of the following keys:
" "   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
" "     addition to setting up the autocommands.
" "   * toggle: If set to 1, causes this behavior to toggle between on and off.
" "     Mostly useful for mappings and commands. In scripts, you probably want to
" "     explicitly enable or disable it.
" "   * disable: If set to 1, turns off this behavior (removes the autocommand group).
" "   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
" "     buffer you are editing. (Only the specified buffer will be checked for changes,
" "     though, still.) If set to 1, the events will only be triggered while
" "     editing the specified buffer.
" "   * more_events: If set to 1 (the default), creates autocommands for the events
" "     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
" "     (Presumably, having too much going on for those events could slow things down,
" "     since they are triggered so frequently...)
" function! WatchForChanges(bufname, ...)
"   " Figure out which options are in effect
"   if a:bufname == '*'
"     let id = 'WatchForChanges'.'AnyBuffer'
"     " If you try to do checktime *, you'll get E93: More than one match for * is given
"     let bufspec = ''
"   else
"     if bufnr(a:bufname) == -1
"       echoerr "Buffer " . a:bufname . " doesn't exist"
"       return
"     end
"     let id = 'WatchForChanges'.bufnr(a:bufname)
"     let bufspec = a:bufname
"   end
"
"   if len(a:000) == 0
"     let options = {}
"   else
"     if type(a:1) == type({})
"       let options = a:1
"     else
"       echoerr "Argument must be a Dict"
"     end
"   end
"   let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
"   let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
"   let disable     = has_key(options, 'disable')     ? options['disable']     : 0
"   let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
"   let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
"
"   if while_in_this_buffer_only
"     let event_bufspec = a:bufname
"   else
"     let event_bufspec = '*'
"   end
"
"   let reg_saved = @"
"   "let autoread_saved = &autoread
"   let msg = "\n"
"
"   " Check to see if the autocommand already exists
"   redir @"
"     silent! exec 'au '.id
"   redir END
"   let l:defined = (@" !~ 'E216: No such group or event:')
"
"   " If not yet defined...
"   if !l:defined
"     if l:autoread
"       let msg = msg . 'Autoread enabled - '
"       if a:bufname == '*'
"         set autoread
"       else
"         setlocal autoread
"       end
"     end
"     silent! exec 'augroup '.id
"       if a:bufname != '*'
"         "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
"         "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
"         exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
"       end
"         exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
"         exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
"         exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
"
"       " The following events might slow things down so we provide a way to disable them...
"       " vim docs warn:
"       "   Careful: Don't do anything that the user does
"       "   not expect or that is slow.
"       if more_events
"         exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
"         exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
"       end
"     augroup END
"     let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
"   end
"
"   " If they want to disable it, or it is defined and they want to toggle it,
"   if l:disable || (l:toggle && l:defined)
"     if l:autoread
"       let msg = msg . 'Autoread disabled - '
"       if a:bufname == '*'
"         set noautoread
"       else
"         setlocal noautoread
"       end
"     end
"     " Using an autogroup allows us to remove it easily with the following
"     " command. If we do not use an autogroup, we cannot remove this
"     " single :checktime command
"     " augroup! checkforupdates
"     silent! exec 'au! '.id
"     silent! exec 'augroup! '.id
"     let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
"   elseif l:defined
"     let msg = msg . 'Already watching ' . bufspec . ' for external updates'
"   end
"
"   echo msg
"   let @"=reg_saved
" endfunction
