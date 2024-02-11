{
  cursorline = true;
  auto-format = true;
  color-modes = true;
  bufferline = "multiple";
  # bufferline = "always";
  true-color = true;
  soft-wrap.enable = true;
  cursor-shape = {
    insert = "bar";
    normal = "block";
    select = "underline";
  };
  indent-guides = {
    render = true;
    character = "┊";
    rainbow-option = "dim";
  };
  lsp = {
    display-messages = true;
    display-inlay-hints = true;
  };
  statusline = {
    mode.normal = "NORMAL";
    mode.insert = "INSERT";
    mode.select = "SELECT";

    left = [
      "mode"
      "spacer"
      "diagnostics"
      "version-control"
      "file-name"
      "read-only-indicator"
      "file-modification-indicator"
      "spinner"
    ];
    right = [
      "file-encoding"
      "file-type"
      "selections"
      "position"
    ];
  };
  whitespace = {
    render.tab = "all";
    characters = {
      nbsp = "⍽";
      tab = "→";
      newline = "⤶";
    };
  };
}
