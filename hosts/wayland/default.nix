{ config, inputs, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    root.initialPassword = "password";
    wolly = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [ "wheel" "networkmanager" "docker" "video" "audio" "camera" ]; # Enable ‘sudo’ for the user.
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
      pamixer
      wayland
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
    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ amdvlk ];
  };

  services = {
    gvfs.enable = true;
    dbus.packages = [ pkgs.gcr ];
    # getty.autologinUser = "$user";
    xserver.xkbOptions = "caps:escape";
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
