# INFO: I like vscodium but I still don't see myself using it.
{ pkgs, ... }: {

  imports = [ ./user-settings.nix ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
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

    keybindings = [
      {
        key = "ctrl+q";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
    ];
  };
}
