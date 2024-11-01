{ pkgs, ... }: let
  bundle = builtins.fetchGit {
    url = "https://github.com/jdugan6240/kak-bundle";
    rev = "f0ddd5a2e355d5f07421616881f372fc22a7d5b0";
  };
in {
  xdg.configFile = {
    # October 19, 2024
    "kak/colors/cyberdream.kak".source = ./colors/cyberdream.kak;
  };

  programs.kakoune = {
    enable = true;
    config = {
      tabStop = 2;
      indentWidth = 2;
      colorScheme = "cyberdream";
      keyMappings = import ./keymaps.nix;
    };
    extraConfig = ''
      source "${bundle}/rc/kak-bundle.kak"
      bundle-noload kak-bundle https://codeberg.org/jdugan6240/kak-bundle

      bundle kak-lsp "https://github.com/kak-lsp/kak-lsp" %{
        set-option global lsp_auto_highlight_references true
        set-option global lsp_hover_max_lines 1000
        set-option global lsp_hover_anchor true
        set-option global lsp_snippet_support false # This just causes chaos right now

        hook global KakEnd .* lsp-exit

        map global normal <c-h> ":lsp-hover<ret>"
        map global normal <c-a-h> ":lsp-hover-buffer<ret>"
        map global normal <c-a> ":lsp-code-actions<ret>"
        map global normal <c-r> ":lsp-rename-prompt<ret>"
        map global normal <c-e> ":lsp-diagnostics<ret>"

        map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
        map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
        map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
        map global object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
        map global object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
        map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
        map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

        map global goto m "<esc><c-s>:lsp-implementation<ret>" -docstring "implementations"

        map global user l ":enter-user-mode lsp<ret>" -docstring "lsp..."
        map global lsp m ":lsp-show-message-request-next<ret>"

        lsp-inlay-diagnostics-enable global
        lsp-auto-signature-help-enable

        # Custom status line
        declare-option -hidden str lsp_modeline_progress ""
        define-command -hidden -params 6 -override lsp-handle-progress %{
          set-option global lsp_modeline_progress %sh{
            if ! "$6"; then
              echo "$2\$\{5:+" ($5%)"}\$\{4:+": $4"}"
            fi
          }
        }
      }
      bundle-install-hook kak-lsp %{ cargo install --locked --force --path . }

      bundle kak-rainbower "https://github.com/crizan/kak-rainbower" %{
        set-option global rainbow_mode 0
        set-option global rainbow_check_templates Y

        hook global WinCreate .* %{
          rainbow-enable-window
        }
      }

      # General
      add-highlighter global/ number-lines -relative -separator " "
      add-highlighter global/ show-whitespaces -indent │ -tab " " -tabpad " " -spc " " -lf " " -nbsp " "
    '';
  };
}
