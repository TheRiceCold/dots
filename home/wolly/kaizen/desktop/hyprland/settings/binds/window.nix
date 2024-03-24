let
  inherit (import ./mkBind.nix) window;

  arr = [1 2 3 4 5]; # Number of workspaces
  bind = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
  workspace = bind "SUPER" "workspace";
  mvtows =  bind "SUPER_SHIFT" "movetoworkspacesilent";
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
      (maximized "SUPER, m")
      (fullscreen "SUPER, f")
      (fakefullscreen "SUPER_SHIFT, f")

      (center_layout "SUPER, c")
      (center_layout_up "CTRL, k")
      (center_layout_down "CTRL, j")

      # INFO: Focus' prefix is SUPER
      (focus "k" "u") 
      (focus "j" "d")
      (focus "l" "r")
      (focus "h" "l")

      # INFO: Swap's prefix is SUPER_SHIFT
      (swap "k" "u")
      (swap "j" "d")
      (swap "l" "r")
      (swap "h" "l")
    ] ++ (map (i: mvtows (toString i) (toString i)) arr)
    ++ (map (i: workspace (toString i) (toString i)) arr);

    binde = with window; [
      # INFO: Move prefix is SUPER_ALT
      (move "k" "0 -30")
      (move "j" "0 30")
      (move "l" "30 0")
      (move "h" "-30 0")

      # INFO: Resize prefix is SUPER_CTRL
      (resize "k" "0 -20")
      (resize "j" "0 20")
      (resize "l" "20 0")
      (resize "h" "-20 0")
    ];
  };

}
