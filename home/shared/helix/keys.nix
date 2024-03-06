{
  insert = {
    C-s = ":w";
    C-c = "normal_mode";
  };
  normal = {
    C-s = ":w";

    C-h = "jump_view_left";
    C-j = "jump_view_down";
    C-k = "jump_view_up";
    C-l = "jump_view_right";

    L = ":bnext";
    H = ":bprev";
    G = "goto_last_line";
    V = [ "select_mode" "extend_to_line_bounds" ];

    # Like Vim
    w = [ "move_next_word_start" "move_char_right" "collapse_selection" ];
    W = [ "move_next_long_word_start" "move_char_right" "collapse_selection" ];
    b = [ "move_prev_word_start" "collapse_selection" ];
    B = [ "move_prev_long_word_start" "collapse_selection" ];
    j = "move_line_down";
    k = "move_line_up";
    x = "delete_selection";

    space = {
      c = ":bclose";
      l.f = ":format";
    };
    d.d = [ "extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection" ];
  };

  select = {
    C-c = "normal_mode";
    k = [ "extend_line_up" "extend_to_line_bounds" ];
    j = [ "extend_line_down" "extend_to_line_bounds" ];
    p = "replace_selections_with_clipboard";
  };
}
