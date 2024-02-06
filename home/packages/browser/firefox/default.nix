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
}
