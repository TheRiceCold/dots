pkgs:
let
  addons = pkgs.nur.repos.rycee.firefox-addons;
  homepage = "https://kaizen-dw.github.io/startpage/";
in {
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

  settings = {
    "browser.startup.homepage" = homepage;
  };

  userChrome = '' '';
  userContent = '' '';

  search = {
    force = true;
    default = "Google";
    engines = {
      "Bing".metaData.hidden = true;
      "Google".metaData.alias = "@g";
      "Nix Packages" = {
        definedAliases = ["@np"];
        urls = [
          {
            template = "https://search.nixos.org/packages";
            params = [
              { name = "channel"; value = "unstable"; }
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }
        ];
      };

      "Youtube" = {
        definedAliases = ["@yt"];
        urls = [
          {
            template = "https://youtube.com/results";
            params = [ { name = "search_query"; value = "{searchTerms}"; } ];
          }
        ];
      };
    };
  };
}
