{ pkgs, ... }:
let
  terminal = "${pkgs.foot}/bin/foot";
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-size: 13px;
        font-family: JetBrainsMono Nerd Font;
      }

      window#waybar { 
        padding: 8px 0; 
        background: #242339;
      }

      #workspaces { padding: 4px 40px; }
    '';
    settings = {
      mainBar = {
        height = 35;
        spacing = 8;
        layer = "top";
        position = "top";
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 0;

        # modules-left = [  "custom/launcher" ];
        modules-center = [ "cava" "hyprland/workspaces" "cava" ];

        modules-right = [
          # "tray"
          # "pulseaudio"
          # "network"
          # "battery"
          # "clock"
        ];

        battery = {
          format = "{icon}  {capacity}%";
          format-alt = "{icon} {time}";
          format-charging = "  {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          format-plugged = " {capacity}% ";
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
        };

        "custom/launcher" = {
          format = " ";
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
            "<span foreground='#7C6EEB'>▁</span>" 
            "<span foreground='#7C6EEB'>▂</span>" 
            "<span foreground='#7C6EEB'>▃</span>" 
            "<span foreground='#7C6EEB'>▄</span>" 
            "<span foreground='#5D9CED'>▅</span>" 
            "<span foreground='#5D9CED'>▆</span>" 
            "<span foreground='#5D9CED'>▇</span>" 
            "<span foreground='#5D9CED'>█</span>" 
          ];
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          "persistent_workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        tray = {
          spacing = 5;
          icon-size = 21;
        };

        clock = {
          format = " {:%a, %d %b, %I:%M %p}";
          format-alt = " {:%d/%m}";
          tooltip = "true";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        network = {
          format-wifi = "󰖩 {signalStrength}%";
          format-ethernet = "󰈀 {cidr}";
          tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
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
      };
    };
  };
}
