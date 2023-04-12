{ ... }:

{
  imports = [ (import ./environments.nix) ];

  programs = {
    bash = { 
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';
    };
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
    extraConfig = ''
      monitor   = eDP-1,1920x1080@60,0x0,1  # Monitor
      exec-once = fcitx5 -D                 # Keyboard 
      exec-once = blueman-applet            # Bluetooth

      exec-once = eww daemon
      exec-once = waybar                    # Status Bar
      exec-once = dunst                     # Notification 

      # Wallpaper
      exec-once=swaybg -o \* -i ~/.config/hypr/wallpapers/landscape.jpg -m fill
      # For lockscreen
      exec-once=swayidle -w timeout 200 'swaylock-fancy'

      exec-once = ~/.config/hypr/scripts/startpage.sh # Start Page

      # Screen Sharing 
      exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once=~/.config/hypr/scripts/screensharing.sh

      input {
        repeat_rate   = 50
        repeat_delay  = 240
        kb_options    = caps:escape 

        touchpad {
          disable_while_typing=1
          natural_scroll= true
          clickfinger_behavior=1
          middle_button_emulation=0
          tap-to-click=1
        }
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 4
        workspace_swipe_distance = 250
        workspace_swipe_invert = true
        workspace_swipe_min_speed_to_force = 15
        workspace_swipe_cancel_ratio = 0.5
        workspace_swipe_create_new = false
      }

      general {
        layout=dwindle
        sensitivity=1.0 # for mouse cursor

        gaps_in = 4
        gaps_out = 16
        border_size = 2
        col.active_border = 0xff5e81ac
        col.inactive_border = 0x66333333

        apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
      }

      decoration {
        rounding = 4

        # BLUR
        blur       = yes
        blur_size = 5 # minimum 1
        blur_passes = 3 # minimum 1, more passes = more resource intensive.
        blur_new_optimizations = true   
        
        # OPACITY
        active_opacity = 0.90
        inactive_opacity = 0.75
        fullscreen_opacity = 1.0

        # col.shadow=0xffa7caff
        # col.shadow_inactive=0x50000000
        # drop_shadow=true
        # shadow_range=8
      }

      # Blur for waybar 
      blurls=waybar
      blurls=lockscreen

      animations {
        enabled=1
        bezier = overshot, 0.13, 0.99, 0.29, 1.1
        animation = windows, 1, 4, overshot, slide
        animation = windowsOut, 1, 5, default, popin 80%
        animation = border, 1, 5, default
        animation = fade, 1, 8, default
        animation = workspaces, 1, 6, overshot, slidevert
      }

      dwindle {
        no_gaps_when_only = false
        force_split = 0 
        special_scale_factor = 0.8
        split_width_multiplier = 1.0 
        use_active_for_splits = true
        pseudotile = yes 
        preserve_split = yes 
      }

      master {
        new_is_master = true
        special_scale_factor = 0.8
        new_is_master = true
        no_gaps_when_only = false
      }

      misc {
        disable_autoreload = true
        disable_hyprland_logo = true
        always_follow_on_dnd = true
        layers_hog_keyboard_focus = true
        animate_manual_resizes = false
        enable_swallow = true
        swallow_regex =
        focus_on_activate = true
      }

      # Float Necessary Windows
      windowrule    = float,Rofi
      windowrule    = float,pavucontrol
      windowrulev2  = float,class:^()$,title:^(Picture in picture)$
      windowrulev2  = float,class:^(brave)$,title:^(Save File)$
      windowrulev2  = float,class:^(brave)$,title:^(Open File)$
      windowrulev2  = float,class:^(LibreWolf)$,title:^(Picture-in-Picture)$
      windowrulev2  = float,class:^(blueman-manager)$
      windowrulev2  = float,class:^(org.twosheds.iwgtk)$
      windowrulev2  = float,class:^(blueberry.py)$
      windowrulev2  = float,class:^(xdg-desktop-portal-gtk)$
      windowrulev2  = float,class:^(geeqie)$

      # Increase the opacity 
      windowrule=opacity 0.85,kitty
      windowrule=opacity 0.8,VSCodium

      ^.*nvim.*$
      windowrule=tile,spotify
      windowrule=tile,librewolf
      bindm=SUPER,mouse:272,movewindow
      bindm=SUPER,mouse:273,resizewindow

      # example binds
      bind=SUPER,Q,killactive
      bind=SUPER,F,fullscreen,1
      bind=SUPER,RETURN,exec,kitty
      bind=SUPERSHIFT,F,fullscreen,0
      bind=SUPER,B,exec,google-chrome
      bind=SUPERSHIFT,Q,exit,
      bind=SUPER,E,exec,pcmanfm
      bind=SUPER,SPACE,exec, rofi -show drun

      bind=,XF86AudioMute,exec,~/.config/hypr/scripts/volume mute
      bind=,XF86AudioLowerVolume,exec,~/.config/hypr/scripts/volume down
      bind=,XF86AudioRaiseVolume,exec,~/.config/hypr/scripts/volume up
      bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle

      bindle=,XF86MonBrightnessUp,exec,~/.config/hypr/scripts/brightness up  # increase screen brightness
      bindle=,XF86MonBrightnessDown,exec,~/.config/hypr/scripts/brightness down # decrease screen brightnes
      bind = SUPERSHIFT,C,exec,bash ~/.config/hypr/scripts/hyprPicker.sh
      bind = SUPERSHIFT,E,exec,wlogout
      bind = SUPER, T, togglefloating,
      bind = SUPERSHIFT,P,exec,pomotroid --in-process-gpu

      # Screen shot 
      bind=SUPERSHIFT,S,exec,grim -g "$(slurp)" - | swappy -f -
      # Screen recorder
      bind=SUPER,R,exec,wf-recorder -g "$(slurp)"

      bind=SUPERSHIFT,RETURN,layoutmsg,swapwithmaster

      # bind=SUPER,j,layoutmsg,cyclenext
      # bind=SUPER,k,layoutmsg,cycleprev

      bind=SUPER,j,movefocus,d
      bind=SUPER,k,movefocus,u

      bind=SUPER,h,movefocus,l
      bind=SUPER,l,movefocus,r

      bind=SUPER,left,resizeactive,-40 0
      bind=SUPER,right,resizeactive,40 0

      bind=SUPER,up,resizeactive,0 -40
      bind=SUPER,down,resizeactive,0 40

      bind=SUPERSHIFT,h,movewindow,l
      bind=SUPERSHIFT,l,movewindow,r
      bind=SUPERSHIFT,k,movewindow,u
      bind=SUPERSHIFT,j,movewindow,d

      bind=SUPER,1,workspace,1
      bind=SUPER,2,workspace,2
      bind=SUPER,3,workspace,3
      bind=SUPER,4,workspace,4
      bind=SUPER,5,workspace,5
      bind=SUPER,6,workspace,6
      bind=SUPER,7,workspace,7
      bind=SUPER,8,workspace,8
      bind=SUPER,9,workspace,9
      bind=SUPER,0,workspace,10

      bind=SUPERSHIFT,1,movetoworkspacesilent,1
      bind=SUPERSHIFT,2,movetoworkspacesilent,2
      bind=SUPERSHIFT,3,movetoworkspacesilent,3
      bind=SUPERSHIFT,4,movetoworkspacesilent,4
      bind=SUPERSHIFT,5,movetoworkspacesilent,5
      bind=SUPERSHIFT,6,movetoworkspacesilent,6
      bind=SUPERSHIFT,7,movetoworkspacesilent,7
      bind=SUPERSHIFT,8,movetoworkspacesilent,8
      bind=SUPERSHIFT,9,movetoworkspacesilent,9
      bind=SUPERSHIFT,0,movetoworkspacesilent,10
    '';
  };
}
