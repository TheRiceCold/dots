{ pkgs, ... }:
let
  bind = key: action: ''<bind gaction="win.tool-switch('${action}')" keys="${key}" /> '';
in
{
  home.packages = [ pkgs.inkscape ];

  xdg.configFile."inkscape/keys/default.xml".text = # xml
    ''
      <?xml version="1.0" encoding="UTF-8" standalone="no"?>
      <keys name="User Shortcuts">
        ${bind "p" "Pen"}
        ${bind "a" "Node"}
        ${bind "i" "Dropper"}
      </keys>
    '';
}
