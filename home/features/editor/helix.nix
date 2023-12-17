{ pkgs, ... }:
{
  home.sessionVariables.COLORTERM = "truecolor";
  home.packages = [ pkgs.helix ];
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        shell = [ "bash" ];
        cursorline = true;
        auto-format = true;
        bufferline = "multiple";
        # bufferline = "always";
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
        lsp.display-messages = true;
        whitespace.characters = {
          nbsp = "⍽";
          tab = "→";
          newline = "⤶";
        };
        rainbow-brackets = true;
      };
      keys = {  };
    };

    # languages = with pkgs; {
    #   language-server = { };
    # };
  };
}
