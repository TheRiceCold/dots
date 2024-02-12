{ inputs, pkgs, ... }:
let
  icons = import ./icons.nix;
in {
	imports = [
    inputs.nixvim.nixosModules.nixvim 
    (import ./utils.nix { inherit icons; })
  ];

	programs.nixvim = {
	  enable = true;

		extraPlugins = with pkgs.vimPlugins; [ catppuccin-nvim ];

	  globals.mapleader = " ";
		colorscheme = "catppuccin";
	  options = import ./options.nix;

	  plugins = {
	    lsp = import ./lsp.nix;
      inc-rename = { enable = true; };
      nvim-cmp = { enable = true; };

      # UI
      noice = { enable = true; };

			# Git
      neogit = { enable = true; };
			gitsigns = { enable = true; };

	    telescope = {
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
				};
      };
			navic = { enable = true; };
      lualine = { enable = true; };
      treesitter = {
        enable = true;
        indent = true;
        nixGrammars = true;
        ensureInstalled = [ "comment" "markdown_inline" "regex" ];
      };
	  };
		keymaps = import ./keymaps.nix;
	};
}
