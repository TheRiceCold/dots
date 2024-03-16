let
  inherit (import ./mkBind.nix) window;

  arr = [1 2 3 4 5]; # Number of workspaces
  bind = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
  workspace = bind "SUPER" "workspace";
  mvtows =  bind "SUPERSHIFT" "movetoworkspacesilent";
in {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bind = with window; [
      "ALT, Tab, focuscurrentorlast"

      (pin "SUPER, p")
      (kill "SUPER, q")
      (float "SUPER, t")
      (maximized "SUPER, f")
      (fullscreen "SUPERSHIFT, f")
      (fakefullscreen "SUPERALT, f")

      (focus "k" "u")
      (focus "j" "d")
      (focus "l" "r")
      (focus "h" "l")

      (move "k" "0 -30")
      (move "j" "0 30")
      (move "l" "30 0")
      (move "h" "-30 0")

      (swap "k" "u")
      (swap "j" "d")
      (swap "l" "r")
      (swap "h" "l")

      (resize "k" "0 -20")
      (resize "j" "0 20")
      (resize "l" "20 0")
      (resize "h" "-20 0")
    ] ++ (map (i: mvtows (toString i) (toString i)) arr)
    ++ (map (i: workspace (toString i) (toString i)) arr);
  };
}
