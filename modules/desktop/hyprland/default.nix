{ pkgs, ... }:

{
  imports = [ ../../programs/wayland/waybar ];

  environment.systemPackages = with pkgs; [ ];
}
