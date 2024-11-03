{ inputs, pkgs, ... }: {
  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.default = import ./profiles pkgs;
  };

  nixpkgs.overlays = [inputs.nur.overlay];
}
