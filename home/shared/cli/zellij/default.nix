# DOCS: https://zellij.dev/documentation
{ pkgs, ... }: {
  programs.zellij.enable = true;
  xdg.configFile = {
    "zellij/plugins/zjstatus.wasm".source = pkgs.fetchurl {
      url = "https://github.com/dj95/zjstatus/releases/download/v0.14.1/zjstatus.wasm";
      sha256 = "036hspx7y6vkm7hqc1307d288fd4209m1l0s3pxpzv4jzb09s98z";
    };
    "zellij/plugins/zellij_forgot.wasm".source = pkgs.fetchurl {
      url = "https://github.com/karimould/zellij-forgot/releases/download/0.4.0/zellij_forgot.wasm";
      sha256 = "1hzdvyswi6gh4ngxnplay69w1n8wlk17yflfpwfhv6mdn0gcmlsr";
    };

    "zellij/config.kdl".text = import ./config.nix;
    "zellij/layouts/default.kdl".text = import ./layout.nix;
  };
}
