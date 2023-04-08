{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs = {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  time.timeZone = "Asia/Manila"; # set time zone
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "NixOS"; # Define your hostname.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  };

  # Enable touchpad support (enabled default in most desktopManager).

  users.users = {
    wolly = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [ "wheel" "networkmanager" "docker" "video" "audio" "camera" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        pavucontrol
        neofetch
        firefox
    	  xclip
	      btop
      ];
    };
  };

  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      fira-code
      fira-code-symbols
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })
    ];
  };

  environment.systemPackages = with pkgs; [
    gcc
    git
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
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };

    blueman.enable = true;
    openssh.enable = true;
    dbus.enable = true;
  };


  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ amdvlk rocm-opencl-icd rocm-opencl-runtime ];
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
    };
    bluetooth.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  nix = {
    settings.auto-optimise-store = true; 
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
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
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11"; # Did you read the comment?
  };
}
