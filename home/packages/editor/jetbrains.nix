{ pkgs, ... }: 
{
  home.packages = with pkgs; [
    jetbrains-toolbox

    # jetbrains.goland
    # jetbrains.datagrip
    # jetbrains.phpstorm
    jetbrains.webstorm
    jetbrains.idea-ultimate

    # go_1_21
    # gofumpt
    # gotools
  ];
}
