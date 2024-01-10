{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      # nixd.enable = true;
      clangd.enable = true;
      pyright.enable = true;
      rnix-lsp.enable = true;
      tsserver.enable = true;
      tailwindcss.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
    };
  };
}
