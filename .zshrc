bindkey -v
DIR=$(cd $(dirname $0); pwd)

# export設定
source ${DIR}/.exportrc

# alias設定
source ${DIR}/.aliasrc

function zle-line-init zle-keymap-select {
    VIM_NORMAL="%K{208}%F{black} %k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208} %k%f"
    VIM_INSERT="%K{075}%F{black} %k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075} %k%f"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    RPS2=$RPS1
    zle reset-prompt
}
function split {
  tmux split-window -v
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^b' backward-char
bindkey -M viins '^d' delete-char-or-list
bindkey -M viins '^e' end-of-line
bindkey -M viins '^f' forward-char
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^k' kill-line
bindkey -M viins '^l' clear-screen
bindkey -M viins '^n' history-search-forward
bindkey -M viins '^p' history-search-backward

bindkey -M vicmd '^p' history-search-backward
bindkey -M vicmd '^n' history-search-forward
bindkey -M vicmd '^w' split()

bindkey 
