# Nodule references: https://github.com/echasnovski/mini.nvim/blob/main/readmes
{ icons, ... }: {
  enable = true;
  modules = {
    animate = { };

    basics = {
      options = { };
      mappings = { basic = true; windows = true; };
      autocommands = { basic = true; relnum_with_alt = true; };
    };

    clue = {
      clues = [
        { mode = ""; keys = "<leader>f"; desc = "+Find"; }
        { mode = ""; keys = "<leader>g"; desc = "+Git"; }
        { mode = ""; keys = "<leader>l"; desc = "+Lsp"; }
        { mode = ""; keys = "<leader>c"; desc = "+Comment"; }
        { mode = ""; keys = "<leader>t"; desc = "+Terminal"; }
        { mode = ""; keys = "gD"; desc = "references"; }
        { mode = ""; keys = "gi"; desc = "implementation"; }
        { mode = ""; keys = "gd"; desc = "Go to definition"; }
      ];
      triggers = [
        { mode = ""; keys = "g"; }
        { mode = ""; keys = "z"; }
        { mode = ""; keys = "<leader>"; }
      ];
    };

    files = {
      mappings = { };
      windows.preview = true;
    };

    indentscope.symbol = icons.ui.line.left;

    jump2d = { view.dim = true; mappings.start_jumping = "f"; };

    splitjoin = { };

    move = {
      mappings = {
        left = "<S-,>";
        right = "<S-.>";
        down = "<M-j>";
        up = "<M-k>";

        line_left = "<S-,>";
        line_right = "<S-.>";
        line_down = "<M-j>";
        line_up = "<M-k>";
      };
    };

    tabline = { };
    # test = { };
    trailspace = { };
  };
}
