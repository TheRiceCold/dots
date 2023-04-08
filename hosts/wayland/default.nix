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
        librewolf
        glava

        lxappearance
        pavucontrol     # Volume Control
        alacritty
        neofetch
	      btop
    	  xclip

        # Dev Tools
        
        jdk11
        yarn
        nodejs
        rustc
        cargo
        vscodium
        android-tools
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
      wlsunset          # Day/night gamma adjustments for Wayland
      xwayland
      wlr-randr
      rofi-wayland
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
  };

  services = {
    gvfs.enable = true;
    dbus.packages = [ pkgs.gcr ];
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
