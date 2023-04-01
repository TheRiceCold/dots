{ pkgs, ... }:

{
  imports = [ ../../programs/waybar.nix ];

  environment.systemPackages = with pkgs; [ ];
}
