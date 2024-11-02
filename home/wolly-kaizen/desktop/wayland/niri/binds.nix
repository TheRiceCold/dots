actions: with actions; {
  "Mod+Shift+Slash".action = show-hotkey-overlay;

  "Mod+Shift+Q".action = quit;
  "Mod+Q".action = close-window;

  # Spawn Apps
  "Mod+Return".action = spawn "foot";
  "Mod+B".action = spawn "qutebrowser";
  "Mod+Shift+B".action = spawn ["qutebrowser" "--target" "private-window"];

  "Mod+Tab".action = focus-window-down-or-column-right;
  "Mod+Shift+Tab".action = focus-window-up-or-column-left;
  "Mod+M".action = maximize-column;
  "Mod+F".action = fullscreen-window;
  "Mod+C".action = center-column;

  "Mod+H".action = focus-column-left;
  "Mod+L".action = focus-column-right;
  "Mod+K".action = focus-window-up;
  "Mod+J".action = focus-window-down;

  "Mod+Shift+H".action = move-column-left;
  "Mod+Shift+J".action = move-window-down;
  "Mod+Shift+K".action = move-window-up;
  "Mod+Shift+L".action = move-column-right;

  "Mod+1".action = focus-workspace 1;
  "Mod+2".action = focus-workspace 2;
  "Mod+3".action = focus-workspace 3;
  "Mod+4".action = focus-workspace 4;
  "Mod+5".action = focus-workspace 5;
  "Mod+6".action = focus-workspace 6;
  "Mod+7".action = focus-workspace 7;
  "Mod+8".action = focus-workspace 8;
  "Mod+9".action = focus-workspace 9;

  "Mod+Shift+1".action = move-column-to-workspace 1;
  "Mod+Shift+2".action = move-column-to-workspace 2;
  "Mod+Shift+3".action = move-column-to-workspace 3;
  "Mod+Shift+4".action = move-column-to-workspace 4;
  "Mod+Shift+5".action = move-column-to-workspace 5;
  "Mod+Shift+6".action = move-column-to-workspace 6;
  "Mod+Shift+7".action = move-column-to-workspace 7;
  "Mod+Shift+8".action = move-column-to-workspace 8;
  "Mod+Shift+9".action = move-column-to-workspace 9;

  "Mod+Minus".action = set-column-width "-10%";
  "Mod+Equal".action = set-column-width "+10%";

  "Mod+Shift+Minus".action = set-window-height "-10%";
  "Mod+Shift+Equal".action = set-window-height "+10%";
}
