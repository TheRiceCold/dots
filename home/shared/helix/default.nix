{ inputs, pkgs, ... }:
{
  home.sessionVariables.COLORTERM = "truecolor";
  programs.helix = {
    enable = true;
    package = inputs.helix-kai.packages.${pkgs.system}.helix;
    extraPackages = import ./packages.nix pkgs;
    languages = import ./languages.nix pkgs;

    settings = {
      theme = "poimandres";
      keys = import ./keys.nix;
      editor = import ./editor.nix;
    };
  };
}
