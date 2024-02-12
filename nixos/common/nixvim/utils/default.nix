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
    toggleterm = { 
      enable = true; 
      direction = "float";
      openMapping = "<c-1>";
      floatOpts = {
        border = "curved";
      };
    };

    mini = import ./mini.nix { inherit icons; };
  };
}
