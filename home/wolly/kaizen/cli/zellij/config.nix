/* kdl */ ''
  ${import ./themes.nix}

  keybinds clear-defaults=true {
    normal { }
    pane {
      bind "Ctrl p" { SwitchToMode "normal"; }
      bind "h" "Left" { MoveFocus "left"; }
      bind "j" "Down" { MoveFocus "down"; }
      bind "k" "Up" { MoveFocus "up"; }
      bind "l" "Right" { MoveFocus "right"; }
      bind "n" { NewPane; SwitchToMode "normal"; }
      bind "x" { CloseFocus; SwitchToMode "normal"; }
      bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0; }
    }
    locked {
      bind "Ctrl g" { SwitchToMode "normal"; }
    }
    tab {
      bind "Ctrl t" { SwitchToMode "normal"; }
      bind "x" { CloseTab; SwitchToMode "normal"; }
      bind "c" { SwitchToMode "RenameTab"; TabNameInput 0; }
      bind "h" "Left" "Up" "k" { GoToPreviousTab; }
      bind "l" "Right" "Down" "j" { GoToNextTab; }
    }
    resize {
      bind "Ctrl R" { SwitchToMode "normal"; }
    }
    move {
      bind "Ctrl m" { SwitchToMode "normal"; }
    }
    scroll {
      bind "Ctrl s" { SwitchToMode "normal"; }
      bind "k" "Up" { ScrollUp; }
      bind "j" "Down" { ScrollDown; }
    }
    search {
      bind "Ctrl s" { SwitchToMode "normal"; }
      bind "k" "Up" { ScrollUp; }
      bind "j" "Down" { ScrollDown; }
    }
    session {
      bind "Ctrl o" { SwitchToMode "normal"; }
      bind "d" { Detach; }
      bind "w" {
        LaunchOrFocusPlugin "zellij:session-manager" {
          floating true
          move_to_focused_tab true
        };
        SwitchToMode "Normal"
      }
    }

    RenameTab {
      bind "Enter" "Ctrl c" "Esc" { SwitchToMode "normal"; }
    }

    RenamePane {
      bind "Enter" "Ctrl c" "Esc" { SwitchToMode "normal"; }
    }

    tmux {
      bind "Ctrl b" { SwitchToMode "normal"; }
      bind "c" { NewTab; SwitchToMode "normal"; }
      bind "," { SwitchToMode "RenameTab"; TabNameInput 0; }
      bind "h" "Left" { MoveFocus "Left"; SwitchToMode "normal"; }
      bind "l" "Right" { MoveFocus "Right"; SwitchToMode "normal"; }
      bind "j" "Down" { MoveFocus "Down"; SwitchToMode "normal"; }
      bind "k" "Up" { MoveFocus "Up"; SwitchToMode "normal"; }
    }

    shared {
      bind "Ctrl s" { SwitchToMode "search"; }
      bind "Ctrl g" { SwitchToMode "locked"; }
    }

    shared_except "locked" {
      bind "Alt 1" { GoToTab 1; }
      bind "Alt 2" { GoToTab 2; }
      bind "Alt 3" { GoToTab 3; }
      bind "Alt 4" { GoToTab 4; }
      bind "Alt 5" { GoToTab 5; }
      bind "Alt 6" { GoToTab 6; }
      bind "Alt 7" { GoToTab 7; }
      bind "Alt 8" { GoToTab 8; }
      bind "Alt 9" { GoToTab 9; }

      bind "Ctrl q" { Quit; }
      bind "Ctrl d" { Detach; }
      bind "Ctrl n" { NewTab; }
      bind "Alt n" { NewPane; }

      bind "Alt Left" { MoveFocusOrTab "Left"; }
      bind "Alt Right" { MoveFocusOrTab "Right"; }

      bind "Ctrl y" {
        LaunchOrFocusPlugin "file:~/.config/zellij/plugins/zellij_forgot.wasm" {
          "toggle lock mode"        "crtl + g"
          "toggle tab mode"         "ctrl + t"
          "toggle pane mode"        "ctrl + p"
          "toggle move mode"        "ctrl + m"
          "toggle resize mode"      "ctrl + R"
          "toggle tmux mode"        "ctrl + b"
          "session manager"         "crtl + o + w"

          "new pane"                "alt + n"
          "new tab"                 "ctrl + n"
          "go to tab index"         "alt + <index>"
          "rename tab"              "ctrl + t + c"
          "toggle fullscreen"       "ctrl + p + f"
          "toggle floating pane"    "ctrl + p + w"
          "detach session"          "crtl + d"
          "quit zellij"             "crtl + q"

          floating true
        }
      }
    }

    shared_except "normal" "locked" {
      bind "Esc" { SwitchToMode "normal"; }
    }
    shared_except "pane" "locked" {
      bind "Ctrl p" { SwitchToMode "pane"; }
    }
    shared_except "session" "locked" {
      bind "Ctrl o" { SwitchToMode "session"; }
    }
    shared_except "scroll" "locked" {
      bind "Ctrl s" { SwitchToMode "scroll"; }
    }
    shared_except "resize" "locked" {
      bind "Ctrl R" { SwitchToMode "resize"; }
    }
    shared_except "tab" "locked" {
      bind "Ctrl t" { SwitchToMode "tab"; }
    }
    shared_except "move" "locked" {
      bind "Ctrl m" { SwitchToMode "move"; }
    }
    shared_except "tmux" "locked" {
      bind "Ctrl b" { SwitchToMode "tmux"; }
    }
  }

  plugins { }
''
