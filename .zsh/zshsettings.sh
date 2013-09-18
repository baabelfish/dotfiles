#!/bin/bash
# Necessary for own applications
PATH="$HOME/.local/bin:$PATH"

################################################################################
# ZSH specific settings
################################################################################
#setopt SHARE_HISTORY
autoload -U colors && colors
autoload -U compinit promptinit
autoload -U select-word-style
autoload -U zmv
bindkey -v
compinit
select-word-style bash
set -o vi
setopt APPEND_HISTORY
setopt MAILWARN
setopt NOHUP
setopt NOTIFY
setopt autopushd
setopt completealiases
setopt hist_ignore_dups
setopt hist_ignore_space
umask 022
zmodload zsh/curses
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:match:*' original only
[[ "${terminfo[colors]}" -ge 8 ]] && zstyle ':completion:*:default' list-colors $LS_COLORS


################################################################################
# Exports
################################################################################
# History management
HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

# [[ -n $(echo $TTY|grep tty) ]] && export TERM=xterm
# [[ -n $TMUX ]] && export TERM='screen-256color'
export CHROME_BIN='/usr/bin/chromium'
export MANWIDTH=80
export MOSH_TITLE_NOPREFIX=1
export TERM='rxvt-unicode-256color'
export _JAVA_AWT_WM_NONREPARENTING=1
export npm_config_prefix="$HOME/.local"


##################################################################
# Bindings
##################################################################
backward-delete-to-slash() {
    local WORDCHARS=${WORDCHARS//\//}
    zle .backward-delete-word
}; zle -N backward-delete-to-slash
history-complete() {
    eval $(tac ~/.zsh_history|awk ' !x[$0]++'|./bcmenu)
    zle reset-prompt
}
go-to-previous() {
    popd
    precmd
    zle reset-prompt
}; zle -N go-to-previous
bindkey -a > /dev/null

typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey '^[k' go-to-previous
bindkey '^[b' backward-word
bindkey -s '^K' 'cl\n'
bindkey '^[f' forward-word
bindkey '^W' backward-delete-to-slash
bindkey '^i' expand-or-complete-prefix
bindkey -s '^O' '^qpopd && clear && l\n'
bindkey "^R" history-incremental-pattern-search-backward 
