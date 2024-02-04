let
  inherit (import ./mkBind.nix) window;

  arr = [1 2 3 4 5 6 7 8 9];
  b = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
  ws = b "SUPER" "workspace";
  mvtows =  b "SUPERSHIFT" "movetoworkspacesilent";
in {
  wayland.windowManager.hyprland.settings = {
    bind = with window; [
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

    ] ++ [
      # "SUPER, g, togglegroup"
      # "SUPER, s, togglespecialworkspace"
      "ALT, Tab, focuscurrentorlast"
      "SUPER, minus, splitratio,-0.25"
      "SUPERSHIFT, minus, splitratio,-0.3333333"

      "SUPER, equal, splitratio,0.25"
      "SUPERSHIFT, equal, splitratio,0.3333333"
    ] ++ (map (i: mvtows (toString i) (toString i)) arr) 
    ++ (map (i: ws (toString i) (toString i)) arr);
  };
}
