{ inputs, pkgs, ... }:

let
  inherit (inputs.nixvim.nixosModules) nixvim;
in {
  imports = [ 
    nixvim 
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    options = {
      number = true;
      relativenumber = true;
    };

    globals.mapleader = " ";

    # keymaps = [
    #   {
    #     action = "<cmd>Telescope live_grep<CR>";
    #     key = "<leader>g";
    #   }
    # ];

    plugins = {
      neorg.enable = true;
      neo-tree.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      # toggleterm.enable = true;
      vimtex.enable = true;
      which-key.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [

    ];
  };
}
