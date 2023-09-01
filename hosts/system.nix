{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  time.timeZone = "Asia/Manila";  # TIME ZONE
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "NixOS";                 # HOSTNAME.
    networkmanager.enable = true;       # NETWORK MANAGER
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
	      btop
        kitty               # Terminal Emulator
      	xclip
        neofetch
        pavucontrol         # Audio/Volume Control
        google-chrome       # Browser
        libsForQt5.dolphin  # File Manager

        yarn
        cargo
        rustc               # Rust
        nodejs
        python39            # Python

        emacs
	      postman
        vscodium            # Code Editor
        obsidian	          # Obsidian

        scrcpy
        qemu_kvm

        # Game Development Packages
        godot_4
        unityhub

        pulseeffects-legacy # Equalizer
        obs-studio
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
    fzf
    gcc
    git
    dash
    lsof
    tmux
    wget
    clang
    neovim
    docker
    zoxide
    gnumake
    lazygit
    ripgrep
    transmission  # BitTorrent client
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
