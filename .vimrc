set nocompatible
"1""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"2""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :BundleInstall
"3"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimproc
" cd ~/.vim/bundle/vimproc.vim
" make
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle

call vundle#rc()

Bundle 'gmarik/vundle'
" Bundle 'Yggdroot/indentLine'
" Bundle 'Raimondi/delimitMate'

Bundle 'abijr/colorpicker'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'jiangmiao/auto-pairs'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'gregsexton/gitv'
Bundle 'vim-scripts/octave.vim--'
Bundle 'tpope/vim-markdown'
Bundle 'kurkale6ka/vim-pairs'
Bundle 'AndrewRadev/switch.vim'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'Shougo/unite-outline'
Bundle 'Shougo/unite.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'drmikehenry/vim-fixkey'
Bundle 'arecarn/crunch'
Bundle 'b5winckler/vim-angry'
Bundle 'PeterRincker/vim-argumentative'
Bundle 'baabelfish/vim-droid256'
Bundle 'bling/vim-airline'
Bundle 'chrisbra/NrrwRgn'
Bundle 'dag/vim-fish'
Bundle 'glts/vim-textobj-comment'
Bundle 'junegunn/vim-easy-align'
Bundle 'kana/vim-arpeggio'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-user'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-signify'
Bundle 'mhinz/vim-startify'
Bundle 'mrtazz/DoxygenToolkit.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'paradigm/SkyBison'
Bundle 'scottymoon/vim-twilight'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'baabelfish/vim-vertigo'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-dispatch'
Bundle 'baabelfish/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/Bck'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/Vimchant'
Bundle 'vim-scripts/VisIncr'
Bundle 'vim-scripts/ZoomWin'
Bundle 'baabelfish/a.vim'
Bundle 'vim-scripts/django.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'jwhitley/vim-matchit'

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

" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set complete-=i
set completeopt=menu,longest
set cscopetag
set display+=lastline " FIXME
set expandtab
set fillchars+=vert:│
set foldmethod=syntax
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set formatoptions=qrn1tj
set gdefault
set hidden
set history=100
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list 
set listchars=""
set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶,nbsp:█
set modelines=0
set nobackup
set cursorline
set noerrorbells
set nofoldenable
set noshowmode
set nospell
set noswapfile
set notimeout
set novisualbell
set nowrap
set nrformats-=octal
set number
set numberwidth=4
set path+=.,,
set pumheight=5
" set regexpengine=0
" set scrolloff=100
set shiftround " FIXME
set shiftwidth=4
set shortmess+=filmnrxoOtTI
set showcmd
set showfulltag
set sidescroll=1
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set t_vb=
set tabstop=4
set titlestring=Vim:\ %f\ %h%r%m
set ttimeout
set ttimeoutlen=0
set viewoptions=folds,options,cursor,unix,slash
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/doxygen/*,*.o,*.pyc,*.aux,*.toc,*.tar,*.gz,*.svg,*.mdr,*.mdzip,*.blg,*.bbl,*.out,*.log,*.zip,*.pdf,*.bst,*.jpeg,*.jpg,*.png,*.a,*.so,*.exe,*.dll,*.bak,*.,*.class,*.meta,*.lock,*.orig,*.jar,*/hg/*,git/*,*/bzr/*
set wildmenu
set wildmode=longest,list
set wrapmargin=0

if version >= 703
  set number
  " set relativenumber
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=100
  set undoreload=1000
  set wildignorecase
endif

if &shell =~# 'fish$'
  set shell=/bin/zsh
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Automatic commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " if has('conceal')
  "   autocmd Syntax * syn keyword Operator not conceal cchar=¬
  "   hi! link Conceal Operator
  "   set conceallevel=1
  " endif
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " autocmd InsertEnter * set cul
  " autocmd InsertLeave * set nocul
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd FileType matlab set filetype=octave

  " if !has("gui_running")
  "     autocmd InsertEnter * set nocursorline nocursorcolumn
  "     autocmd InsertLeave * set cursorline
  "     set cursorline
  " endif
  " autocmd FileType help set rnu " FIXME

  " autocmd FocusLost * :wa
  " autocmd WinLeave * silent! :w
  " autocmd BufLeave * silent! :w

  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParanthesesLoadRound

  autocmd InsertLeave * set nopaste
  autocmd VimResized * exe "normal! \<c-w>="
  autocmd FileType html setlocal indentkeys-=*<Return> " Fix html indentation

  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS

  autocmd BufWritePre *.hh,*.m,*.h,*.c,*.mm,*.cpp,*.hpp call StripTrailingWhitespace()
  autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml,*.erb,*.haml call StripTrailingWhitespace()
  autocmd BufWritePre *.java,*.php,*.feature call StripTrailingWhitespace()

  " Compile with java
  " autocmd Filetype java set makeprg=javac\ % set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

  " autocmd FileType plaintex set filetype=tex
  autocmd FileType tex set filetype=plaintex
  autocmd FileType fish set filetype=sh
  autocmd FileType cpp set nowrap
  autocmd FileType js nnoremap <silent><space>b :%!js-beautify -i<cr>

  " Hack to get signbuf on always
  " augroup mine
  "   autocmd BufWinEnter * sign define mysign
  "   autocmd BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
  " augroup END
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = 'ö'
nnoremap ' `
set pastetoggle=<M-p>

nnoremap <M-a> :A<cr>
nnoremap <M-h> h
nnoremap <M-j> j
nnoremap <M-k> k
nnoremap <M-l> l
nnoremap <M-H> H
nnoremap <M-J> J
nnoremap <M-K> K
nnoremap <M-L> L
nnoremap <M-q> <C-w>c
inoremap <M-q> <Esc><C-w>c:echo ""<cr>
nnoremap <M-c> :tabclose<cr>:echo ""<cr>
nnoremap <M-N> <C-w>v:Unite -silent file_rec/async<CR>
nnoremap <M-M> <C-w>s:Unite -silent file_rec/async<CR>
nnoremap <M-n> <C-w>v
nnoremap <M-m> <C-w>s
nnoremap <M-w> <C-w><C-w>

" nnoremap ) /)\\|(<cr>
" nnoremap ( ?)\\|(<cr>
nnoremap sq /"\\|'\\|`<cr>
nnoremap Sq ?"\\|'\\|`<cr>

nnoremap vif :call SelectFunction(1)<cr>
nnoremap vaf :call SelectFunction(0)<cr>
nnoremap dif :call SelectFunction(1)<cr>d
nnoremap daf :call SelectFunction(0)<cr>d
nnoremap cif :call SelectFunction(1)<cr>c
nnoremap caf :call SelectFunction(0)<cr>c
nnoremap <leader>r yiw:call SelectFunction(0)<cr>:s/\<0\>/

nmap <; <Plug>Argumentative_MoveLeft
nmap >; <Plug>Argumentative_MoveRight
" nnoremap <C-w> <nop>
"
" syntax region DoxComment start="\/\*\*" end="\*\/" transparent fold

" cnoremap e<space> :call SkyBison("e ")<cr>
" cnoremap h<space> :call SkyBison("h ")<cr>
" cnoremap jk <esc>
" cnoremap kj <esc>
" vnoremap jk <esc>
" vnoremap kj <esc>
" inoremap jk <esc>
" inoremap kj <esc>
" nnoremap <leader>S :setlocal spell! spelllang=en_us<CR>
" nnoremap <leader>gT :!ctags -R<CR><CR>
" nnoremap <leader>gT :!~/.zsh_augments/dev/cscope_gen.sh<CR>
" nnoremap <silent><C-b> :silent make! -j 16\|copen 4\|redraw!\|cc <CR>
" nnoremap <silent><leader>bR :call BreakpointRemoveAll()<cr><cr>
" nmap <leader>e :e <cfile><cr>
" nmap <leader>x :!xdg-open <cfile><cr>
" nnoremap <silent><leader>nd :e note:deadlinet<cr>
" nnoremap <silent><leader>nl :e note:linkit<cr>
" nnoremap <silent><leader>nt :e note:todo<cr>
" nnoremap <silent><leader>nv :e note:velat<cr>
" nnoremap Q gqip
" nnoremap gt :UniteWithCursorWord -hide-status-line -immediately tag<CR>
" vnoremap <silent><enter> :EasyAlign<cr>
cnoremap <C-h> <Left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <Right>
nnoremap <silent><space>T :!export TERM=screen-256color && tig<CR><CR>
nnoremap <silent><space>t :Gitv<CR>
nnoremap <silent><space>D :cd %:p:h<CR>
nnoremap <silent><space>d :lcd %:p:h<CR>
nnoremap <silent><space>f m':Unite -hide-status-line outline<CR>
nnoremap <silent><space>m :Sex<CR>
nnoremap <silent><space>M :Vex<CR>
inoremap <C-c> <Esc>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-m> <C-a>
nnoremap <C-w>d <C-^>
nnoremap <F5> :GundoToggle<CR>
nnoremap <leader>* :s/<C-r><C-w>/
nnoremap <leader>C :!clear && octave -q %<CR>
nnoremap <leader>s :%s//
nnoremap <leader>dw :call <SID>StripTrailingWhitespaces()
nnoremap <leader>S :%s/
nnoremap <leader>umlc :!suml --font-family=termsyn --png --class "$(cat %)" > %.png && feh %.png <CR> <CR>
nnoremap <leader>umls :!suml --png --sequence "$(cat %)" > %.png && feh %.png <CR><CR>
nnoremap <leader>w :set wrap!<cr>
nnoremap <leader>wc :w !wc<CR>
nnoremap <leader>§ :let @q='q'
nnoremap <silent><c-b> :w\|Make<cr>
nnoremap <silent><space><c-b> :Make! clean<cr>
nnoremap <silent><C-h> ?{<cr>
nnoremap <silent><C-l> /{<cr>
nnoremap <silent><c-j> /{<cr>
nnoremap <silent><c-k> ?{<cr>
nnoremap <silent><leader><leader>s      :so $MYVIMRC<CR>
nnoremap <silent><leader><leader>v      :e $MYVIMRC<CR>
nnoremap <silent><leader><leader>y      :e ~/.ycm_extra_conf.py<CR>
nnoremap <silent><leader>D :!./findindoc.sh <C-r><C-w><CR><CR>
nnoremap <silent><leader>W  :set invwrap<CR> :set wrap?<CR>
nnoremap <silent><space>bR :call BreakpointRemoveAllInFile()<cr><cr>
nnoremap <silent><space>ba :call BreakpointAdd()<cr><cr>
nnoremap <silent><space>br :call BreakpointRemove()<cr><cr>
nnoremap <silent><leader>cw :%s/\s\+$//<cr>
" nnoremap <silent><leader>j :normal ]m<CR>
" nnoremap <silent><leader>k :normal [m<CR>
nnoremap <silent><leader>ue :UltiSnipsEdit<CR>
nnoremap <silent><space><space> :set nohls!<cr>
nnoremap <silent><space>bf :Bck FIXME<CR>
nnoremap <silent><space>bt :Bck TODO<CR>
nnoremap <silent><space>bw :Bck <C-r><C-w><CR>
nnoremap <silent><space>p :Unite -silent file_rec/async<CR>
nnoremap <silent><space>o :Unite -silent buffer_tab<CR>
nnoremap <silent><space>O :Unite -silent tab<CR>
nnoremap <silent><space>q :Bck<CR>
nnoremap <silent><space>y m':Unite -silent -hide-status-line history/yank<CR>
nnoremap <silent>å :TComment<CR>
nnoremap <space>N :cprev<CR>
nnoremap <space>l :SLoad <C-d>
nnoremap <space>n :cnext<CR>
nnoremap <space>s :Startify<CR>
nnoremap K i<CR><Esc>k$
nnoremap <M-S> :shell<CR>
nnoremap Y y$
nnoremap ` '
nnoremap c_ c^
nnoremap j gj
nnoremap k gk
nnoremap § qqqqq
nnoremap ½ @q
nnoremap Ä :SyntasticCheck<CR>
nnoremap Ö :Switch<CR>
nnoremap ä :w<CR>
noremap x "_x
vnoremap <leader>C :w !octave -q<CR>
vnoremap <leader>c :!octave --silent --no-window-system\|cut -c8-<CR>
vnoremap <leader>s :s/
vnoremap <silent><leader>cw :s/\s\+$//<cr>
vnoremap <silent><return> :NarrowRegion<CR>
vnoremap <silent><return> :NarrowRegion<CR>
vnoremap ¤ :g/.*/norm! 
vnoremap ½ @q
vnoremap å :TComment<CR>

nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
onoremap <silent> <Space>k :<C-U>VertigoUp o<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:BASH_Ctrl_j = 'off'

let g:airline_detect_whitespace=0
let g:airline_linecolumn_prefix = '¶'
let g:airline_branch_prefix = ''
let g:airline_paste_symbol = 'ρ'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_powerline_fonts=0
let g:airline_enable_branch=1
let g:airline_enable_syntastic=0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jslint']
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline_theme='badwolf'
let g:airline_detect_modified=1
let g:airline_exclude_preview = 0
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

let BckOptions = 'cirw'

let g:vimchant_spellcheck_lang = 'fi'

let g:UltiSnipsSnippetDirectories = ["ultisnips"]
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<Nul>"

let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_width = 40

let g:pydiction_location = '/usr/share/pydiction/complete-dict'
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_cpp_check_header = 1
" let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt/QtCore', '/usr/include/qt/QtGui' ]
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
" let g:syntastic_error_symbol='X'
" let g:syntastic_warning_symbol='>'
let g:syntastic_error_symbol='✕'
let g:syntastic_warning_symbol='✕'
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }

let g:user_emmet_expandabbr_key = '<c-e>'
" let g:use_emmet_complete_tag = 1

let g:skybison_fuzz = 1
let g:skybison_input = 1

let g:Vertigo_homerow = 'asdfghjklp'
let g:Vertigo_homerow_onedigit = 'ASDFGHJKLP'

let g:ycm_register_as_syntastic_checker = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_key_invoke_completion = '<tab>'
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_min_num_of_chars_for_completion = 100
" let g:ycm_min_num_identifier_candidate_chars = 10
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let delimitMate_expand_cr = 1

let g:unite_source_history_yank_enable =1
let g:unite_enable_start_insert = 1
let g:unite_split_rule = 'bot'
let g:unite_winheight = 15
let g:unite_enable_ignore_case = 1

let g:startify_show_files_number = 30
let g:startify_change_to_dir = 0
let g:startify_list_order = ['bookmarks', 'sessions', 'files']
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_session_dir = '~/.vim/session'
let g:startify_enable_special = 1
let g:startify_session_persistence = 2
let g:startify_enable_special = 0
" let g:startify_custom_indices = ['a','s','d','f']
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc'
      \ ]
let g:startify_custom_header = [
      \'',
      \'   _/      _/  _/',
      \'  _/      _/      _/_/_/  _/_/',
      \' _/      _/  _/  _/    _/    _/',
      \'  _/  _/    _/  _/    _/    _/',
      \'   _/      _/  _/    _/    _/',
      \'',
      \'',
      \ ]

let g:signify_sign_overwrite = 0
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_sign_add               = '»'
let g:signify_sign_change            = '∙'
let g:signify_sign_delete            = '«'
let g:signify_sign_delete_first_line = '-'

let g:bl_no_implystart = 1

let g:switch_custom_definitions =
      \ [
      \  ['on', 'off' ],
      \  ['active', 'passive' ],
      \  ['start', 'stop' ],
      \  ['begin', 'end' ],
      \  ['float', 'double' ],
      \  ['up', 'right', 'left', 'down' ]
      \ ]

let g:indentLine_color_term = 237
let g:indentLine_char = '│'

" let g:notes_directory = '~/.vim/notes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:droid_transparent = 0
let g:droid_day = 0

let hour = strftime("%H")
if 8 <= hour && hour < 18
  " let g:droid_day = 1
endif

if has("gui_running")
  syntax on
  colorscheme twilight
elseif &t_Co == 256 
  syntax on
  " let g:solarized_termcolors=256
  colorscheme droid256
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has("gui_running")
  set number
  " set guioptions=ac
  " set guioptions-=T           " remove the toolbar
  set guifont=Termsyn\ 10
  set guicursor+=a:blinkon0
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbrevations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr teh the
cabbrev vh vert help
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev E e


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
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
  execute ":silent! g/^.*(.*).*;/norm f;C {o}\

  execute ":normal! G(xxkddVG"
endfunction

" Basic gdb breakpoint support
" Usage: gdb -x breakpoints ./main
" ----------------------------
nnoremap <silent><leader>ba :call BreakpointAdd()<cr><cr>
nnoremap <silent><leader>br :call BreakpointRemove()<cr><cr>
nnoremap <silent><leader>bR :call BreakpointRemoveAllInFile()<cr><cr>

fun! BreakpointAdd()
  exe ":!echo break " . expand('%') . ":" . line('.') . " >> breakpoints"
  sign define breakpoint text=▸ texthl=SyntasticErrorSign
  exe ":sign place " . line('.') . " line=" . line('.') . " name=breakpoint file=" . expand("%:p")
endfun

fun! BreakpointRemove()
  exe ":!sed -i \'\\," . expand('%') . ":" . line('.') . ",d\' breakpoints"
  exe ":sign unplace " . line('.') . " file=" . expand("%:p")
endfun

fun! BreakpointRemoveAll()
  exe ":!echo \"\" > breakpoints"
  exe ":sign unplace *"
endfun

fun! BreakpointRemoveAllInFile()
  exe ":!sed -i \'\\," . expand('%') . ",d\' breakpoints"
  exe ":sign unplace * file=" . expand("%:p")
endfun

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType cpp nnoremap <buffer> ¤f 0f;xA {}O
au FileType cpp nnoremap <buffer> ¤O ^f(%li {A}
au FileType cpp nnoremap <buffer> ¤o ^/{DJJD
au FileType sh nnoremap <buffer> ¤mv m'"zyiwf=l"xyg$:'<,'>s/\$z/x/''dd
au FileType sh nnoremap <buffer> ¤mf mk"zyiwf=l"xyg$viB:'<,'>s/\$z/x/'kdd
au FileType sh nnoremap <buffer> ¤M mk"zyiwf=l"xyg$:.,$s/\$z/x/'kdd
" au FileType sh vnoremap <buffer> ¤m mk"zyiwf=l"xyg$:'<,'>s/\$z/x/'kdd


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supermenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.super = {
    \ 'description' : '           Super menu for everything',
    \}

nnoremap <space>: :Unite -silent menu:super<CR>
let g:unite_source_menu_menus.super.command_candidates = [
    \['> add word to dictionary', 'normal ,sa'],
    \['> buffers', 'Unite buffer'],
    \['> close all folds', 'normal zM'],
    \['> close current window', 'close'],
    \['> copy to the clipboard', 'normal ,y'],
    \['> delete buffer', 'bd'],
    \['> insert lorem ipsum text', 'exe "Loremipsum" input("numero de palabras: ")'],
    \['> jumps to next bad spell word and show suggestions', 'normal ,sc'],
    \['> jumps to next bad spell word', 'normal ,sn'],
    \['> location list', 'Unite location_list'],
    \['> new horizontal window', 'split'],
    \['> new vertical window', 'vsplit'],
    \['> open all folds', 'normal zR'],
    \['> paste from the clipboard', 'normal ,p'],
    \['> quickfix', 'Unite quickfix'],
    \['> remove trailing whitespaces', 'normal ,et'],
    \['> resize windows', 'WinResizerStartResize'],
    \['> search changes', 'Unite change'],
    \['> search folds', 'Unite -vertical -winwidth=30 -auto-highlight fold'],
    \['> search jumps', 'Unite jump'],
    \['> search line', 'Unite -auto-preview -start-insert line'],
    \['> search marks', 'Unite -auto-preview mark'],
    \['> search outlines & tags (ctags)', 'Unite -vertical -winwidth=40 -direction=topleft -toggle outline'],
    \['> search tasks', 'Unite -toggle grep:%::FIXME|TODO|NOTE|XXX|COMBAK|@todo'],
    \['> search undos', 'Unite undo'],
    \['> search word under the cursor', 'UniteWithCursorWord -no-split -auto-preview line'],
    \['> show available digraphs', 'digraphs'],
    \['> show current char info', 'normal ga'],
    \['> show hidden chars', 'set list!'],
    \['> show word frequency', 'Unite output:WordFrequency'],
    \['> spell checking in English', 'setlocal spell spelllang=en'],
    \['> suggestions', 'normal ,sp'],
    \['> tabs', 'Unite tab'],
    \['> text statistics', 'Unite output:normal\ ,es -no-cursor-line'],
    \['> toggle fold', 'normal za'],
    \['> toggle line numbers', 'call ToggleRelativeAbsoluteNumber()'],
    \['> toggle paste mode', 'normal ,P'],
    \['> toggle quickfix window', 'normal ,q'],
    \['> toggle search results highlight', 'set invhlsearch'],
    \['> toggle wrapping', 'call ToggleWrap()'],
    \['> turn off spell checking', 'setlocal nospell'],
    \['> windows', 'Unite window'],
    \['> zoom', 'ZoomWinTabToggle'],
    \]
nnoremap <silent>[menu]e :Unite -silent -winheight=20 menu:text <CR>

" Sets all ignores for unite
function SetUniteIgnores()
  " Add patterns to be ignored always
  let unite_ignore_always = [
        \]

  " Add filetype specific ignores
  let unite_ignorelists = {
      \'cpp': [
      \'moc_',
      \'.*\.o'
      \],
      \'javascript': [
      \'.*/node_modules/.*'
      \],
      \}

  let regex = ''
  for value in unite_ignore_always
    if len(regex) == 0
      let regex = '\(' . value . '\)'
    else
      let regex = regex . '\|'. '\(' . value . '\)'
    endif
  endfor

  if !has_key(unite_ignorelists, &ft)
    call unite#custom_source('file_rec/async', 'ignore_pattern', regex)
    return
  endif

  for value in unite_ignorelists[&ft]
    if len(regex) == 0
      let regex = '\(' . value . '\)'
    else
      let regex = regex . '\|'. '\(' . value . '\)'
    endif
  endfor
  call unite#custom_source('file_rec/async', 'ignore_pattern', regex)
endfun
" autocmd BufReadPost * call SetUniteIgnores()

call unite#custom_source('menu', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('source', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('outline', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('history/yank', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('file_rec/async', 'matchers', ['matcher_fuzzy'])

let g:arpeggio_timeoutlen = 20
call arpeggio#map('icvx', '', 0, 'jk', '<Esc>')
