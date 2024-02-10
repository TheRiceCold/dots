{ pkgs, ... }:
{
  home.packages = with pkgs; [
    uchess
    vitetris
    _2048-in-terminal

    bottles
    celeste-classic
  ];
}
