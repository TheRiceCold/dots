{ inputs, pkgs, ... }:
{
  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
  };

  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.default = {
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
          "Google".metaData.alias = "@g";
        };
      };

      settings = { 
        "browser.startup.homepage" = "https://github.com/kaizen-dw";
      };

      # userChrome = ''
      #   
      # '';

      # userContent = ''

      # '';
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/xml" = [ "firefox.desktop" ];
    "text/html" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
