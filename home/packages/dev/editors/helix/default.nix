{ inputs, pkgs, ... }:
{
  home.sessionVariables.COLORTERM = "truecolor";
  programs.helix = {
    enable = true;
    # package = inputs.helix-ext.packages.${pkgs.system}.helix;
    extraPackages = import ./packages.nix { inherit pkgs; };
    languages = import ./languages.nix { inherit pkgs; };

    settings = {
      theme = "catppuccin_mocha";
      keys = import ./keys.nix;
      editor = import ./editor.nix;
    };
  };
}
