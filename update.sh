# !/bin/bash
DOTFILES="${HOME}/.config/dotfiles"

# fish
echo "source ${DOTFILES}/config.fish" > ~/.config/fish/config.fish

# tmux
cat "${DOTFILES}/.tmux.conf" > ~/.tmux.conf

# alacritty
# cat "${DOTFILES}/alacritty.yml" > ~/.config/alacritty/alacritty.yml

# tmuxinator
mkdir ~/.config/tmuxinator
cp tmuxinator/* ~/.config/tmuxinator/.

