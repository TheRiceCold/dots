{ pkgs, addons, ... }:
let
  homepage = "https://github.com/kaizen-dw";
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
      browser.startup.homepage = homepage;
    };

    userChrome = '' '';
    userContent = '' '';
  };
}
