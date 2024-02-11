{ icons, ... }:
{
	programs.nixvim.plugins = {
    # Utils
    oil.enable = true;
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

    indent-blankline = let
      icon = icons.ui.line.left;
    in { 
      enable = true; 
      exclude = {
        buftypes = [ "nofile" ];
        filetypes = [
          "text"
          "lspinfo"
          "neogitstatus"
          "TelescopePrompt"
        ];
      };
      indent.char = icon;
      whitespace.removeBlanklineTrail = false;
      scope = { enabled = true; char = icon; };
    };

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
  };
}
