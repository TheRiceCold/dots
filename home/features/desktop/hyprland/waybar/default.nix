{ pkgs, ... }:
let
  terminal = "${pkgs.foot}/bin/foot";
  launcher = "${pkgs.rofi-wayland}/bin/rofi -show drun";

  # wallpapers = {
  #   nord = {
  #     url = "https://raw.githubusercontent.com/Ruixi-rebirth/wallpaper/main/22.png";
  #     sha256 = "sha256-ZkuTlFDRPALR//8sbRAqiiAGApyqpKMA2zElRa2ABhY=";
  #   };
  # };
  # default_wall = wallpapers.nord or (throw "Unknown theme");
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    killall dynamic_wallpaper
    ${pkgs.swww}/bin/swww img $(find ~/flakes/assets/. -name "*.png" | shuf -n1) --transition-type random
  '';
  dynamic_wallpaper = pkgs.writeShellScriptBin "dynamic_wallpaper" ''
    ${pkgs.swww}/bin/swww img $(find ~/flakes/assets/. -name "*.png" | shuf -n1) --transition-type random
    OLD_PID=$!
    while true; do
      sleep 120
    ${pkgs.swww}/bin/swww img $(find ~/flakes/assets/. -name "*.png" | shuf -n1) --transition-type random
      NEXT_PID=$!
      sleep 5
      kill $OLD_PID
      OLD_PID=$NEXT_PID
    done
  '';
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = import ./style.nix;
    settings = {
      mainBar = {
        layer = "top";
        height = 35;
        spacing = 8;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 0;

        fixed-center = false;
        modules-left = [ 
          "hyprland/workspaces" 
          # "custom/wall"
        ];

        modules-center = [
          # "hyprland/window"
          "cava"
          "custom/launcher"
          "cava"
        ];

        modules-right = [
          "tray"
          "pulseaudio"
          "battery"
          "network"
          "clock"
        ];

        "custom/launcher"= {
          format= " ";
          tooltip= "false";
          on-click= launcher;
          # on-click-right= "bash $HOME/.config/rofi/run.sh"; 
        };

        "custom/wall" = {
          on-click = "${wallpaper_random}/bin/wallpaper_random";
          # on-click-middle = "${default_wall}/bin/default_wall";
          on-click-right = "killall dynamic_wallpaper || ${dynamic_wallpaper}/bin/dynamic_wallpaper &";
          format = " 󰠖 ";
          tooltip = false;
        };

        cava = {
          framerate = 60;
          autosens = 1;
          bars = 18;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          source = "auto";
          method = "pipewire";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          input_delay = 2;
          format-icons = [ 
            "<span foreground='#cba6f7'>▁</span>" 
            "<span foreground='#cba6f7'>▂</span>" 
            "<span foreground='#cba6f7'>▃</span>" 
            "<span foreground='#cba6f7'>▄</span>" 
            "<span foreground='#89b4fa'>▅</span>" 
            "<span foreground='#89b4fa'>▆</span>" 
            "<span foreground='#89b4fa'>▇</span>" 
            "<span foreground='#89b4fa'>█</span>" 
          ];
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            default = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "active" = "󱓻";
            "urgent" = "󱓻";
          };
          "persistent_workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        "hyprland/window" = {
          format = "{}";
        };

        tray = {
          spacing = 5;
          icon-size = 21;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = " {:%a %b %d}";
          format = " {:%I:%M %p}";
          today-format = "<span color = '#ff6699'><b><u>{}</u></b></span>";
          format-calendar = "<span color='#ecc6d9'><b>{}</b></span>";
          format-calendar-weeks = "<span color='#99ffdd'><b>W{:%U}</b></span>";
          format-calendar-weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          on-scroll = {
            calendar = 1;
          };
        };

        memory = {
          interval = 30;
          on-click = "${terminal} btop";
          format = " {used:0.1f}G / {total:0.1f}G";
          tooltip = false;
        };

        disk = {
          format = "󰋊 {percentage_used}%";
          format-alt = "󰋊 {used}/{total} GiB";
          interval = 5;
          path = "/";
        };

        network = {
          # interface = "wlp2*"; # Optional
          format-wifi = "󰖩 {signalStrength}%";
          format-ethernet = "󰈀 {cidr}";
          tooltip-format = "{ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnect = "󰖪";
          on-click = "${terminal} nmtui";
        };

        pulseaudio = {
          # scroll-step = 1; # %, can be a float
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}%  {format_source}";
          format-bluetooth-muted = "󰖁 ";
          format-muted = "󰖁";
          # format-source = "{volume}% ";
          # format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "󰂑";
            headset = "󰂑";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "custom/notification" = {
          # exec = "~/.config/waybar/scripts/notification.sh";
          exec = "~/flake/home/desktop/services/wayland/waybar/scripts/notification.sh";
          on-click = "dunstctl set-paused toggle";
          on-click-right = "notify-send -t 1 'swww' '1' & ~/flake/home/desktop/graphical/wms/hyprland/scripts/wall";
          return-type = "json";
          max-length = 50;
          format = "{}";
        };
      };
    };
  };
}
