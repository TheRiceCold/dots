{ pkgs, lib, user, ... }:

let
  compileSCSS = name: source: "${pkgs.runCommandLocal name {} ''
    mkdir -p $out
    ${lib.getExe pkgs.sassc} -t expanded '${source}' > $out/${name}.css
  ''}/${name}.css";
in {
  home-manager.users.${user} = {
    programs.waybar = {
      enable = true;
      style  = builtins.readFile (compileSCSS "waybar-style" ./style.scss);

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
	  exclusive = true;
	  passthrough = false;
	  gtk-layer-shell = true;

          modules-left = [ "custom/launcher" ];
	  modules-center = [ "tray" ];
          modules-right = [ 
	    "pulseaudio" 
	    "network" 
	    "battery" 
	    "custom/date" 
	    "clock" 
	  ];

	  "custom/launcher" = {
	    format = "󰈸";
    	    on-click = "bash $HOME/.config/rofi/launcher.sh";
    	    on-click-right = "bash $HOME/.config/rofi/run.sh";
	  };

          pulseaudio = {
            format = "{icon} {volume}%";
            format-muted = "󰖁 Muted";
            format-icons = {
              car = "";
              phone = "";
              portable = "";
              headset = "";
              headphone = "";
              hands-free = "";
              default = [ "" "" "" ];
            };
            on-click = "pavucontrol";
          };

          network = {
            format-wifi = "  {essid}";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "󰤮 Disconnected";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format-alt = "{time} {icon}";
            format = "{icon} {capacity}%";
            format-full = "󱈑 {capacity}%";
            format-icons = [ "󱊡" "󱊢" "󱊣" ];
            format-plugged = "󰂄{capacity}%";
            format-charging = "󰂄 {capacity}%";
          };
          "custom/date" = {
            format = "󰸗 {}";
            interval = 3600;
            exec = "/home/loki/bin/waybar-date.sh";
          };
          clock = {
            format = "󰅐 {:%H:%M}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
          };
        };
      };
    };
  };
}
