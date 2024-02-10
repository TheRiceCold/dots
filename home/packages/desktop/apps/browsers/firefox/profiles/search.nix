{ pkgs, ... }:
let
  icons = {
    nix-packages = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
  };
in {
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
      icon = icons.nix-packages;
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
}
