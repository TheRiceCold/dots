{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nixpkgs = {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  time.timeZone       = "Asia/Manila";    # TIME ZONE
  i18n.defaultLocale  = "en_US.UTF-8";

  networking = {
    hostName = "NixOS";                   # HOSTNAME.
    networkmanager.enable = true;         # NETWORK MANAGER
  };

  users.users = {
    wolly = {
      isNormalUser    = true;
      initialPassword = "password";

      extraGroups = [ 
        "wheel" 
        "docker" 
        "video" 
        "audio" 
        "camera" 
        "networkmanager" 
      ]; # Enable ‘sudo’ for the user.

      packages = with pkgs; [
        lxappearance
        pavucontrol
        neofetch
        joshuto
        kitty
    	  xclip
	      btop
        gimp

        librewolf
        google-chrome   # Browser
      ];
    };
  };

  fonts = {
    fontconfig.enable = true;
    fontDir.enable    = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [ "JetBrainsMono" ];
      })
    ];
  };

  environment.systemPackages = with pkgs; [
    gcc
    git
    fzf
    wget
    tmux
    clang
    unzip
    docker
    helix
    neovim
    zoxide
    ripgrep
    lazygit
  ];

  sound.enable = true; # Enable Sound

  services = {
    pipewire = {
      enable = true;
      alsa   = {
        enable        = true;
        support32Bit  = true;
      };
      jack.enable     = true;
      pulse.enable    = true;
    };

    dbus.enable       = true;
    blueman.enable    = true;
    openssh.enable    = true;
  };


  hardware = {
    opengl = {
      enable          = true;
      driSupport      = true;
      driSupport32Bit = true;
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
      extraPackages   = with pkgs; [ amdvlk rocm-opencl-icd rocm-opencl-runtime ];
    };
    bluetooth.enable  = true;
  };

  security = {
    rtkit.enable  = true;
    polkit.enable = true;
  };

  nix = {
    settings.auto-optimise-store = true; 

    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 2d";
    };

    package = pkgs.nixVersions.unstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations 	    = true
    '';
  };

  system = {
    autoUpgrade = {
      enable  = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
  };
}
