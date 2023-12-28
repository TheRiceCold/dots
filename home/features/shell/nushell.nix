{ pkgs, ... }:
{
  home.packages = [ pkgs.nushell ];
  programs.nushell = {
    enable = true;
    environmentVariables = {
      PROMPT_INDICATOR_VI_INSERT = "\"  \"";
      PROMPT_INDICATOR_VI_NORMAL = "\"∙ \"";
      PROMPT_COMMAND = ''""'';
      PROMPT_COMMAND_RIGHT = ''""'';
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      SHELL = ''"${pkgs.nushell}/bin/nu"'';
      EDITOR = "lvim";
      VISUAL = "vscodium";
    };
    extraConfig = ''
      $env.config = {
        show_banner: false
        edit_mode: vi
        shell_integration: true

        hooks: {
          pre_prompt: [{ null }]
          pre_execution: [{ null }]
        }

        table: {
          mode: rounded # compact, thin, rounded
          index_mode: never # always, auto
        }

        cursor_shape: {
          vi_insert: line
          vi_normal: block
        }

        menus: [{
          name: completion_menu
          only_buffer_difference: false
          marker: "? "
          type: {
            layout: columnar # list, description
            columns: 4
            col_padding: 2
          }
          style: {
            text: magenta
            selected_text: blue_reverse
            description_text: yellow
          }
        }]
      }
    '';
  };
}
