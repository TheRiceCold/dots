{ pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    vscodevim.vim

    bbenoist.nix # nix language
    arrterian.nix-env-selector # nix-shell suport 

    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons

    eamodio.gitlens
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
    formulahendry.auto-rename-tag
    streetsidesoftware.code-spell-checker
  ];
}
