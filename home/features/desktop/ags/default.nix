{ inputs, pkgs, ... }:
# let
  # ags = pkgs.stdenv.mkDerivation {
  #   name = "ags";

  #   src = pkgs.fetchFromGitHub {
  #     owner = "kaizen-dw";
  #     repo = "ags-config";
  #     rev = "4bed24ac9d921b799ea5a7f48eb08fcdda3867eb";
  #     sha256 = "10wsdb2ikrwg7qrfgicp08rcwl2gzvx9jxvym1c0x13b8f24if9b";
  #   };

  #   installPhase = ''
  #     mkdir -p $out
  #     cp -R ./* $out/
  #   '';
  # };
# in 
{
  imports = [ inputs.ags.homeManagerModules.default ];

  home = {
    packages = with pkgs; [
      dart-sass
      libnotify
      playerctl
      brightnessctl
      (python311.withPackages (p: [ 
        p.requests
        p.python-pam 
      ]))
    ];

    # file.".config/ags".source = "${ags}";
  };

  programs.ags = {
    enable = true;
    # configDir = ./ags;
    extraPackages = with pkgs; [ 
      vte
      libgtop
      libsoup_3 
      webkitgtk_4_1
      gtksourceview
    ];
  };
}
