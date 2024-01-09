{ inputs, pkgs, ... }:

let
  inherit (inputs.nixvim.nixosModules) nixvim;
in {
  imports = [
    nixvim

    ./keymaps.nix
    ./options.nix
    ./telescope.nix
    ./treesitter.nix
    ./git.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    colorschemes.gruvbox.enable = true;

    globals.mapleader = " ";

    plugins = {
      oil.enable = true;
      emmet.enable = true;
      neorg.enable = true;
      vimtex.enable = true;

      nvim-tree = {
        enable = true;
        openOnSetupFile = true;
      };

      which-key = {
        enable = true;
        showKeys = true;
      };

      bufferline.enable = true;
    };

    # extraPlugins = with pkgs.vimPlugins; [ ];
  };
}
