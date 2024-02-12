{ icons, ... }:
{
	programs.nixvim.plugins = {
    emmet.enable = true;
    comment-nvim = {
      enable = true;
      sticky = true;
      padding = true;
      ignore = "^$";
      toggler = { line = "gcc"; block = "gbc"; };
      opleader = { line = "gc"; block = "gb"; };
      mappings = { basic = true; extra = true; };
    };
    nvim-colorizer.enable = true;

    nvim-autopairs = { 
      enable = true; 
      mapBs = true;
      disableInMacro = false;
      enableAfterQuote = true;
      enableMoveright = true;
      disableInVisualblock = false;
      enableCheckBracketLine = false;
      disabledFiletypes = [ "TelescopePrompt" "spectre_panel" ];
    };

    todo-comments = { enable = true; };

    # Nodule references: https://github.com/echasnovski/mini.nvim/blob/main/readmes
    mini = {
      enable = true;
      modules = {
        animate = { };
        basics = { 
          options = { };
          mappings = {
            basic = true;
            windows = true;
          };
          autocommands = { 
            basic = true;
            relnum_with_alt = true;
          };
        };
        files = { };
        indentscope.symbol = icons.ui.line.left;
        jump2d = {
          view.dim = true;
          mappings.start_jumping = "f";
        };
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
    };
  };
}
