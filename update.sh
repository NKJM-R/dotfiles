#!/bin/bash

# ユーザーのホームディレクトリ内の設定ファイルパスを定義
export DOTFILES="${HOME}/.config/dotfiles"

# 引数の有無をチェックし、なければすべての設定を更新
if [ $# -eq 0 ]; then
    set -- "fish" "bash" "zsh" "tmux" "alacritty" "tmuxinator"
fi

# 引数として指定された設定を更新
for arg in "$@"; do
    case $arg in
        fish)
            echo "Updating fish configuration..."
            mkdir -p ~/.config/fish/
            echo "source ${DOTFILES}/config.fish" > ~/.config/fish/config.fish
            ;;
        bash)
            echo "Updating bash configuration..."
            cat "${DOTFILES}/bashrc" > ~/.bashrc
            ;;
        zsh)
            echo "Updating zsh configuration..."
            cat "${DOTFILES}/zshrc" > ~/.zshrc
            ;;
        tmux)
            echo "Updating tmux configuration..."
            cat "${DOTILES}/tmux.conf" > ~/.tmux.conf
            ;;
        alacritty)
            echo "Updating alacritty configuration..."
            mkdir -p ~/.config/alacritty
            cat "${DOTFILES}/alacritty.toml" > ~/.config/alacritty/alacritty.toml
            ;;
        tmuxinator)
            echo "Updating tmuxinator configurations..."
            mkdir -p ~/.config/tmuxinator
            cp "${DOTFILES}/tmuxinator/"* ~/.config/tmuxinator/.
            ;;
        *)
            echo "Error: Unsupported option '$arg'"
            exit 1
            ;;
    esac
done

echo "Update completed."

