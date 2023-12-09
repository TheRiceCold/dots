{ user, inputs, pkgs, ... }:

{
  imports = [ ./options.nix ] ++ (
    import ./modules/theme/gruvbox/hyprland ++
    import ./modules/window-managers ++
    import ./modules/programs
  );

  hyprland.enable = true; # Enables Hyprland

  console.useXkbConfig = true;

  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true; # Enable Sound

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [ linux-firmware ];

  nix = {
    settings.auto-optimise-store = true; 

    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 2d";
    };

    package = pkgs.nixVersions.unstable;    # Enable Flakes
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations 	    = true
    '';
  };
  nixpkgs.config.allowUnfree = true;        # Allow Proprietary Software

  system.stateVersion = "23.05";

  home-manager.users.${user} = {
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;
  };
}
