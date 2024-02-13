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
    colorschemes = import ./colorschemes.nix;
		colorscheme = "catppuccin";
	};
}
