# https://github.com/helix-editor/helix/blob/master/helix-term/src/commands.rs
pkgs: {
  normal = let
    yazi = [":new" ":insert-output yazi" ":buffer-close!" ":redraw"];
    lazygit = [":new" ":insert-output lazygit" ":buffer-close!" ":redraw"];
  in {
    space = {
      w = ":w";
      q = ":q";
      y = yazi;
      g = lazygit;
      c = ":buffer-close";
      o = "file_picker_in_current_buffer_directory";

      # Copy full buffer
      # space = ["save_selection" "select_all" "yank_main_selection_to_clipboard" "jump_backward"];
    };


    K = "hover";
    L = ":buffer-next";
    H = ":buffer-previous";

    C-r = ":config-reload";

    # Move current line
    A-l = ["goto_line_start" "insert_tab"];
    A-j = ["extend_to_line_bounds" "delete_selection" "paste_after"];
    A-k = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];

    # Vim-like binds
    G = "goto_file_end";
    "~" = ["switch_case" "move_char_right"];
    V = ["select_mode" "extend_to_line_bounds"];
    p = ["paste_clipboard_after" "collapse_selection"];
    P = ["paste_clipboard_before" "collapse_selection"];
    D = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection"];
    C = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection" "insert_mode"];
    y = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "normal_mode" "collapse_selection"];

    i = ["insert_mode" "collapse_selection"];
    a = ["append_mode" "collapse_selection"];

    x = "delete_selection";
    B = ["move_prev_long_word_start" "collapse_selection"];
    W = ["move_next_long_word_start" "move_char_right" "collapse_selection"];
  };

  insert = {};

  select = let
    move = [
      "ensure_selections_forward"
      "extend_to_line_bounds"
      "extend_char_right"
      "extend_char_left"
      "delete_selection"
    ];
  in {
    A-l = ["goto_line_start" "insert_tab"];
    A-j = move ++ ["add_newline_below" "move_line_down" "replace_with_yanked"];
    A-k = move ++ ["move_line_up" "add_newline_above" "move_line_up" "replace_with_yanked"];

    p = "replace_selections_with_clipboard";
    d = ["yank_main_selection_to_clipboard" "delete_selection"];
    x = ["yank_main_selection_to_clipboard" "delete_selection" "insert_mode"];
    y = ["yank_main_selection_to_clipboard" "normal_mode" "flip_selections" "collapse_selection"];
  };
}
