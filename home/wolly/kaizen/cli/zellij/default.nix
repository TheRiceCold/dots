# DOCS: https://zellij.dev/documentation
{ pkgs, ... }: {
  programs.zellij.enable = true;
  xdg.configFile = {
    "zellij/plugins/zjstatus.wasm".source = pkgs.fetchurl {
      url = "https://github.com/dj95/zjstatus/releases/download/v0.13.1/zjstatus.wasm";
      sha256 = "1a42nx5ayvjkbfz4rkq5bc5nn8jhr10y2hcvh4zw749prl3xdxzb";
    };
    "zellij/plugins/zellij_forgot.wasm".source = pkgs.fetchurl {
      url = "https://github.com/karimould/zellij-forgot/releases/download/0.3.0/zellij_forgot.wasm";
      sha256 = "0p34whfp3bcqyldv8sa1h18mfwdbxz22gf232z93hmzsfqlkim14";
    };

    "zellij/config.kdl".text = import ./config.nix;
    "zellij/layouts/default.kdl".text = import ./layout.nix;
  };
}
