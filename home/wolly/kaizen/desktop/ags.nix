# TODO: Move to separate repo
{ inputs, pkgs, ... }:
let
  inherit (inputs) ags astal matugen;
in {
  imports = [
    ags.homeManagerModules.default
    astal.homeManagerModules.default
  ];

  services.playerctld.enable = true;

  home.packages = with pkgs; [
    bun
    dart-sass
    libnotify
    playerctl
    brightnessctl

    matugen.packages.${pkgs.system}.default
  ];

  programs = {
    cava.enable = true;
    astal = {
      enable = true;
      extraPackages = with pkgs; [
        libadwaita
      ];
    };
    ags = {
      enable = true;
      # configDir = conf.config;
      extraPackages = with pkgs; [ gtksourceview3 ];
    };
  };
}
