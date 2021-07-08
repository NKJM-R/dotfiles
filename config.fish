if status is-interactive
  fish_vi_key_bindings
  bind -M insert \ca beginning-of-line
  bind -M insert \cb backward-char
  bind -M insert \cd delete-or-exit
  bind -M insert \ce end-of-line
  bind -M insert \cf forward-char
  bind -M insert \ch backward-delete-char
  bind -M insert \ck kill-line
  bind -M insert \cl 'clear; commandline -f repaint'
  bind -M insert \cn history-search-forward
  bind -M insert \cp history-search-backward
  
  bind -M default \cwv tmux_split_window_v
  bind -M default \cws tmux_split_window_s

  source ~/.config/dotfiles/.aliasrc 
end

function tmux_split_window_s
  tmux split-window -v
end

function tmux_split_window_v
  tmux split-window -h
end
