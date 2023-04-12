{ pkgs, ... }:

{
  imports = [ ../../programs/waybar ];

  environment.systemPackages = with pkgs; [ ];
}
