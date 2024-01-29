{ pkgs, addons, ... }:
let
  homepage = "https://kaizen-dw.github.io/firefox-startpage/";
in {
  default = {
    bookmarks = { };
    extensions = with addons; [
      vimium-c
      clearurls
      # sidebery
      # browserpass
      sponsorblock
      ublock-origin
      auto-tab-discard
    ];

    search = import ./search.nix { inherit pkgs; };

    settings = { 
      "browser.startup.homepage" = homepage;
    };

    userChrome = '' '';
    userContent = '' '';
  };
}
