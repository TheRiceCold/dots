{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.system = "x86_64-linux";

  nixpkgs.config.allowUnfree = true;

  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 1;
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  networking = {
    hostName = "NixOS"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
  };

  time.timeZone = "Asia/Manila"; # set time zone

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  };

  sound.enable = true; # Enable Sound

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    wolly = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [ "wheel" "docker" "video" "audio" "camera" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        google-chrome
        lxappearance
        pavucontrol
        alacritty
        neofetch
        firefox
        nodejs
        yarn
	      btop
    	  xclip
      ];
    };
  };

  # List packages installed in system profile. To search, run $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    gcc
    wget
    tmux
    clang
    unzip
    docker
    neovim
    ripgrep
    lazygit
    linux-firmware
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    # dconf.enable = true;
    light.enable = true;

    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  # List services that you want to enable:
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

    # Enable the OpenSSH daemon.
    # openssh.enable = true;

    # Enable CUPS to print documents.
    # printing.enable = true;
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = ''
        permit nopass :wheel
      '';
    };
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11"; # Did you read the comment?

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # copySystemConfiguration = true;
  };
}
