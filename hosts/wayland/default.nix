{ config, inputs, pkgs, ... }:

{
 imports = [ ../../modules/desktop/hyprland ];

  users.users = {
    root.initialPassword = "password";
    wolly = {
      isNormalUser    = true;
      initialPassword = "password";

      extraGroups = [             # Enable ‘sudo’ for the user.
        "wheel" "networkmanager" 
        "docker" "video" 
        "audio" "camera" 
      ]; 

      packages = with pkgs; [
    	  xclip
        pipes
      ];
    };
  };

  # Bootloader
  boot = {
    cleanTmpDir = true;
    initrd.kernelModules = [ "amdgpu" ];

    loader = {
      systemd-boot = {
        enable      = true;
        consoleMode = "auto";
      };

      efi = {
        canTouchEfiVariables  = true;
        efiSysMountPoint      = "/boot";
      };

      timeout = 1;
    };
    consoleLogLevel = 0;
    initrd.verbose  = false;
  };

  # List packages installed in system profile. To search, run $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      grim
      mako
      swaybg
      pamixer

      waybar
      wlogout
      wayland
      wlsunset          # Day/night gamma adjustments for Wayland
      xwayland
      wlr-randr
      eww-wayland
      rofi-wayland
      wl-clipboard
      wayland-utils
      linux-firmware
      wayland-protocols
      inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    dconf.enable = true;
    light.enable = true;
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
