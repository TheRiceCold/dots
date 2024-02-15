{
  enable = true;
  servers = {
    nixd.enable = true;
    cssls.enable = true;
    bashls.enable = true;
    clangd.enable = true;
    jsonls.enable = true;
    yamlls.enable = true;
    tsserver.enable = true;
    tailwindcss.enable = true;
    rust-analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
  };
  keymaps = {
    lspBuf = {
      K = "hover";
      gd = "definition";
      gD = "references";
      gi = "implementation";
    };
  };
}
