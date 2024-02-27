{ inputs, pkgs, ... }:
let
  ags = inputs.ags.homeManagerModules.default;
  matugen = inputs.matugen.packages.${pkgs.system}.default;

  # conf = pkgs.callPackage ./config { inherit inputs; };
in {
  imports = [ ags ];

  services.playerctld.enable = true;

  home.packages = with pkgs; [
    bun
    matugen
    dart-sass
    libnotify
    playerctl
    brightnessctl

    gtk3
  ];

  programs.ags = {
    enable = true;
    # configDir = conf.config;
    extraPackages = with pkgs; [ gtksourceview3 ];
  };
}
