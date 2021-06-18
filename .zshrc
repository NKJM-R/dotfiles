# # 必要なものをインストール
# if [ "$(uname)" == 'Darwin' ]; then
#   # Mac用の設定
# elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#   # Linux用の設定
# fi
# neovimインストール
source `pwd`/.neovimrc

# export設定
source `pwd`/.exportrc

# alias設定
source `pwd`/.aliasrc

bindkey '^f' forward-word
bindkey '^b' backward-word

