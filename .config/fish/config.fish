if test -e "$HOME/.config/fish/env.fish"
    source "$HOME/.config/fish/env.fish"
end

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

function fish_vi_mode
    function fish_prompt
        set last_status $status
        set vim_ind_color '222'
        set vim_ind_color_fg '0f0'
        if [ $fish_bind_mode = 'default' ]
            set my_vi_indicator 'N'
        else if [ $fish_bind_mode = 'visual' ]
            set vim_ind_color 'fa0'
            set vim_ind_color_fg '222'
            set my_vi_indicator 'V'
        else if [ $fish_bind_mode = 'insert' ]
            set vim_ind_color '2e2'
            set vim_ind_color_fg '222'
            set my_vi_indicator 'I'
        else
            set my_vi_indicator $fish_bind_mode
        end

        # if [ $last_status != 0 ]
        #     set_color f00
        #     set_color -b 433
        #     printf ' %s ' $last_status
        #     set_color 433
        #     set_color -b 333
        #     printf ''
        # end


        set_color ccc
        set_color -b 333
        printf ' %s ' (hostname)
        set_color 333
        set_color -b $vim_ind_color
        printf ''
        set_color $vim_ind_color_fg
        printf ' %s ' $my_vi_indicator
        set_color normal
        set_color $vim_ind_color
        printf ' '
        set_color normal
    end

    # function fish_right_prompt
    #     set_color 222
    #     printf ''

    #     set_color -b 222
    #     set_color 3e3
    #     printf '%s ' (__fish_git_prompt)

    #     set_color 333
    #     printf ''

    #     set_color -b 333
    #     set_color ddd
    #     printf ' %s ' (pwd)
    #     set_color normal
    # end

end

function fish_greeting
end

alias fishcfg='nvim ~/.config/fish/config.fish'
alias fishenv='nvim ~/.config/fish/env.fish'

alias ca='cal --monday -w -Y'

# Moving around
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

# Bash stuff
alias erename='~/.zsh/rename.sh'
alias elineval='~/.zsh/lineval.sh'

# Keyboard layout
alias use_dvorak='setxkbmap fi dvorak'
alias use_neo='setxkbmap fi neo'
alias use_qwerty='setxkbmap fi qwerty'

function kov
    eval $argv
    if test $status -ne 0
        mplayer -really-quiet ~/.kop.ogg 2> /dev/null
    else
        mplayer -really-quiet ~/.success.ogg 2> /dev/null
    end
end

# Dev
alias nimc='nim c --verbosity:0'
alias nimcr='nim c -r --verbosity:0'
alias nimd='nim c --debugger:native --verbosity:0'
alias testIE9='curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="9" bash'

function nimdr
    nim c --debugger:native --verbosity:0 $argv
    cgdb (echo $argv|cut -d'.' -f1)
end

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

function my_back_dir
    cd ..
    commandline -f repaint
end

function my_previous_dir
    prevd > /dev/null
    commandline -f repaint
end

function my_next_dir
    nextd > /dev/null
    commandline -f repaint
end

function browse_all
    tree -C|tail -n +2|less -R
    commandline -f repaint
end

function browse_dirs
    tree -C -d|tail -n +2|less -R
    commandline -f repaint
end

function backisearch
    history | uniq -u | eval (__fzfcmd) +s +m --tiebreak=index --toggle-sort=ctrl-r > $TMPDIR/fzf.result
    and commandline (cat $TMPDIR/fzf.result)
    commandline -f repaint
    rm -f $TMPDIR/fzf.result
end

# Binds
function bind_vim
    bind $argv[1] "echo $argv[2]; $argv[2]; commandline -f repaint"
end

function my_vi_key_bindings
    fish_vi_key_bindings
    # set -x fish_bind_mode default
    bind -M insert \ca 'ranger-cd; commandline -f repaint'
    bind -M insert \ce end-of-line
    bind -M insert \cl 'clear; commandline -f repaint'
    bind -M insert \cs 'cmatrix; commandline -f repaint'
    bind -M insert \cr 'backisearch'
    bind -M insert \ct '__fzf_ctrl_t'
    bind -M insert \cv 'edit-command'
    bind H my_previous_dir
    bind L my_next_dir
    bind_vim ca browse_all
    bind_vim cd 'browse_dirs; commandline -f repaint'
    bind \cl 'clear; commandline -f repaint'
    bind \cs 'cmatrix; commandline -f repaint'
    bind gh my_back_dir
    bind gr 'backisearch'
    bind_vim \ a 'ranger-cd; commandline -f repaint'
    bind_vim \ d browse_all
    bind_vim \ gP 'git push'
    bind_vim \ gcA 'git commit -a --amend'
    bind_vim \ gca 'git commit -a'
    bind_vim \ gco 'git commit'
    bind_vim \ gd 'git diff'
    bind_vim \ gl 'git lo'
    bind_vim \ gp 'git pull --rebase'
    bind_vim \ r 'backisearch'
    bind_vim \ t '__fzf_ctrl_t'
    bind_vim \ \  'l'
    bind_vim \ v  'nvim'
    bind_vim \ C  'C'
    bind_vim \ ml  'cd ~/.localdf'
    bind_vim \ mcf  'nvim ~/.config/fish/config.fish'
end
set -g fish_key_bindings my_vi_key_bindings

# Sources
# . ~/.config/fish/plugins/fishmarks/marks.fish
alias M save_bookmark
alias m go_to_bookmark
alias md delete_bookmark
alias ml list_bookmarks

# Commands
function C
    builtin cd (cat /home/$USER/.cache/curdir)
end

function Man
    man $argv|col -b|nvim -R -c 'MANPAGER' -
end

function cd
    builtin cd $argv
    echo $argv
    echo "$PWD" > /home/$USER/.cache/curdir
    chmod 700 /home/$USER/.cache/curdir
end

# Networking
function nmcli-l
    nmcli dev wifi
end

function bbl_syncpackages
    yaourt -S --needed --noconfirm (cat ~/.packagelist)
end

function bbl_update
    yaourt -Syu --aur --noconfirm
end

function nmcli-con
    nmcli dev wifi connect $argv[1] password $argv[2]
end

function nmconfig
    stalonetray&
    nm-applet
    killall nm-applet
    killall stalonetray
end

function ranger-cd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
        clear
        commandline -f repaint
    end
end

function run-on-change
    if test -z "$argv[2]"
        echo "Usage: run-on-change <file> <command>"
    end

    inotifywait -e modify $argv[1..-2]
    eval $argv[-1]
    run-on-change $argv
end

function edit-command
    set -q EDITOR; or return 1
    set -l tmpfile (mktemp); or return 1
    commandline > $tmpfile
    eval $EDITOR $tmpfile
    commandline -r -- (cat $tmpfile)
    rm $tmpfile
end

set -x LS_COLORS 'rs=0:di=00;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=0;0:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01\
    ;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

if test -e "/usr/share/fish/functions/fzf.fish"
    source /usr/share/fish/functions/fzf.fish
    fzf_key_bindings
end

if test -e "$HOME/.localdf/private.fish"
    source "$HOME/.localdf/private.fish"
end

if test -e "$HOME/.local.fish"
    source "$HOME/.local.fish"
end

set -gx PATH "/home/bbl/pebble-dev/pebble-sdk-4.2-linux64/bin" $PATH

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_command $history[2]
    thefuck $fucked_up_command > $eval_script
    . $eval_script
    /bin/rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_command
    end
end

# Essentials
# fish_vi_mode
