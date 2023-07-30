{ inputs, config, ... }: 

let
  inherit (inputs.nix-colors) colorSchemes;
  nord = (import ./nord.nix).colorscheme;
in {
  imports = [ inputs.nix-colors.homeManagerModule ];

  colorscheme = nord;
}
