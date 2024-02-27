{ pkgs, ... }:
let
  catppuccin = pkgs.stdenv.mkDerivation {
    name = "catppuccin-bat";

    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "bat";
      rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
      sha256 = "1g2r6j33f4zys853i1c5gnwcdbwb6xv5w6pazfdslxf69904lrg9";
    };

    installPhase = ''
      mkdir -p $out
      cp *.tmTheme $out/
    '';
  };
in {
  home.file.".config/bat/themes".source = "${catppuccin}";

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Catppuccin-mocha";
    };
  };
}
