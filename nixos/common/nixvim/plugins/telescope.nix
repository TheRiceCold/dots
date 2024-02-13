let
  icons = import ../icons.nix;
in {
  enable = true;
  defaults = {
    prompt_prefix = "${icons.ui.telescope} ";
    color_devicons = true;
    vimgrep_arguments = [
      "rg"
      "--color=never"
      "--no-heading"
      "--with-filename"
      "--line-number"
      "--column"
      "--smart-case"
      "--hidden"
      "--glob=!.git/"
    ];
    mappings = [

    ];
  };
  extensions = {
    file_browser = { enable = true; };
    # frecency.enable = true;
    # fzf-native = { enable = true; };
    # media-files = { enable = true; };
    # project-nvim = { enable = true; };
  };
}
