{ inputs, pkgs, ... }:

let
  inherit (inputs.nixvim.nixosModules) nixvim;
in {
  imports = [
    nixvim

    # Config files
    ./keymaps.nix
    ./options.nix
    ./telescope.nix
    ./treesitter.nix
    ./toggleterm.nix
    ./bufferline.nix
    # ./autopairs.nix
    ./nvimtree.nix
    ./whichkey.nix
    ./lualine.nix
    ./git.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    globals.mapleader = " ";

    extraPlugins = with pkgs.vimPlugins; [ 
      # Colorschemes
      dracula-nvim
      catppuccin-nvim

      comment-nvim
    ];

    plugins = {
      dap.enable = true;
      oil.enable = true;
      emmet.enable = true;
      neorg.enable = true;
      vimtex.enable = true;
      undotree.enable = true;
      nvim-colorizer.enable = true;
    };

    colorscheme = "catppuccin";
  };
}
