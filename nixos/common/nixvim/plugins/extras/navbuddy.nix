{ build, ... }:
{
  programs.nixvim = {
    plugins.navic.enable = true;
    extraPlugins = [
      (build "MunifTanjim" "nui.nvim" "2024-02-15"
        "af7dfee12fbf51d12cfc6ee386fa54f7a5a573c8"
        "sha256-T3JMnZ5xMv1R6VWvbufrgWsNdGgVKCVTk895Gq5VgcU=")

      (build "SmiteshP" "nvim-navbuddy" "2023-09-14"
        "f137a3466a6cd1965cdcc5398daff54e66eebbe5"
        "sha256-zy1Tq8M5UITNAwtAlFYaUFlHnIZ5LWD9ZLaZcy7ulQ8=")
    ];

    extraConfigLua = ''
      local navbuddy = require('nvim-navbuddy')

      navbuddy.setup {
        lsp = {
          auto_attach = true, -- If set to true, you don't need to manually use attach function
          preference = nil,   -- list of lsp server names in order of preference
        },
      }
    '';
  };
}
