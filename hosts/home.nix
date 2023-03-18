{ config, lib, pkgs, user, impermanence, ... }:

{
  home = {
    username = "${user}";
    stateVersion = "22.11";
    homeDirectory = "/home/${user}";
  };

  programs = {
    home-manager.enable = true;
  };
}
