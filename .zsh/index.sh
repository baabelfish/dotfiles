#!/bin/bash
# Start X-session when logged in from tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
    logout
fi

[[ -e ~/.zsh/colors.sh ]] && source ~/.zsh/colors.sh             # Nicer colors for everything
[[ -e ~/.zsh/zshsettings.sh ]] && source ~/.zsh/zshsettings.sh   # Basic zsh-settings
[[ -e ~/.xutils/init.sh ]] && ~/.xutils/init.sh

[[ -e ~/.zsh/alias.sh ]] && source ~/.zsh/alias.sh               # Basic aliases to make life easier
[[ -e ~/.zsh/bookmarks.sh ]] && source ~/.zsh/bookmarks.sh       # For bookmarking directories (with ranger integration)
[[ -e ~/.zsh/help.sh ]] && source ~/.zsh/help.sh                 # Massive help index
[[ -e ~/.zsh/miscfuncs.sh ]] && source ~/.zsh/miscfuncs.sh       # All more or less useless
[[ -e ~/.zsh/packages.sh ]] && source ~/.zsh/packages.sh         # Package management utilities
[[ -e ~/.zsh/prompt.sh ]] && source ~/.zsh/prompt.sh             # Prompt specific settings
[[ -e ~/.zsh/tags.sh ]] && source ~/.zsh/tags.sh                 # For bookmarking files (with ranger integration)
[[ -e ~/.zsh/vimfuncs.sh ]] && source ~/.zsh/vimfuncs.sh         # Short vim-like commands
