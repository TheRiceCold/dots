pkgs: {
  nil = {
    command = "${pkgs.nil}/bin/nil";
    config.nil = {
      formatting.command = ["${pkgs.alejandra}/bin/alejandra" "-q"];
    };
  };
  emmet-ls = {
    command = "${pkgs.emmet-ls}/bin/emmet-ls";
    args = ["--stdio"];
  };
  eslint = {
    command = "vscode-eslint-language-server";
    args = ["--stdio"];
  };
  typescript-language-server = {
    command = "${pkgs.typescript-language-server}/bin/typescript-language-server";
    args = ["--stdio"];
  };
  astro-ls = {
    command = "${pkgs.astro-language-server}/bin/astro-ls";
    args = ["--stdio"];
  };
}
