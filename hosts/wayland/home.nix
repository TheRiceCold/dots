{ user, config, lib, pkgs, ... }:

{
  imports = 
    [ (import ../../modules/desktop/hyprland/home.nix) ] ++
    (import ../../modules/shell) ++
    (import ../../modules/programs);

  home = {
    username = "${user}";
    stateVersion = "22.11";
    homeDirectory = "/home/${user}";
  };

  programs = {
    home-manager.enable = true;
  };
}
