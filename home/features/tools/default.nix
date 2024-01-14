{ pkgs, ... }:
{
  home.packages = with pkgs; [ sioyek ];

  imports = [
    ./zathura
  ];
}
