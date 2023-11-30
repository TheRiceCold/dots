{ user, pkgs, ... }:

{
  home-manager.users.${user} = {
    home.packages = [ pkgs.neofetch ];
    xdg.configFile."neofetch/config.conf".text = import ./config.nix;
  };
}
