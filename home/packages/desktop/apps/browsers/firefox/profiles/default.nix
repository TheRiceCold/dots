{ pkgs, ... }:
let
  addons = pkgs.nur.repos.rycee.firefox-addons;
  homepage = "https://kaizen-dw.github.io/startpage/";
in {
  default = {
    bookmarks = { };
    extensions = with addons; [
      vimium-c

      clearurls
      new-tab-override
      auto-tab-discard
      don-t-fuck-with-paste
      istilldontcareaboutcookies

      sponsorblock
      ublock-origin

      github-file-icons
    ];

    search = import ./search.nix { inherit pkgs; };

    settings = {
      "browser.startup.homepage" = homepage;
    };

    userChrome = '' '';
    userContent = '' '';
  };
}
