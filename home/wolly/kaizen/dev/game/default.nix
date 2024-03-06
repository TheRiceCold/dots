{ pkgs, ... }:
{
  home.packages = with pkgs; [
    godot_4
  ];
}
