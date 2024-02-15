{ pkgs, ... }:
let
  icons = ../../icons.nix;
  build = owner: name: version: rev: hash: pkgs.vimUtils.buildVimPlugin {
    pname = name;
    inherit version;
    src = pkgs.fetchFromGitHub { owner = owner; repo = name; inherit rev hash; };
  };
in {
  imports = [
    (import ./navbuddy.nix { inherit build; })
  ];

  programs.nixvim = {
    extraPlugins = [
      (build "LudoPinelli" "comment-box.nvim" "2024-02-03"
        "06bb771690bc9df0763d14769b779062d8f12bc5"
        "sha256-fbuN2L8M6AZRvIiKy9ECLgf3Uya6g5znfDaCgVF3XKA=")

      (build "folke" "zen-mode.nvim" "2024-01-27"
        "78557d972b4bfbb7488e17b5703d25164ae64e6a"
        "sha256-G5/AskXEA0vl9GGUR8NG8PmL/HFcItZJWB+LyKd3R2k=")

      (build "altermo" "ultimate-autopair.nvim" "2024-02-07"
        "07c9da3e7722107163b68ecc5e0141fdd825449d"
        "sha256-TmmajuK1iOmRki4hLVFKK/w2Hf2aCh9GoOUxg5z+UZk=")
    ];

    extraConfigLua = ''
      require('ultimate-autopair').setup()
    '';
  };
}

