{ inputs, pkgs, ... }:
{
  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
  };

  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles = import ./profiles { inherit inputs pkgs; };
  };

  xdg.mimeApps.defaultApplications = {
    "text/xml" = [ "firefox.desktop" ];
    "text/html" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
