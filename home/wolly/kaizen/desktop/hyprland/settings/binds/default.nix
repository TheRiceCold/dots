{ pkgs, ... }:
let
  mkBind = import ./mkBind.nix;
  apps = import ../../apps.nix pkgs;

  arr = [1 2 3 4 5]; # Number of workspaces
  bind = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
  workspace = bind "SUPER" "workspace";
  mvtows =  bind "SUPER_SHIFT" "movetoworkspacesilent";
in {
  wayland.windowManager.hyprland.settings = {
    bind = with apps; with mkBind; with media; with window; [
      "SUPER_SHIFT, q, exit"

      # prefix is SUPER
      (exec "Equal" "pypr zoom")
      (exec "Return" "[tile] ${term}")

      # media binds
      mute play prev next

      # prefix is SUPER
      "SUPER, r, exec, pkill ags; ags" # Reset Ags
      (ags.media "p")
      # (ags.overview "Tab")
      (ags.powermenu "F4")
      (ags.launcher "Space")
      (ags.shortcuts "Slash")

      (ags.apis "Comma")
      (ags.datemenu "d")
      (ags.quicksettings "Period")

      # prefix is SUPER_CTRL
      (run-app "v" audio-control)
      (run-app "c" "${color-picker} -a")
      (run-app "b" "[workspace 2] ${browser} --browser-window")

      # Pypr Scatchpads Toggle's prefix is SUPER_CTRL
      (toggle "t" "term")
      (toggle "e" "explorer")
      (toggle "Escape" "system")

      # Windows
      (pin "SUPER, p")
      (kill "SUPER, q")
      (float "SUPER, t")
      (maximized "SUPER, m")
      (fullscreen "SUPER, f")
      (fakefullscreen "SUPER_SHIFT, f")
      (center_layout "SUPER, c")
      (center_layout_up "CTRL, k")
      (center_layout_down "CTRL, j")

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
