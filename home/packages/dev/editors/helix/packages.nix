{ pkgs, ... }:
with pkgs; [
  emmet-ls
  marksman
  nodePackages.vscode-css-languageserver-bin
  nodePackages.vscode-langservers-extracted
  nodePackages.typescript-language-server
  typescript 
  nodePackages.volar
  nodePackages."@astrojs/language-server"
  nixpkgs-fmt
  clang-tools
  lua-language-server
  rust-analyzer
]
