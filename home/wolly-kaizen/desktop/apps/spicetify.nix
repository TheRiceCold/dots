{ inputs, pkgs, ... }:
let
  inherit (inputs) spicetify-nix;
in {
  imports = [ spicetify-nix.homeManagerModules.default ];
  programs.spicetify = let
   spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    theme = spicePkgs.themes.starryNight;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      powerBar
      trashbin
      loopyLoop
      popupLyrics
      playlistIcons
      keyboardShortcut
    ];
  };
}
