{ pkgs, ... }:
{
  imports = [ ./themes ];

  home.packages = [ pkgs.zed-editor ];

  xdg.configFile = {
    "zed/keymap.json".text = import ./keymaps.nix;
    "zed/settings.json".text = import ./settings.nix;
  };
}
