{ pkgs, ... }:
{
  home.packages = [ pkgs.lunarvim ];
  programs.neovim = {
    enable = true;
    extraConfig = ''

    '';
  };

  # home.file.".config/lvim/config.lua".text = ''
  #   lvim.colorscheme = "gruvbox"

  #   lvim.transparent_window = true
  #   lvim.plugins = {
  #     { "lervag/vimtex" },
  #     { 
  #       "ellisonleao/gruvbox.nvim", 
  #       priority = 1000, 
  #       config = true, 
  #      opts = ...
  #     },
  #     {
  #       "nvim-neorg/neorg",
  #       build = ":Neorg sync-parsers", 
  #       dependencies = { "nvim-lua/plenary.nvim" },
  #       config = function()
  #         require("neorg").setup {
  #           load = {
  #             ["core.defaults"] = { },
  #             ["core.concealer"] = {
  #               config = { }
  #             },
  #             ["core.dirman"] = {
  #               config = {
  #                 workspaces = { norg = "~/Documents/norg", },
  #                 default_workspace = "norg",
  #               },
  #             },
  #           },
  #         }

  #         vim.wo.foldlevel = 99
  #         vim.wo.conceallevel = 2
  #       end,
  #     },
  #   }

  #   lvim.builtin.lualine.options.theme = "gruvbox"  
  # '';
}
