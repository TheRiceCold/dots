{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      pyright.enable = true;

      tsserver.enable = true;
      tailwindcss.enable = true;


      rust-analyzer.enable = true;
    };
  };
}
