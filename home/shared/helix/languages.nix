{ pkgs, ... }:
let
  commonAutoPairs = {
    "(" = ")";
    "{" = "}";
    "[" = "]";
    "<" = ">";
    "'" = "'";
    "\"" = "\"";
  };
  commonRoots = [ "flake.lock" "package-lock.json" "yarn.lock" "pnpm-lock" "bun.lockb" ];
in {
  language = [
    {
      name = "astro";
      scope = "source.astro";
      file-types = ["astro"];
      auto-format = true;
      formatter = {
        command = "${pkgs.nodePackages.prettier}/bin/prettier";
        args = ["--parser" "astro"];
      };
      language-servers = [ "astro-lsp" "emmet-lsp" ];
      roots = commonRoots;
      auto-pairs = commonAutoPairs;
    }
    {
      name = "typscript";
      scope = "source.typescript";
      file-types = ["ts"];
      auto-format = true;
      roots = commonRoots;
      auto-pairs = commonAutoPairs;
    }
    {
      name = "javascript";
      scope = "source.javascript";
      file-types = ["js"];
      auto-format = true;
      roots = commonRoots;
      auto-pairs = commonAutoPairs;
    }
    {
      name = "nix";
      scope = "source.nix";
      file-types = ["nix"];
      roots = ["flake.lock"];
      formatter.command = "nixpkgs-fmt";
    }
  ];
  language-server = {
    astro-lsp = {
      command = "astro-ls";
      args = [ "--stdio" ];
      file-types = [ "astro" ];
    };
  };
}
