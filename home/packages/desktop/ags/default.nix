{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  home = {
    packages = with pkgs; [
      dart-sass
      libnotify
      python311Packages.python-pam
    ];
  };

  programs.ags = {
    enable = true;
    # configDir = ./ags;
    # extraPackages = with pkgs; [ ];
  };
}
