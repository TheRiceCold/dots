{ inputs, pkgs, ... }:
{
  default = {
    bookmarks = { };
    search.default = "Google";
    extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
      vimium-c
      clearurls
      browserpass
      ublock-origin
      auto-tab-discard
    ];

    search = {
      force = true;
      engines = {
        "Bing".metaData.hidden = true;
        "Google".metaData.alias = "@g";

        "Nix Packages" = {
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
          icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };

        "Youtube" = {
          urls = [
            {
              template = "https://youtube.com/results";
              params = [
                { name = "search_query"; value = "{searchTerms}"; }
              ];
            }
          ];
          definedAliases = ["@yt"];
        };
      };
    };

    settings = { 
      browser = {
        startup.homepage = "https://github.com/kaizen-dw";
        newtabpage.pinned = [
          { title = "Facebook"; url = "https://facebook.com"; } 
        ];
      }; 
    };

    # userChrome = ''
    #   
    # '';

    # userContent = ''

    # '';
  };
}
