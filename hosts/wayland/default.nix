{ config, inputs, pkgs, ... }:

{
 
 imports = [ ../../modules/desktop/hyprland ];

  users.users = {
    root.initialPassword = "password";
    wolly = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [ "wheel" "networkmanager" "docker" "video" "audio" "camera" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        google-chrome   # Browser
        lxappearance
        pavucontrol     # Volume Control
        alacritty
        neofetch
        firefox         # Browser
        nodejs
        yarn
	      btop
    	  xclip
      ];
    };
  };

  # Bootloader
  boot = {
    cleanTmpDir = true;
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

  # List packages installed in system profile. To search, run $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      swaybg
      grim
      mako
      pamixer

      waybar
      wlogout
      wayland
      wayfire
      wlsunset          # Day/night gamma adjustments for Wayland
      xwayland
      wlr-randr
      wayland-utils
      linux-firmware
      wayland-protocols
      # inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    dconf.enable = true;
    light.enable = true;
    bash = {
      enableCompletion = true;
      shellAliases = {
        v = "nvim";
        do = "doas";
        cd = "zoxide";
      };
    };

    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ amdvlk rocm-opencl-icd rocm-opencl-runtime ];
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
    };
  };

  services = {
    gvfs.enable = true;
    dbus.packages = [ pkgs.gcr ];
    # getty.autologinUser = "$user";
    xserver= {
      enable = true;
      layout = "us";
      videoDrivers = [ "amdgpu" ];
      displayManager = {
        startx.enable = true;
      };
    };
  };

  console.useXkbConfig = true;

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = ''
        permit nopass :wheel
      '';
    };
  };
}
