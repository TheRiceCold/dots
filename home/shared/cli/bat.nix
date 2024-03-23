{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      # theme = "Catppuccin-mocha";
    };
  };

  # xdg.configFile."bat/themes".source = "${catppuccin}";
}
