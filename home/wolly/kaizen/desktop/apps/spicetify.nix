pkgs: spicetify-nix:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
  themes = pkgs.fetchgit {
    rev = "72488a0c245cde37a52dcf10da0a624eb279bb53";
    url = "https://github.com/spicetify/spicetify-themes";
    sha256 = "3DI0K+En3vIliIAUpa92orBs66z7XJJR+4WCcdPMaKo=";
  };
in {
  enable = true;
  theme = {
    src = themes;
    name = "Sleek";

    injectCss = true;
    replaceColors = true;
    sidebarConfig = true;
    overwriteAssets = true;
  };

  colorScheme = "cherry";
  enabledExtensions = with spicePkgs.extensions; [
    trashbin
    loopyLoop
    popupLyrics
    keyboardShortcut
    # Community Extensions
    adblock
    powerBar
  ];
}
