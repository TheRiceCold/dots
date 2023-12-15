{ pkgs, ... }:
{
  home.sessionVariables.COLORTERM = "truecolor";
  home.packages = [ pkgs.helix ];
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        cursorline = true;
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline = {
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
      };
    };
  };
}
