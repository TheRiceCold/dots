{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      indent = true;
      nixGrammars = true;
      ensureInstalled = [
        "bash"
        "c"
        "cmake"
        "cpp"
        "css"
        "dart"
        "dockerfile"
        "git_config"
        "gitcommit"
        "gitignore"
        "html"
        "ini"
        "javascript"
        "jsdoc"
        "json"
        "json5"
        "jsonc"
        "jsonnet"
        "llvm"
        "make"
        "markdown"
        "markdown_inline"
        "meson"
        "ninja"
        "nix"
        "org"
        "python"
        "regex"
        "rust"
        "scss"
        "sql"
        "toml"
        "typescript"
        "yaml"
      ];
    };

    treesitter-context.enable = true;
  };
}
