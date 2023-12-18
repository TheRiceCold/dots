{ pkgs, inputs, ... }:
{
  home.packages = [ pkgs.firefox-wayland ];

  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
  };

  programs.firefox = {
    enable = true;
    # profiles.default = {
      # settings = { };
      # extensions = with inputs.firefox-addons; [
      #   vimium-ff
      #   addblocker-ultimate
      # ];
      # userChrome = ''
      #   
      # '';

      # userContent = ''

      # '';
    # };
  };
}
