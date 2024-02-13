{
  enable = true;
  servers = {
    clangd.enable = true;
    rnix-lsp.enable = true;
    tsserver.enable = true;
    tailwindcss.enable = true;
    rust-analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
  };
}
