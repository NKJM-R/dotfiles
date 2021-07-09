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
  
  bind -M default -m default \csl tmux_session_list
  bind -M default -m default \css tmux_session_search
  bind -M default -m default \csn tmux_session_new

  bind -M default -m default \cwv tmux_split_window_v
  bind -M default -m default \cws tmux_split_window_s
  bind -M default -m default \cwn tmux_new_window

  bind -M default -m default \cwf tmux_next_window
  bind -M default -m default \cwb tmux_back_window

  bind -M default -m default \cw\cv tmux_split_window_v
  bind -M default -m default \cw\cs tmux_split_window_s
  bind -M default -m default \cw\cn tmux_new_window

  bind -M default -m default \cw\cf tmux_next_window
  bind -M default -m default \cw\cb tmux_back_window

  bind -M default -m default \cww tmux_select_pane_next
  bind -M default -m default \cwh tmux_select_pane_left
  bind -M default -m default \cwj tmux_select_pane_down
  bind -M default -m default \cwk tmux_select_pane_up
  bind -M default -m default \cwl tmux_select_pane_right

  bind -M default -m default \cw\cw tmux_select_pane_next
  bind -M default -m default \cw\ch tmux_select_pane_left
  bind -M default -m default \cw\cj tmux_select_pane_down
  bind -M default -m default \cw\ck tmux_select_pane_up
  bind -M default -m default \cw\cl tmux_select_pane_right

  source ~/.config/dotfiles/.aliasrc 
end

function tmux_session_list
  tmux ls
end

function tmux_select_pane_next
  tmux select-pane -t +
end

function tmux_select_pane_left
  tmux select-pane -L
end

function tmux_select_pane_down
  tmux select-pane -D
end

function tmux_select_pane_up
  tmux select-pane -U
end

function tmux_select_pane_right
  tmux select-pane -R
end

function tmux_split_window_s
  tmux split-window -v
end

function tmux_split_window_v
  tmux split-window -h
end

function tmux_new_window
  tmux new-window
end

function tmux_next_window
  tmux select-window -t :+
end

function tmux_back_window
  tmux select-window -t :-
end

function tmux_session_search
  tmux list-sessions -F \"[##{session_windows}] ##S\" | fzf-tmux | sed 's/^\[[0-9]*\] //' | xargs tmux switch -t
end

function tmux_session_new
  tmux detauch-client
  read SESSION_NAME
  tmux new -s $SESSION_NAME
end
