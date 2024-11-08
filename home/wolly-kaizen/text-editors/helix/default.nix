{ pkgs, ... }: {
  home.packages = with pkgs; [
    marksman
    prettierd
    vscode-langservers-extracted
  ];

  programs.helix = {
    enable = true;
    themes = import ./themes.nix;
    languages = {
      languages = import ./lang.nix pkgs;
      language-server = import ./servers.nix pkgs;
    };

    settings = {
      theme = "cyberdream";
      editor = import ./editor.nix;
      keys = import ./keys.nix pkgs;
    };
  };
}
