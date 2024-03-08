/* kdl */ ''
  layout {
    default_tab_template {
      pane size=1 borderless=true {
        plugin location="file:~/.config/zellij/plugins/zjstatus.wasm" {
          format_left   "{mode} #[fg=#83ACEE,bold]{session}"
          format_center "{tabs}"
          format_right  "{command_git_branch} {datetime}"
          format_space  ""

          border_enabled  "false"
          border_char     "─"
          border_format   "#[fg=#6C7086]{char}"
          border_position "bottom"

          hide_frame_for_single_pane "true"

          mode_normal  "#[bg=blue] "
          mode_tmux    "#[bg=#ffc387] "

          tab_normal   "#[fg=#6C7086] {name} "
          tab_active   "#[fg=#C4CCE9,bold,italic] {name} "

          command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
          command_git_branch_format      "#[fg=#83ACEE] {stdout} "
          command_git_branch_interval    "10"
          command_git_branch_rendermode  "static"

          datetime          "#[fg=#83ACEE,bold] {format} "
          datetime_format   "%a %d, %I:%M"
          datetime_timezone "Asia/Manila"
        }
      }

      children
    }
  }
''
