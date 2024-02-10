{
  insert = {
    C-s = ":w";
    C-c = "normal_mode";
    A-h = "move_char_left";
    A-j = "move_line_down";
    A-k = "move_line_up";
    A-l = "move_char_right";
  };
  normal = {
    C-s = ":w";
    L = ":bnext";
    H = ":bprev";
    G = "goto_last_line";
    space = {
      c = ":bclose"; 
      l.f = ":format";
    };
  };
}
