pkgs: {
  normal = let
    lazygit = [":new" ":insert-output lazygit" ":buffer-close!" ":redraw"];
  in {
    space = {
      w = ":w";
      q = ":q";
      g = lazygit;
      d = ":buffer-close";
      o = "file_picker_in_current_buffer_directory";
    };

    K = "hover";
    L = ":buffer-next";
    H = ":buffer-previous";

    C-r = ":config-reload";
    C-c = ["toggle_comments" "move_visual_line_down"];

    A-l = "indent";
    A-h = "unindent";
    A-j = ["extend_to_line_bounds" "delete_selection" "paste_after"];
    A-k = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];

    "~" = ["switch_case" "move_char_right"];
    p = ["paste_clipboard_after" "collapse_selection"];
    P = ["paste_clipboard_before" "collapse_selection"];
    d = ["yank_main_selection_to_clipboard" "delete_selection"];
    D = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection"];
    C = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection" "insert_mode"];

    i = ["insert_mode" "collapse_selection"];
    a = ["append_mode" "collapse_selection"];

    X = "extend_line_above";
  };

  insert = { };

  select = let
    move = [
      "ensure_selections_forward"
      "extend_to_line_bounds"
      "extend_char_right"
      "extend_char_left"
      "delete_selection"
    ];
  in {
    A-l = "indent";
    A-h = "unindent";
    A-j = move ++ ["add_newline_below" "move_line_down" "replace_with_yanked"];
    A-k = move ++ ["move_line_up" "add_newline_above" "move_line_up" "replace_with_yanked"];

    p = "replace_selections_with_clipboard";
    d = ["yank_main_selection_to_clipboard" "delete_selection"];
    y = ["yank_main_selection_to_clipboard" "normal_mode" "flip_selections" "collapse_selection"];
  };
}
