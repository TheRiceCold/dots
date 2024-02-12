{ icons, ... }:
# Nodule references: https://github.com/echasnovski/mini.nvim/blob/main/readmes
{
  enable = true;
  modules = {
    animate = { };

    basics = { 
      options = { };
      mappings = { basic = true; windows = true; };
      autocommands = { basic = true; relnum_with_alt = true; };
    };

    files = { 
      mappings = { };
      windows = { preview = true; };
    };

    indentscope.symbol = icons.ui.line.left;

    jump2d = { view.dim = true; mappings.start_jumping = "f"; };

    splitjoin = { };

    move = {
      mappings = {
        left = "<M-h>";
        right = "<M-l>";
        down = "<M-j>";
        up = "<M-k>";

        line_left = "<M-h>";
        line_right = "<M-l>";
        line_down = "<M-j>";
        line_up = "<M-k>";
      };
    };

    tabline = { }; 
    # test = { };
    trailspace = { };
  };
}
