{ pkgs, ... }:
{
  imports = [ ./helix ];

  home.packages = [
    pkgs.neovide
    # jetbrains-toolbox
    # jetbrains.goland
    # jetbrains.datagrip
    # jetbrains.phpstorm
    # jetbrains.webstorm
    # jetbrains.idea-ultimate
  ];
}
