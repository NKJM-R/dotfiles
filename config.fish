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
  bind -M default -m default \csp tmux_session_previous
  bind -M default -m default \csn tmux_session_next
  bind -M default -m default \csc tmux_session_create

  bind -M default -m default \cwv tmux_split_window_v
  bind -M default -m default \cws tmux_split_window_s
  bind -M default -m default \cwc tmux_window_create

  bind -M default -m default \cwn tmux_window_next
  bind -M default -m default \cwp tmux_window_previous
  bind -M default -m default \cw\ce tmux_pane_resize

  bind -M default -m default \cweh tmux_pane_resize_h
  bind -M default -m default \cwej tmux_pane_resize_j
  bind -M default -m default \cwek tmux_pane_resize_k
  bind -M default -m default \cwel tmux_pane_resize_l

  bind -M default -m default \cw\cv tmux_split_window_v
  bind -M default -m default \cw\cs tmux_split_window_s
  bind -M default -m default \cw\cc tmux_window_create

  bind -M default -m default \cw\cf tmux_window_next
  bind -M default -m default \cw\cb tmux_window_previous

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

function tmux_window_create
  tmux new-window
end

function tmux_window_next
  tmux select-window -t :+
end

function tmux_window_previous
  tmux select-window -t :-
end

function tmux_session_search
  tmux list-sessions -F \"[##{session_windows}] ##S\" | fzf-tmux | sed 's/^\[[0-9]*\] //' | xargs tmux switch -t
end

function tmux_session_create
  tmux detach-client
  tmux
end

function tmux_session_previous
  tmux switch-client -p
end

function tmux_session_next
  tmux switch-client -n
end

function tmux_pane_resize
  set fish_bind_mode insert;
  while true;
    read -p 'echo resize mode \>\ ' -s -n 1 input
    switch $input
      case h
        tmux resize-pane -L 1
      case j
        tmux resize-pane -D 1
      case k
        tmux resize-pane -U 1
      case l
        tmux resize-pane -R 1
      case 'q'
        break
      case '*'
        echo 'resize mode exits is push to key [q]'
    end
  end;
  set fish_bind_mode default;
end

function tmux_pane_resize_j
  tmux resize-pane -D 1
end

function tmux_pane_resize_k
  tmux resize-pane -U 1
end

function tmux_pane_resize_l
  tmux resize-pane -L 1
end

function hello
  echo hello
end
