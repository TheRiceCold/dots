{ inputs, pkgs, ... }:
{
	imports = [ inputs.nixvim.nixosModules.nixvim ];

	programs.nixvim = {
	  enable = true;

		extraPlugins = with pkgs.vimPlugins; [
			comment-nvim
			catppuccin-nvim
		];

	  options = {
			tabstop = 2;
	    number = true;
			cmdheight = 1;
			showtabline = 1;
			smartcase = true;
			showmode = false;
			updatetime = 100;
			autoindent = true;
			ignorecase = true;
			smartindent = true;
	    relativenumber = true;
			clipboard = "unnamedplus";
	  };

	  globals.mapleader = " ";

		colorscheme = "catppuccin";

	  plugins = {
			emmet.enable = true;
	    telescope.enable = true;
	    which-key = {
				enable = true;
				showHelp = true;
				showKeys = true;
				triggers = "auto";
				plugins = {
					marks = false;
					registers = false;
					spelling = {
						enabled = true;
						suggestions = 20;
					};
				};

				window = {
					winblend = 0;
					border = "rounded";
					position = "bottom";
					margin = { top = 1; right = 0; bottom = 1; left = 0; };
					padding = { top = 2; right = 2; bottom = 2; left = 2; };
				};

				layout = {
					spacing = 3;
					align = "left";
					height = { min = 4; max = 25; };
					width = { min = 20; max = 50; };
				};
			};
			bufferline.enable = true;
			nvim-colorizer.enable = true;
	    lsp = {
	      enable = true;
	      servers = {
	        tsserver.enable = true;
	        tailwindcss.enable = true;
	        rust-analyzer.enable = true;
	      };
	    };
	  };

		keymaps = import ./keymaps.nix;

		extraConfigLua = ''

		'';
	};
}
