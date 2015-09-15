set -x NVIM_TUI_ENABLE_TRUE_COLOR '1'
set -x NVIM_TUI_ENABLE_CURSOR_SHAPE '1'
set -x TERM 'xterm-termite'
set -x NO_FISHMARKS_COMPAT_ALIASES
set -x EDITOR 'nvim'
set -x NEDITOR 'nvim'
set -x VISUAL 'nvim'
set -x BROWSER 'chromium'
set -x LESS '-i -M -R -q'

mkdir -p $HOME/.local/apps/bin 
set -gx PATH $HOME/.local/bin $PATH

# set -x MANPAGER 'nvim -c Man -'
