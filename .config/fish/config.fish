# Essentials
fish_vi_mode

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
# set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_vi_prompt
    if [ $fish_bind_mode = 'default' ]
        set my_vi_indicator 'N'
    else if [ $fish_bind_mode = 'visual' ]
        set my_vi_indicator 'V'
    else if [ $fish_bind_mode = 'insert' ]
        set my_vi_indicator 'I'
    else
        set my_vi_indicator $fish_bind_mode
    end

    set_color -b 333
    set last_status $status
    printf ' %s ' (hostname)
    set_color 333
    set_color -b 222
    printf ''
    set_color 0f0
    printf ' %s ' $my_vi_indicator
    set_color normal
    set_color 222
    set_color -b 111
    printf ' '
    set_color normal
end

function fish_right_prompt
    set_color 222
    printf ''

    set_color -b 222
    set_color 3e3
    printf '%s ' (__fish_git_prompt)

    set_color 333
    printf ''

    set_color -b 333
    set_color ddd
    printf ' %s ' (prompt_pwd)
    set_color normal
end

function fish_greeting
    clear
end

set -x TERM "xterm-256color"
set -x EDITOR "nvim"
set -x NEDITOR "nvim"
set -x VISUAL "nvim"
set -x BROWSER "chromium"
set -x LS_COLORS 'rs=0:di=00;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=0;0:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

alias fishcfg='nvim ~/.config/fish/config.fish'

# Moving around
alias back='cd "$OLDPWD";pwd '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Package management
alias pa='yaourt'
alias pai='yaourt -S --noconfirm'
alias par='yaourt -R'
alias pau='yaourt -Syyu'
alias pac='sudo pacman -Syc'

# Git
alias gitC='git diff --name-only --diff-filter=U'
alias giti='git ls-tree -r --name-only'
alias gita='git add'
alias gitb='git branch'
alias gitm='nvim (git diff --name-only --diff-filter=U)'
alias gitph='git push'
alias gitpl='git pull'
alias gitc='git commit'
alias gitc!='git commit -m'
alias gitca='git commit -a'
alias gitca!='git commit -a -m'
alias äpärä='git'
alias gut='git'

# Keyboard layout
alias use_dvorak='setxkbmap fi dvorak'
alias use_neo='setxkbmap fi neo'
alias use_qwerty='setxkbmap fi qwerty'


if test -e /usr/bin/dircolors
    alias l='ls --group-directories-first -X --color=auto'
    alias ld='ls -d */ -X --color=auto'
    alias lda='ls -a -d */(DN) -X --color=auto'
    alias ldt='ls -d */ -tr -X --color=auto'
    alias ldat='ls -atr -d */(DN) -X --color=auto'
    alias ldta='ls -atr -d */(DN) -X --color=auto'
    alias lt='ls -tr --color=auto'
    alias lta='ls -atr --color=auto'
    alias la='ls -a --group-directories-first -X --color=auto'
    alias L='ls -l --group-directories-first -X --color=auto'
    alias Ld='ls -l -d */ -X --color=auto'
    alias Ldt='ls -ltr -d */ -X --color=auto'
    alias Ldta='ls -ltr -d */(DN) -X --color=auto'
    alias Lt='ls -ltr --color=auto'
    alias La='ls -la --group-directories-first -X --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
end


# Colors
set fish_color_error ff8a00
set -g c0 (set_color 005284)
set -g c1 (set_color 0075cd)
set -g c2 (set_color 009eff)
set -g c3 (set_color 6dc7ff)
set -g c4 (set_color ffffff)
set -g ce (set_color $fish_color_error)

set fish_color_normal EEE
set fish_color_command EEE
set fish_color_quote magenta
set fish_color_redirection magenta
set fish_color_end EEE
set fish_color_error fa2
set fish_color_param dfd
set fish_color_comment magenta
set fish_color_match green -underline
set fish_color_search_match green -underline
set fish_color_operator magenta
set fish_color_escape magenta
set fish_color_cwescape magenta
set fish_pager_color_prefix FFF -bold
set fish_pager_color_completion AAA
set fish_pager_color_description 55bb55
set fish_pager_color_progress magenta
set fish_pager_color_secondary magenta

# Binds
function my_vi_key_bindings
    fish_vi_key_bindings
    bind L 'clear; commandline -f repaint'
    bind -M insert \cl 'clear; commandline -f repaint'
    bind -M insert \ce end-of-line
end
set -g fish_key_bindings my_vi_key_bindings
