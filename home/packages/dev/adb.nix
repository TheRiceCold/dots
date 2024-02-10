{ pkgs, ... }:
{ 
  programs.adb.enable = true; 
  home.packages = with pkgs; [
    android-tools
    android-udev-rules
  ];
}
