{ pkgs, ... }:

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

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi  = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
    extraConfig = ''
      monitor   = eDP-1,1920x1080@60,0x0,1  # Monitor
      exec-once = fcitx5 -D                 # Keyboard
      exec-once = blueman-applet            # Bluetooth

      exec-once = waybar                    # Status Bar

      exec-once = ~/.config/hypr/scripts/startpage.sh # Start Page

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
        layout = dwindle
        sensitivity = 1.0 # for mouse cursor

        gaps_in = 4
        gaps_out = 4
        border_size = 2
	      no_cursor_warps = true
	      no_border_on_floating = false
        col.inactive_border = 0xff382D2E
        col.active_border = rgba(a28b35ff) 45deg

        apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
      }

      # DECORATION
      decoration {
        rounding = 4

        # BLUR
        blur = yes
        blur_size = 5
        blur_passes = 3
	      blur_xray = true
	      blur_ignore_opacity = true
        blur_new_optimizations = true   

	      # SHADOW
	      shadow_range = 10
	      shadow_offset = 1 2
	      drop_shadow = false
	      col.shadow = 0x66404040
	      shadow_render_power = 5
	      shadow_ignore_window = true
        
        # OPACITY
        active_opacity = 0.85
        inactive_opacity = 0.75
        fullscreen_opacity = 1.0

	      blurls = waybar
	      blurls = lockscreen
      }

      animations {
        enabled = yes
        bezier = wind, 0.05, 0.9, 0.1, 1.05
        bezier = winIn, 0.1, 1.1, 0.1, 1.1
        bezier = winOut, 0.3, -0.3, 0, 1
        bezier = liner, 1, 1, 1, 1
        animation = windows, 1, 6, wind, slide
        animation = windowsIn, 1, 6, winIn, slide
        animation = windowsOut, 1, 5, winOut, slide
        animation = windowsMove, 1, 5, wind, slide
        animation = border, 1, 1, liner
        animation = borderangle, 1, 30, liner, loop
        animation = fade, 1, 10, default
        animation = workspaces, 1, 5, wind
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
        no_gaps_when_only = false
        special_scale_factor = 0.8
      }

      misc {
        disable_hyprland_logo = true
	      disable_splash_rendering = true
	      mouse_move_enables_dpms = true

        animate_manual_resizes = true
	      mouse_move_focuses_monitor = true

        enable_swallow = true
        swallow_regex =
        focus_on_activate = true
      }

      # Float Necessary Windows
      windowrule = float,Rofi
      windowrule = float,glava
      windowrule = float,pavucontrol

      # Increase the opacity 
      windowrule = opacity 0.5,glava
      windowrule = opacity 0.8,kitty
      windowrule = opacity 0.95,codium

      ^.*nvim.*$
      windowrule  = tile,spotify
      windowrule  = tile,librewolf
      bindm=SUPER,mouse:272,movewindow
      bindm=SUPER,mouse:273,resizewindow

      # example binds
      bind = SUPER,Q,killactive
      bind = SUPER,F,fullscreen,1
      bind = SUPER,RETURN,exec,kitty
      bind = SUPERSHIFT,F,fullscreen,0
      bind = SUPER,B,exec,google-chrome-stable
      bind = SUPERSHIFT,Q,exit,
      bind = SUPER,SPACE,exec, rofi -show drun

      bind =,XF86AudioMute,exec,~/.config/hypr/scripts/volume mute
      bind =,XF86AudioRaiseVolume,exec,~/.config/hypr/scripts/volume up
      bind =,XF86AudioLowerVolume,exec,~/.config/hypr/scripts/volume down
      bind =,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle

      bindle=,XF86MonBrightnessUp,exec,~/.config/hypr/scripts/brightness up  # increase screen brightness
      bindle=,XF86MonBrightnessDown,exec,~/.config/hypr/scripts/brightness down # decrease screen brightness
      bind = SUPERSHIFT,C,exec,bash ~/.config/hypr/scripts/hyprPicker.sh
      bind = SUPERSHIFT,E,exec,wlogout
      bind = SUPER, T, togglefloating,

      bind=SUPERSHIFT,S,exec,grim -g "$(slurp)" - | swappy -f -   # Screenshot 
      bind=SUPER,R,exec,wf-recorder -g "$(slurp)"                 # Screen Recorder

      bind=SUPERSHIFT,RETURN,layoutmsg,swapwithmaster

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

      bind = SUPERSHIFT,1,movetoworkspacesilent,1
      bind = SUPERSHIFT,2,movetoworkspacesilent,2
      bind = SUPERSHIFT,3,movetoworkspacesilent,3
      bind = SUPERSHIFT,4,movetoworkspacesilent,4
      bind = SUPERSHIFT,5,movetoworkspacesilent,5
      bind = SUPERSHIFT,6,movetoworkspacesilent,6
      bind = SUPERSHIFT,7,movetoworkspacesilent,7
      bind = SUPERSHIFT,8,movetoworkspacesilent,8
      bind = SUPERSHIFT,9,movetoworkspacesilent,9
      bind = SUPERSHIFT,0,movetoworkspacesilent,10
    '';
  };
}
