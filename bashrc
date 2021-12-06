DOTFILES=~/.config/dotfiles

bind -f ${DOTFILES}/.inputrc

# export設定
source ${DOTFILES}/.exportrc

# alias設定
source ${DOTFILES}/.aliasrc

# プロンプトを変更
BRANCH='$(__git_ps1 "%s")'
export PS1="\t $BRANCH \W $ "
eval "$(starship init bash)"
