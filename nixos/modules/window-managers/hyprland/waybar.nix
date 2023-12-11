{ user, ... }:

let
  theme = {
    fontsize = "12";
    font = "JetBrainsMono Nerd Font, FontAwesome";
    background = "11111B";
    primary-accent = "538888";
    secondary-accent = "729D6D";
    tertiary-accent = "DCCAA5";
    icons = {
      nix = { icon = ""; color = "89B6D9"; };
      artix = { icon = ""; color = "2F95C8"; };
      alpine = { icon = ""; color = "266482"; };
      debian = { icon = ""; color = "D61D5A"; };
      windows = { icon = ""; color = "1980C7"; };
      android = { icon = ""; icon-alt = "󰀲"; color = "4FD47F"; };
    };
    palette = {
      primary-accent-hex = "cba6f7";
      secondary-accent-hex = "89b4fa";
      primary-background-hex = "11111B";
      secondary-background-hex = "423B38";
      tertiary-background-hex = "998878";
      primary-background-rgba = "(54, 49, 46, 0.5)";
    };
  };
in {
  home-manager.users.${user} = {
    programs.waybar = {
      enable = true;
      settings.mainBar = {
        height = 24;
        layer = "top";
        position = "top";

        modules-left = [ 
          "custom/launcher"
          "custom/artix"
          "custom/debian"
          "custom/alpine"
          "custom/windows"
          "custom/android"
          "custom/openbsd"
          "custom/nintendo"
          "custom/playstation"
        ];

        modules-center = [ 
          "cava" 
          # "custom/slack" 
          # "custom/github" 
          # "custom/spotify" 
          "cava" 
        ];

        modules-right = [
          "tray" 
          "pulseaudio" 
          "network"
          "battery"
          "clock" 
        ];

        "hyprland/workspaces" = {
          sort-by = "ID";
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
          all-outputs = false;
          persistent-workspaces = {
            "1" = [ "DP-1" ];
            "2" = [ "DP-1" ];
            "3" = [ "DP-1" ];
            "4" = [ "DP-1" ];
          };
        };

        "custom/slack" = {
          format = "󰒱";
          tooltip = false;
        };

        "custom/github" = {
          format = "";
          tooltip = false;
        };

        "custom/spotify" = {
          format = "";
          tooltip = false;
        };

        "custom/launcher" = {
          tooltip = false;
          format = theme.icons.nix.icon;
          on-click = "rofi -show drun -replace";
        };

        "custom/artix" = {
          tooltip = false;
          format = theme.icons.artix.icon;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        "custom/debian" = {
          tooltip = false;
          format = theme.icons.debian.icon;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        "custom/alpine" = {
          tooltip = false;
          format = theme.icons.alpine.icon;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        "custom/windows" = {
          tooltip = false;
          format = theme.icons.windows.icon;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        "custom/android" = {
          tooltip = false;
          format = theme.icons.android.icon;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        "custom/openbsd" = {
          format = "🐡";
          tooltip = false;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        "custom/nintendo" = {
          format = "󱎓";
          tooltip = false;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        "custom/playstation" = {
          format = "";
          tooltip = false;
          on-click = "~/.config/scripts/launchvm.sh";
        };

        cava = {
          bars = 14;
          autosens = 1;
          framerate = 165;
          input_delay = 2;
          waves = false;
          stereo = true;
          reverse = false;
          source = "auto";
          method = "pipewire";
          bar_delimiter = 0;
          monstercat = false;
          # sensitivity = 100;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          noise_reduction = 0.77;
          actions = { on-click-right = "mode"; };
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        tray = { spacing = 8; };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };

          format = "{icon}  {capacity}%";
          format-alt = "{icon}  {time}";
          format-plugged = "  {capacity}%";
          format-charging = "  {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        memory = {
          interval = 5;
          format = "󰍛 {}%";
          format-alt = "󰍛 {used}/{total} GiB";
        };

        cpu = {
          interval = 5;
          format = "󰻠 {usage}%";
          format-alt = "󰻠 {avg_frequency} GHz";
        };

        network = {
          max-length = 50;
          on-click = "$TERM nmtui";
          format = "{ifname}";
          format-ethernet = "󰈀 100%";
          format-linked = "{ifname} (No IP)";
          format-wifi = "  {signalStrength}%";
          format-disconnected = "󰖪 Not connected";
          tooltip-format = "Connected to{essid} {ifname} via {gwaddr}";
          tooltip-format-wifi = "  {essid} ({signalStrength}%)";
          tooltip-format-ethernet = "  {ifname} ({ipaddr}/{cidr})";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            car = "";
            phone = "";
            portable = "";
            headset = "";
            headphone = "";
            hands-free = "";
            default = ["" " " " "];
          };
          # scroll-step = 5;
          on-click = "pavucontrol";
        };

        clock = {
          tooltip = "true";
          timezone = "Asia/Manila";
          format = " {:%m/%d/%y}";
          format-alt = " {:%a, %I:%M%p}";
          tooltip-format= "<tt><big>{calendar}</big></tt>";
        };

        "custom/waybarthemes" = {
          format = "";
          tooltip = false;
          on-click = "~/.config/waybar/themeswitcher.sh";
        };
      };

      style = ''
       * {
          border: none;
          min-height: 0;
          font-size: 16px;
          border-radius: 0;
          font-family: ${theme.font};
        }

        window#waybar {
          background: rgba${theme.palette.primary-background-rgba};
        }

        #cava, 
        #custom-launcher,
        #custom-artix,
        #custom-debian,
        #custom-alpine,
        #custom-windows,
        #custom-android,
        #custom-openbsd,
        #custom-nintendo,
        #custom-playstation { 
          padding: 0 8px;
          font-size: 20px;
          margin-right: 4px;
          color: #${theme.tertiary-accent}; 
        }
        #custom-nintendo { 
          color: #D5182E; 
        }
        #custom-windows { 
          color: #${theme.icons.windows.color}; 
        }
        #custom-debian { 
          color: #${theme.icons.debian.color}; 
        }
        #custom-artix { 
          color: #${theme.icons.artix.color}; 
        }
        #custom-alpine { 
          color: #${theme.icons.alpine.color}; 
        }
        #custom-android { 
          color: #${theme.icons.android.color}; 
        }

        #workspaces {
          margin: 5px 5px;
          padding: 8px 5px;
          border-radius: 16px;
          color: #${theme.primary-accent};
          background: #${theme.palette.tertiary-background-hex};
        }

        #workspaces button {
          padding: 0 5px;
          margin: 0 3px;
          color: transparent;
          border-radius: 16px;
          transition: all 0.3s ease-in-out;
          background: #${theme.palette.primary-background-hex};
        }

        #workspaces button.active {
          min-width: 50px;
          border-radius: 16px;
          background-size: 400% 400%;
          color: #${theme.background};
          transition: all 0.3s ease-in-out;
          background-color: #${theme.secondary-accent};
        }

        #workspaces button:hover {
          min-width: 50px;
          border-radius: 16px;
          background-size: 400% 400%;
          color: #${theme.background};
          background-color: #${theme.tertiary-accent};
        }

        #tray, 
        #network, 
        #battery,
        #pulseaudio {
          margin: 5px 0;
          font-weight: bold;
          background: #${theme.palette.secondary-background-hex};
        }

        #tray, #pulseaudio, #network, #battery {
          padding: 0 20px;
          margin-left: 7px;
          color: #${theme.tertiary-accent};
          border-radius: 10px 24px 10px 24px;
        }

        #clock {
          margin-left: 7px;
          font-weight: bold;
          padding: 0 10px 5px 25px;
          border-radius: 0 0 0 40px;
          color: #${theme.tertiary-accent};
          background: #${theme.palette.secondary-background-hex};
        }

        #custom-launcher { 
          font-size: 24px;
          padding: 0 35px 0 15px;
          border-radius: 0 0 40 0;
          color: #${theme.icons.nix.color}; 
          background: #${theme.palette.secondary-background-hex};
        }

        #window {
          margin-top: 5px;
          font-style: normal;
          font-weight: normal;
          margin-bottom: 5px;
          padding-left: 15px;
          padding-right: 15px;
          border-radius: 16px;
          background: #${theme.palette.tertiary-background-hex};
        }
      '';
    };
  };
}
