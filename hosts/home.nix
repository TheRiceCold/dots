{ user, config, lib, pkgs, ... }:

{
  imports = [ (import ../modules/desktop/hyprland) ];

  home = {
    username = "${user}";
    stateVersion = "22.11";
    homeDirectory = "/home/${user}";
  };

  programs = {
    home-manager.enable = true;
    git = {
      userName = "Dale Walter G. Hicban";
      userEmail = "dalewaltergh@gmail.com";
    };
  };
}
