{ pkgs, ... }:
{
  home.packages = with pkgs; [
    krita
    libresprite         # Pixel Art
    blender             # 3d Graphics
    inkscape            # Vector Graphics
    gimp                # Image Maniputation
  ];

  # Config Files
  xdg.configFile."kritashortcutsrc".text = ''
    [Shortcuts]
    InteractionTool=V
    KisToolPath=P
    KisToolSelectContiguous=W
    KisToolSelectOutline=L
    KisToolSelectRectangular=M
    KritaSelected/KisToolColorSampler=I
    KritaShape/KisToolRectangle=U
    KritaShape/KisToolSmartPatch=S
    KritaTransform/KisToolMove=none
    PanTool=H
    SvgTextTool=T
    ZoomTool=Z
    convert-to-path=none
    decrease_opacity=none
    make_brush_color_lighter=none
    mirror_canvas=none
    show_color_history=none
    show_common_colors=none
  '';
}
