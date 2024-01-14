{ pkgs, ... }:
{
  home.packages = [ pkgs.joshuto ];
  programs.joshuto.enable = true;

  xdg.configFile."joshuto/joshuto.toml".text = import ./joshuto.nix;
  xdg.configFile."joshuto/theme.toml".text = import ./theme.nix;
  xdg.configFile."joshuto/keymap.toml".text = import ./keymap.nix;
  xdg.configFile."joshuto/mimetype.toml".text = import ./mimetype.nix;
}
