{ inputs, ... }: let
  # kaizen = inputs.kaizen.homeManagerModules.default;
in {
  imports = [./theme.nix ./wayland ./apps];

  # programs.kaizen.enable = true;
}
