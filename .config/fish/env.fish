set -gx NVIM_TUI_ENABLE_TRUE_COLOR '1'
set -gx NVIM_TUI_ENABLE_CURSOR_SHAPE '1'
set -gx TERM 'xterm-termite'
set -gx NO_FISHMARKS_COMPAT_ALIASES
set -gx EDITOR 'nvim'
set -gx NEDITOR 'nvim'
set -gx VISUAL 'nvim'
set -gx BROWSER 'google-chrome-stable'
set -gx LESS '-i -M -R -q'
set -gx FZF_DEFAULT_OPTS '-e --no-mouse --prompt=: --toggle-sort=f1 --color=dark,fg:251,bg:0,hl:156,fg+:255,bg+:0,prompt:118,pointer:112'
set -gx fish_term24bit 1

mkdir -p $HOME/.local/apps/bin 
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.nimble/bin $PATH

# set -x MANPAGER 'nvim -c Man -'
