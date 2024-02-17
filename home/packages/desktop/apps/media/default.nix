{ inputs, pkgs, ... }:
let
  inherit (inputs) spicetify-nix;
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [ spicetify-nix.homeManagerModule ];

  programs.spicetify =
    let
      # use a different version of spicetify-themes than the one provided by
      # spicetify-nix
      themes = pkgs.fetchgit {
        url = "https://github.com/spicetify/spicetify-themes";
        rev = "72488a0c245cde37a52dcf10da0a624eb279bb53";
        sha256 = "3DI0K+En3vIliIAUpa92orBs66z7XJJR+4WCcdPMaKo=";
      };
    in
  {
    enable = true;
    theme = {
      name = "Dribbblish";
      src = themes;
      requiredExtensions = [
        # define extensions that will be installed with this theme
        {
          # extension is "${src}/Dribbblish/dribbblish.js"
          filename = "theme.js";
          src = "${themes}/Dribbblish";
        }
      ];
      appendName = true; # theme is located at "${src}/Dribbblish" not just "${src}"

      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
      sidebarConfig = true;
    };

    colorScheme = "catppuccin-mocha";
    # enabledExtensions = with spicePkgs.extensions; [ ];
  };
}
