{ pkgs, ... }: {
  home.packages = [ pkgs.hyprshade ];

  xdg.configFile = {
    "hypr/hyprshade.toml".text = /* toml */ ''
      [[shades]]
      name = "vibrance"
      default = true  # shader to use during times when there is no other shader scheduled

      [[shades]]
      name = "blue-light-filter"
      # start_time = 19:00:00
      # end_time = 06:00:00   # optional if you have more than one shade with start_time

      [[shades]]
      name = "invert-colors"

      [[shades]]
      name = "grayscale"
    '';

    # CUSTOM SHADERS

    "hypr/shaders/invert-colors.glsl".text = /* glsl */ ''
      precision highp float;
      varying vec2 v_texcoord;
      uniform sampler2D tex;

      void main() {
        vec4 pixColor = texture2D(tex, v_texcoord);
        gl_FragColor = vec4(1.0 - pixColor.r, 1.0 - pixColor.g, 1.0 - pixColor.b, pixColor.a);
      }
    '';

    "hypr/shaders/grayscale.glsl".text = /* glsl */ ''
      precision mediump float;
      varying vec2 v_texcoord;
      uniform sampler2D tex;

      void main() {
        vec4 pixColor = texture2D(tex, v_texcoord);

        gl_FragColor = vec4(
          pixColor[0] * 0.299 + pixColor[1] * 0.587 + pixColor[2] * 0.114,
          pixColor[0] * 0.299 + pixColor[1] * 0.587 + pixColor[2] * 0.114,
          pixColor[0] * 0.299 + pixColor[1] * 0.587 + pixColor[2] * 0.114,
          pixColor[3]
        );
      }
    '';
  };
}
