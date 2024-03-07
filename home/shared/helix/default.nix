{ inputs, pkgs, ... }:
{
  home.sessionVariables.COLORTERM = "truecolor";
  programs.helix = {
    enable = true;
    package = inputs.helix-kai.packages.${pkgs.system}.helix;
    extraPackages = import ./packages.nix pkgs;
    languages = import ./languages.nix pkgs;

    settings = {
      theme = "catppuccin_mocha";
      keys = import ./keys.nix;
      editor = import ./editor.nix;
    };
  };
}
