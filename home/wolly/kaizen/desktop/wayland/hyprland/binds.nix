{ pkgs, ... }:
let
  mkBind = import ../mkBind.nix;
  apps = import ../../apps/get-apps.nix pkgs;

  arr = [1 2 3 4 5]; # Number of workspaces
  bind = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
  workspace = bind "SUPER" "workspace";
  mvtows =  bind "SUPER_SHIFT" "movetoworkspacesilent";
in {
  wayland.windowManager.hyprland.settings = {
    bind = with apps; 
      with mkBind; 
      with media; 
      with window; 
      with widgets; [
      # Widgets prefix is SUPER
      (reset "r")
      (player "p")
      (ai-tools "a")
      (datemenu "d")
      (overview "Tab")
      (powermenu "F4")
      (launcher "Space")
      (shortcuts "Slash")
      (quicksettings "Period")
      "SUPER_SHIFT, l, exec, kaizen-lock"

      # Pypr Scatchpads Toggle's prefix is SUPER_CTRL
      (toggle "t" "term")
      (toggle "e" "explorer")
      (toggle "Escape" "system")

      (exec "Return" "[tile] ${term}") # prefix is SUPER

      # prefix is SUPER_CTRL
      (run "v" audio-control)
      (run "c" "${color-picker} -a")
      (run "b" "[workspace 2] ${browser} --browser-window")

      mute play prev next # media binds
      "SUPER_SHIFT, q, exit" # Exit Hyprland

      # Window
      (kill "SUPER, q")
      (float "SUPER, t")
      (pin "SUPER_SHIFT, p")
      (maximized "SUPER, m")
      (fullscreen "SUPER, f")
      (center_layout "SUPER, c")
      (center_layout_up "CTRL, k")
      (center_layout_down "CTRL, j")
      (fakefullscreen "SUPER_SHIFT, f")

      # prefix is SUPER
      (focus "k" "u") 
      (focus "j" "d")
      (focus "l" "r")
      (focus "h" "l")

      # prefix is SUPER_SHIFT
      (swap "k" "u")
      (swap "j" "d")
      (swap "l" "r")
      (swap "h" "l")
    ] ++ (map (i: mvtows (toString i) (toString i)) arr)
    ++ (map (i: workspace (toString i) (toString i)) arr);

    binde = with mkBind; with window; [
      (brightness.up-value "5")
      (brightness.down-value "5")

      (volume.up-value "5")
      (volume.down-value "5")

      # prefix is SUPER_ALT
      (move "k" "0 -30")
      (move "j" "0 30")
      (move "l" "30 0")
      (move "h" "-30 0")

      # prefix is SUPER_CTRL
      (resize "k" "0 -20")
      (resize "j" "0 20")
      (resize "l" "20 0")
      (resize "h" "-20 0")
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
