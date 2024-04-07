{ pkgs, ... }: {
  home.packages = [ pkgs.gromit-mpx ];
  xdg.configFile."gromit-mpx.cfg".text = /* cfg */ ''
    # NOTE: config fails to parse when SMOOTH or ORTHOGONAL is added
    # Button2 = middle click
    # Button3 = right click

    "eraser" = ERASER (size = 75);
    
    "pen blue" = PEN (size=4 color="#89ddff");
    "pen green" = PEN (size=4 color="#5de4c7");

    "line blue" = LINE (size=4 color="#89ddff");
    "line green" = LINE (size=4 color="#5de4c7");

    "rect blue" = RECT (size=4 color="#89ddff");
    "rect green" = RECT (size=4 color="#5de4c7");

    "arrow blue" = PEN (size=4 color="#89ddff" arrowsize=2);
    "arrow green" = PEN (size=4 color="#5de4c7" arrowsize=2);

    "line arrow blue" = LINE (size=4 color="#89ddff" arrowsize=2);
    "line arrow green" = LINE (size=4 color="#5de4c7" arrowsize=2);

    # bind keys
    "default" = "pen green";
    "default"[SHIFT] = "line green";
    "default"[CONTROL] = "arrow green";
    "default"[SHIFT, CONTROL] = "line arrow green";

    "default"[ALT] = "pen blue";
    "default"[SHIFT, ALT] = "line blue";
    "default"[CONTROL, ALT] = "arrow blue";
    "default"[SHIFT, CONTROL, ALT] = "line arrow blue";

    "default"[Button3] = "eraser";
    "default"[Button2] = "rect green";
    "default"[Button2, ALT] = "rect blue";
  '';
}
