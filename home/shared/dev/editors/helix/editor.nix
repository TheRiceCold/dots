{
  true-color = true;
  color-modes = true;
  popup-border = "all";
  bufferline = "always";
  line-number = "relative";
  lsp.display-messages = true;
  indent-guides.render = true;
  statusline = {
    left = ["mode"];
    center = ["file-name"];
    right = ["diagnostics" "spinner"];
    mode = {
      normal = "N";
      insert = "I";
      select = "S";
    };
  };
  cursor-shape = {
    insert = "bar";
    select = "underline";
  };
}
