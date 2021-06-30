bind -x ' "C-X": "ls -la" '
# ctrl+fで次の単語に移動
bind '"\C-f": forward-word'
# ctrl+bで前の単語に移動
bind '"\C-b": backward-word'

DIR=~/.config/dotfiles

# source ${DIR}/.neovimrc

# export設定
source ${DIR}/.exportrc

# alias設定
source ${DIR}/.aliasrc

