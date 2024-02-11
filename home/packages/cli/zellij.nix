{
  programs.zellij.enable = true;

  # https://zellij.dev/documentation/keybindings-possible-actions
  xdg.configFile."zellij/config.kdl".text = ''
    theme "catppuccin-mocha"

    themes { }

    keybinds {
      normal {  }
      pane { }      
      locked { }
      tab { }
      resize {
        bind "Alt r" { SwitchToMode "Normal"; }
      }
      move { 
        bind "Alt m" { SwitchToMode "Normal"; }
      }

      shared_except "locked" {
        unbind "Ctrl h"
        bind "Ctrl n" { NewTab; } 

        bind "Alt 1" { GoToTab 1; }
        bind "Alt 2" { GoToTab 2; }
        bind "Alt 3" { GoToTab 3; }
        bind "Alt 4" { GoToTab 4; }
        bind "Alt 5" { GoToTab 5; }
        bind "Alt 6" { GoToTab 6; }
        bind "Alt 7" { GoToTab 7; }
        bind "Alt 8" { GoToTab 8; }
        bind "Alt 9" { GoToTab 9; }
      }

      shared_except "resize" "locked" {
        bind "Alt r" { SwitchToMode "Resize"; }
      }
      shared_except "move" "locked" {
        bind "Alt m" { SwitchToMode "Move"; }
      }
    }
  '';
}
