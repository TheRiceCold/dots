{ inputs, pkgs, ... }:
let
  inherit (inputs.nixvim.nixosModules) nixvim;
in {
  environment.systemPackages = with pkgs; [ 
    ripgrep # for telescope live_grep
  ];

	imports = [ nixvim ./plugins ];

	programs.nixvim = {
	  enable = true;
	  globals.mapleader = " ";
		keymaps = import ./keymaps.nix;
	  options = import ./options.nix;

    colorschemes = {
      catppuccin = {
        enable = true;
        flavour = "mocha";
        dimInactive.enabled = true;
      };
    #   gruvbox = { enable = true; };
    };
		colorscheme = "catppuccin";
	};
}
