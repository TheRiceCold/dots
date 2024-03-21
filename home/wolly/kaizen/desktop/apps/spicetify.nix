pkgs: spicetify-nix:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
  themes = pkgs.fetchFromGitHub {
    owner = "TheRiceCold";
    repo = "spicetify-themes";
    rev = "0764939d69bc5fda361ed846dd15b8a638060daa";
    hash = "sha256-WAycs47qKJeJkfclwV9IX7FwDGa9mYfvjlvVM/yPwu8=";
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
