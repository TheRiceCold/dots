{ inputs, pkgs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in {
  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
  };

  # programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles = import ./profiles { inherit pkgs addons; };
  };

  xdg.mimeApps.defaultApplications = {
    "text/xml" = [ "firefox.desktop" ];
    "text/html" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
