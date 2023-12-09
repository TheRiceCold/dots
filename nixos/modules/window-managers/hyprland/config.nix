''
  monitor   = eDP-1,1920x1080@60,0x0,1  # Monitor

  exec-once = fcitx5 -D                 # Keyboard
  exec-once = blueman-applet            # Bluetooth
  exec-once = waybar                    # Status Bar
  exec-once = swww init                 #

  input {
    kb_layout = us
    repeat_rate   = 50
    repeat_delay  = 240
    kb_options    = caps:escape 

    touchpad {
      disable_while_typing=1
      natural_scroll = true
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
    gaps_out = 0
    border_size = 2
    col.inactive_border = 0xff382D2E
    col.active_border = rgba(a28b35ff) 45deg
  }

  # DECORATION
  decoration {
    rounding = 4

    # BLUR
    blur = yes
    blur_size = 7
    blur_passes = 4
    blur_new_optimizations = on

    # SHADOW
    shadow_range = 4
    drop_shadow = yes
    col.shadow = 0x66404040
    shadow_render_power = 3
  }

  animations {
    enabled = yes

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 5, myBezier
    animation = windowsOut, 1, 5, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 5, default
    animation = specialWorkspace, 1, 5, myBezier, slidevert
  }


  dwindle {
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
  }

  master {
    new_is_master = true
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
  windowrule = float, Rofi
  windowrule = float, pavucontrol

  # Increase the opacity 
  # windowrule = opacity 0.9, emacs
  # windowrule = opacity 0.9, kitty
  # windowrule = opacity 0.9, thorium

  ^.*nvim.*$
  bindm = SUPER, mouse:272, movewindow
  bindm = SUPER, mouse:273, resizewindow

  bind = SUPER, Q, killactive
  bind = SUPER, F, fullscreen,1
  bind = SUPER, B, exec, thorium
  bind = SUPER, RETURN, exec, kitty
  bind = SUPERSHIFT, F, fullscreen,0
  bind = SUPERSHIFT, Q, exit,
  bind = SUPER, SPACE, exec, rofi -show drun
  bind = SUPERSHIFT, C, exec, hyprpicker -a
  bind = SUPERSHIFT, E, exec, wlogout
  bind = SUPER, T, togglefloating,

  bind = SUPERSHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -   # Screenshot 
  bind = SUPER,R,exec,wf-recorder -g "$(slurp)"                 # Screen Recorder

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
''
