{ pkgs, ... }:
{
  home = {
    packages = [ pkgs.lunarvim ];
    file.".config/lvim/config.lua".text = ''
      ${import ./keymaps.nix}
      ${import ./plugins.nix}

      lvim.transparent_window = true
      lvim.colorscheme = 'catppuccin'
    '';
  };
}
