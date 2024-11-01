# documentation: https://zellij.dev/documentation
{ pkgs, ... }: {
  programs.zellij.enable = true;
  xdg.configFile = {
    # see at https://github.com/dj95/zjstatus
    "zellij/plugins/zjstatus.wasm".source = pkgs.fetchurl {
      url = "https://github.com/dj95/zjstatus/releases/download/v0.18.0-rc1/zjstatus.wasm";
      sha256 = "0vpfa4j9sdb7lyzdgfkxw8fypwakymd20cdjm7bjfcg2g7icd6pv";
    };

    # see at https://github.com/karimould/zellij-forgot
    "zellij/plugins/zellij_forgot.wasm".source = pkgs.fetchurl {
      url = "https://github.com/karimould/zellij-forgot/releases/download/0.4.0/zellij_forgot.wasm";
      sha256 = "1hzdvyswi6gh4ngxnplay69w1n8wlk17yflfpwfhv6mdn0gcmlsr";
    };

    "zellij/config.kdl".text = import ./config.nix;
    "zellij/layouts/default.kdl".text = import ./layout.nix;
  };
}
