{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.nvim-autopairs ];
    plugins.autopairs.enable = true;
  };
}
