# !/bin/bash
export DOTFILES="${HOME}/.config/dotfiles"

# fish
echo "source ${DOTFILES}/config.fish" > ~/.config/fish/config.fish

# zsh
cat "${DOTFILES}/bashrc" > ~/.bashrc

# zsh
cat "${DOTFILES}/zshrc" > ~/.zshrc

# tmux
cat "${DOTFILES}/tmux.conf" > ~/.tmux.conf

# alacritty
mkdir ~/.config/alacritty
cat "${DOTFILES}/alacritty.yml" > ~/.config/alacritty/alacritty.yml

# tmuxinator
mkdir ~/.config/tmuxinator
cp tmuxinator/* ~/.config/tmuxinator/.

