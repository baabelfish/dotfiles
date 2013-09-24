""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prequests:
" git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" sudo pacman -S the_silver_searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'gmarik/vundle'
" NeoBundle 'Yggdroot/indentLine'
" NeoBundle 'jiangmiao/auto-pairs'
" NeoBundle 'abijr/colorpicker'

NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': 'make -f make_unix.mak' } }
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'gregsexton/gitv'
NeoBundle 'vim-scripts/octave.vim--'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kurkale6ka/vim-pairs'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe', {'build': {'unix': './install.sh --clang-completer --system-libclang' } }
NeoBundle 'drmikehenry/vim-fixkey'
NeoBundle 'arecarn/crunch'
NeoBundle 'b4winckler/vim-angry'
NeoBundle 'PeterRincker/vim-argumentative'
NeoBundle 'baabelfish/vim-droid256'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'dag/vim-fish'
NeoBundle 'glts/vim-textobj-comment'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mrtazz/DoxygenToolkit.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'paradigm/SkyBison'
NeoBundle 'scottymoon/vim-twilight'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'baabelfish/vim-vertigo'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'baabelfish/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Bck'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/Vimchant'
NeoBundle 'vim-scripts/VisIncr'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'baabelfish/a.vim'
NeoBundle 'vim-scripts/django.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'jwhitley/vim-matchit'

NeoBundleCheck

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
set fillchars+=vert:│
" set foldmethod=syntax
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
set nocursorline
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
set shortmess+=filmnrxoOtTI
set showcmd
set showfulltag
set sidescroll=1
set smartcase
set smartindent
" set smarttab
set splitbelow
set splitright
set t_vb=
set titlestring=Vim:\ %f\ %h%r%m
set ttimeout
set ttimeoutlen=0
set viewoptions=folds,options,cursor,unix,slash
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/doxygen/*,*.o,*.pyc,*.aux,*.toc,*.tar,*.gz,*.svg,*.mdr,*.mdzip,*.blg,*.bbl,*.out,*.log,*.zip,*.pdf,*.bst,*.jpeg,*.jpg,*.png,*.a,*.so,*.exe,*.dll,*.bak,*.,*.class,*.meta,*.lock,*.orig,*.jar,*/hg/*,git/*,*/bzr/*
set wildmenu
set wildmode=longest,list
set wrapmargin=0
set ts=4 sts=4 sw=4 expandtab shiftround

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
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd FileType matlab set filetype=octave

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

  " autocmd FileType plaintex set filetype=tex
  autocmd FileType tex set filetype=plaintex
  autocmd FileType fish set filetype=sh
  autocmd FileType cpp set nowrap
  autocmd FileType js nnoremap <silent><space>b :%!js-beautify -i<cr>
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
" nnoremap <M-c> :tabclose<cr>:echo ""<cr>
nnoremap <M-n> <C-w>v
nnoremap <M-M> <C-w>v
nnoremap <M-m> <C-w>s
nnoremap <M-w> <C-w><C-w>

" nnoremap ) /)\\|(<cr>
" nnoremap ( ?)\\|(<cr>

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
vnoremap <silent><space><enter> :EasyAlign<cr>
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
nnoremap ¤ :'<,'>g/.*/norm! 
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
let g:airline_theme='wombat'
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
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt/QtCore', '/usr/include/qt/QtGui' ]
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_error_symbol='✕'
let g:syntastic_warning_symbol='✕'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }

let g:user_emmet_expandabbr_key = '<c-e>'

let g:skybison_fuzz = 1
let g:skybison_input = 1

let g:Vertigo_homerow = 'asdfghjklp'
let g:Vertigo_homerow_onedigit = 'ASDFGHJKLP'

let g:ycm_register_as_syntastic_checker = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

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

syntax on
if has("gui_running")
  colorscheme twilight
elseif &t_Co == 256 
  colorscheme droid256
else
  colorscheme delek
endif

if &term =~ '256color'
  set t_ut=
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  set number
  set guifont=Termsyn\ 10
  set guicursor+=a:blinkon0
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbrevations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr teh the
abbr ture true
cabbrev vh vert help
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev E e


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
  execute ":silent! g/^.*(.*).*;/norm f;C {o}\

  execute ":normal! G(xxkddVG"
endfunction

" Basic gdb breakpoint support
" Usage: gdb -x breakpoints ./main
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <silent><space>c :call ColorPicker(0)<cr>
inoremap <silent><M-c> <C-o>:call ColorPicker(1)<cr>

call unite#custom_source('menu', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('source', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('outline', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('history/yank', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('file_rec/async', 'matchers', ['matcher_fuzzy'])
let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --column -i --ignore ".git" --hidden -g ""'

let g:arpeggio_timeoutlen = 20
call arpeggio#map('icvx', '', 0, 'jk', '<Esc>')
echo ""
