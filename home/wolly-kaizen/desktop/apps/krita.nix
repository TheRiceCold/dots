{ pkgs, ... }:
{
  home.packages = [ pkgs.krita ];

  # Shortcut keys
  xdg.configFile."kritashortcutsrc".text = ''
    [Shortcuts]
    PanTool=H
    ZoomTool=Z
    KisToolPath=P
    SvgTextTool=T
    InteractionTool=V
    KisToolSelectOutline=L
    KisToolSelectContiguous=W
    KritaShape/KisToolRectangle=U
    KritaShape/KisToolSmartPatch=S
    KritaSelected/KisToolColorSampler=I

    deselect=Ctrl+D
    decrease_opacity=Shift+[
    increase_opacity=Shift+]

    convert-to-path=none
    show_color_history=none
    show_common_colors=none
    make_brush_color_lighter=none
    KritaTransform/KisToolMove=none
  '';
}
