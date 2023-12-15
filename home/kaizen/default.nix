{ inputs, pkgs, ... }:

{
  imports = [ ];

  home.username = "kaizen";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;  
}
