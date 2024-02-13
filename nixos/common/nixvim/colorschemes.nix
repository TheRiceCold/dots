{
  # gruvbox.enable = true;
  catppuccin = {
    enable = true;
    background = {
      dark = "mocha";
    };
    flavour = "mocha"; # latte, mocha, frappe, macchiato
    dimInactive.enabled = true;
    integrations = {
      cmp = true;
      noice = true;
      gitsigns = true;
      treesitter = true;
      treesitter_context = true;
      telescope.enabled = true;
      mini.enabled = true;
      native_lsp = {
        enabled = true;
      };
    };
  };
}
