{ inputs, ... }:

let
  inherit (inputs.home-manager.lib) homeManagerConfiguration;

  mkHome = { user, host, system, modules }: {
    "${user}@${host}" = homeManagerConfiguration {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [ "./${user}" ];
    };
  };
in 
{
  flake.homeConfiguration = (
    # Main
    mkHome {
      user = "kaizen";
      host = "thinkpad";
      system = "x86-64_linux";
      modules = [];
    }
  );
}
