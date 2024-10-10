pkgs: let
  prettier = parser: {
    command = "prettierd";
    args = ["--parser" parser];
  };
  ts = name: {
    inherit name;
    language-servers = ["typescript-language-server" "eslint"];
    formatter = {
      command = "prettierd";
      formatter = prettier "typescript";
    };
  };
in [
  {
    name = "bash";
    file-types = ["sh" "bash"];
    formatter = {
      command = "${pkgs.shfmt}/bin/shfmt";
      args = ["-i" "4" "s" "-ci" "-sr"];
    };
  }
  {
    name = "nix";
    language-servers = ["nil"];
  }
  {
    name = "javascript";
    language-servers = ["eslint"];
    formatter = {
      command = "prettierd";
      formatter = prettier "typescript";
    };
  }
  {
    name = "jsx";
    language-servers = ["eslint"];
  }
  (ts "typescript")
  (ts "tsx")
  {
    name = "html";
    auto-format = true;
    language-servers = ["vscode-html-language-server" "emmet-ls"];
    formatter = {
      command = "prettierd";
      formatter = prettier "html";
    };
  }
  {
    name = "css";
    auto-format = true;
    formatter = prettier "css";
    language-servers = ["vscode-css-language-server" "emmet-ls"];
  }
]
