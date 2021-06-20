# # 必要なものをインストール
# if [ "$(uname)" == 'Darwin' ]; then
#   # Mac用の設定
# elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#   # Linux用の設定
# fi
# neovimインストール

DIR=$(cd $(dirname $0); pwd)

source ${DIR}/.neovimrc

# export設定
source ${DIR}/.exportrc

# alias設定
source ${DIR}/.aliasrc

bindkey '^f' forward-word
bindkey '^b' backward-word

