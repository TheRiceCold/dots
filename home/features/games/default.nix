{ pkgs, ... }:
{
  home.packages = with pkgs; [
    uchess
    vitetris
    _2048-in-terminal

    celeste-classic
    # celeste-classic-pm
  ];
}
