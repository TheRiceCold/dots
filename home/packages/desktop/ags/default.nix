# TODO: Move to separate repo
{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  services.playerctld.enable = true;

  home.packages = with pkgs; [
    bun
    dart-sass
    libnotify
    playerctl
    brightnessctl

    inputs.matugen.packages.${pkgs.system}.default
  ];

  programs.ags = {
    enable = true;
    # configDir = conf.config;
    extraPackages = with pkgs; [ gtksourceview3 ];
  };
}
