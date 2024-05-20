pkgs: spicetify-nix:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
  themes = pkgs.fetchFromGitHub {
    owner = "TheRiceCold";
    repo = "spicetify-themes";
    rev = "b4df0127d3be72634666824fa682feb49e2721e2";
    hash = "sha256-ECN81f5kl/gXcyiL55Sqi5aAUaEPRHYlEIRUIA5u5/k=";
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
  colorScheme = "poimandres";

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
