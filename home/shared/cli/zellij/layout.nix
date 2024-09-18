let
  fg = "#5ef1ff"; #5ea1ff
  active = "#ffffff";
  tmux = "#ffbd5e";
in /* kdl */ ''
  layout {
    default_tab_template {
      pane size=1 borderless=true {
        plugin location="file:~/.config/zellij/plugins/zjstatus.wasm" {
          format_left   "{mode} #[fg=${fg},bold]{session}"
          format_center "{tabs}"
          format_right  "{command_git_branch} {datetime}"
          format_space  ""

          border_enabled  "false"
          border_char     "─"
          border_format   "#[fg=#7b8496]{char}"
          border_position "bottom"

          hide_frame_for_single_pane "true"

          mode_normal  "#[bg=${fg}] "
          mode_tmux    "#[bg=${tmux}] "

          tab_normal   "#[fg=#7b8496] {name} "
          tab_active   "#[fg=${active},bold,italic] {name} "

          command_git_branch_command    "git rev-parse --abbrev-ref HEAD"
          command_git_branch_format     "#[fg=${fg}] {stdout} "
          command_git_branch_interval   "10"
          command_git_branch_rendermode "static"

          datetime          "#[fg=${fg},bold] {format} █"
          datetime_format   "%a %d, %I:%M"
          datetime_timezone "Asia/Manila"
        }
      }

      children
    }
  }
''
