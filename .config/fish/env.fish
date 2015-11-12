set -x NVIM_TUI_ENABLE_TRUE_COLOR '1'
set -x NVIM_TUI_ENABLE_CURSOR_SHAPE '1'
set -x TERM 'xterm-termite'
set -x NO_FISHMARKS_COMPAT_ALIASES
set -x EDITOR 'nvim'
set -x NEDITOR 'nvim'
set -x VISUAL 'nvim'
set -x BROWSER 'google-chrome-stable'
set -x LESS '-i -M -R -q'
set -x FZF_DEFAULT_OPTS '-e --no-mouse --prompt=: --toggle-sort=f1 --color=dark,fg:251,bg:0,hl:156,fg+:255,bg+:0,prompt:118,pointer:112'

mkdir -p $HOME/.local/apps/bin 
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.nimble/bin $PATH
set -gx /usr/bin/core_perl $HOME/.local/bin $PATH

# set -x MANPAGER 'nvim -c Man -'
