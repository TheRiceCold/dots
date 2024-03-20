{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # sops-nix.url = "github:mic92/sops-nix"; # TODO: Implement this

    nur.url = "github:nix-community/NUR";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    helix-kai.url = "github:thericecold/helix-kai";

    # Kaizen Inputs
    ags.url = "github:aylur/ags";
    # astal.url = "github:Aylur/astal";
    matugen.url = "github:iniox/matugen";
    hyprlock.url = "github:hyprwm/hyprlock";
    pyprland.url = "github:hyprland-community/pyprland";

    kaivim.url = "github:thericecold/kaivim";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
 };

  outputs = inputs @ { ... }: {
    homeConfigurations = import ./home { inherit inputs; };
    nixosConfigurations = import ./nixos { inherit inputs; };
  };

  nixConfig = { };
}

# /* config */''
# group {
#   col.border_active = $mauve $blue 45deg
#   col.border_inactive = $overlay0
#   col.border_locked_inactive = $red
#   col.border_locked_active = $peach

#   groupbar {
#     font_family = PragmataPro
#     font_size = 10
#     gradients = true
#     height = 15
#     col.active = $mauve
#     col.inactive = $overlay0
#     col.locked_inactive = $red
#     col.locked_active = $peach
#   }
# }

# plugin {
#   nstack {
#     layout {
#       orientation=left
#       new_on_top=0
#       new_is_master=1
#       no_gaps_when_only=0
#       special_scale_factor=0.8
#       inherit_fullscreen=1
#       stacks=2
#       center_single_master=0
#       mfact=0.5
#       single_mfact=0.5
#     }
#   }
# }

# windowrule = float, yad|nm-connection-editor|pavucontrol|Rofi
# windowrule = float, feh|Gimp|qt5ct
# windowrule = fullscreen, neovide
# windowrule = float, title:^(Firefox — Sharing Indicator)$
# windowrule = workspace special:discord silent, Electron
# windowrule = workspace special:whatsapp silent, whatsapp-nativefier-d40211
# windowrule = workspace special:whatsapp silent, com.rtosta.zapzap
# windowrule = workspace special:whatsapp silent, org.telegram.desktop
# windowrule = move 1511 919, showmethekey-gtk
# windowrule = float, showmethekey-gtk
# windowrule = noborder, showmethekey-gtk
# windowrule = opacity 1.0 override 1.0 override, ^(showmethekey-gtk)$
# windowrule = noblur, showmethekey-gtk
# windowrule = nofocus, showmethekey-gtk
# windowrule = noanim, showmethekey-gtk
# windowrule = noshadow, showmethekey-gtk
# windowrule = float, ^(com.github.hluk.copyq)$
# windowrule = workspace 1 silent, ^(thunderbird)$
# # windowrule = group, ^(firefox)$
# # windowrule = group, ^(whatsapp-nativefier-d40211)$
# windowrule = group, ^(org.remmina.Remmina)$
# windowrule = group override barred, ^(kitty)$
# windowrulev2 = tile, class:^(ONLYOFFICE)
# windowrulev2 = center, , title:^(LibreOffice)$
# # windowrulev2 = nomaximizerequest, class:.*

# windowrule = float, wlogout
# windowrule = move 0 0, wlogout
# windowrule = size 100% 100%, wlogout
# windowrule = noanim, wlogout

# windowrulev2 = workspace 4, class:^(Apache Directory Studio)$
# windowrulev2 = bordercolor $green $red, floating:1
# windowrulev2 = bordercolor $lavender $mauve, fullscreen:1
# windowrulev2 = opacity 0.8 0.8, pinned:1
# windowrulev2 = workspace special:steam, class:^(steam)$, title:^(Sign in to Steam)$
# windowrulev2 = workspace special:steam, class:^(steam)$, title:^(Steam)$
# # windowrulev2 = workspace 7 silent, class:^(lutris)$, title:^(Lutris)$
# windowrulev2 = idleinhibit focus, class:^(teams-for-linux)$
# windowrulev2 = float, class:^(firefox)$, title:^(Picture-in-Picture)$
# windowrulev2 = maxsize 1000 1000, class:(firefox)
# windowrulev2 = fullscreen, class:^(Torchlight2.bin.x86_64)$, title:^(Torchlight II v.1.25.5.4)$
# windowrulev2 = dimaround, class:^(rofi)$
# windowrulev2 = tile, class:^(dev.warp.Warp)$

# # for xwaylandvideobridge
# windowrulev2 = opacity 0.0 override 0.0 override, class:^(xwaylandvideobridge)$
# windowrulev2 = noanim, class:^(xwaylandvideobridge)$
# windowrulev2 = nofocus, class:^(xwaylandvideobridge)$
# windowrulev2 = noinitialfocus, class:^(xwaylandvideobridge)$

# $term = kitty
# $menu = anyrun
# $powermenu = $scriptsDir/powermenu
# $volume = $scriptsDir/volume
# $backlight = $scriptsDir/brightness
# $screenshot = $scriptsDir/screenshot
# $lock = $scriptsDir/lockscreen
# # $logout = archlinux-logout
# $logout = $scriptsDir/wleave.sh
# $colorpicker = $scriptsDir/colorpicker
# $wofi_beats = $scriptsDir/wofi-beats
# $files = nautilus
# $browser = firefox
# # $music = youtube-music
# $music = spotify
# $mail = thunderbird

# # bind = $mainMod, Return, exec, $term -1 -e zellij a MMU
# bind = $mainMod ALT, T, exec, WARP_ENABLE_WAYLAND=1 warp-terminal
# bind = $mainMod, Return, exec, $term -1 -e /home/opal/.tmux/plugins/t-smart-tmux-session-manager/bin/t
# bind = $mainMod, A, exec, [workspace 6 silent] microsoft-edge-stable -enable-features=UseOzonePlatform -ozone-platform=wayland --profile-directory="Default"
# bind = $mainMod SHIFT, A, exec, [workspace 6 silent] microsoft-edge-stable -enable-features=UseOzonePlatform -ozone-platform=wayland --profile-directory="Profile 1"
# bind = $mainMod, Z, exec, [workspace 5 silent] teams-for-linux -enable-features=UseOzonePlatform -ozone-platform=wayland
# bind = $mainMod, X, exec, apachedirectorystudio
# bind = $mainMod, J, layoutmsg, rollnext
# bind = $mainMod, K, layoutmsg, rollprev
# bind = $mainMod SHIFT, J, cyclenext
# bind = $mainMod SHIFT, K, cyclenext, prev
# bind = $mainMod SHIFT, Return, layoutmsg, swapwithmaster
# bind = $mainMod SHIFT, period, layoutmsg, orientationnext
# bind = $mainMod SHIFT, comma, layoutmsg, orientationprev
# bind = $mainMod CTRL, comma, layoutmsg, focusmaster
# bind = $mainMod, L, exec, $scriptsDir/changeLayout
# bind = $mainMod SHIFT, L, exec, swaylock -fFC $scriptsDir/calvin
# # bind = $mainMod, S, exec, hyprctl dispatch splitratio 0.3
# # bind = $mainMod SHIFT, S, exec, hyprctl dispatch splitratio -0.3
# bind = $mainMod, Escape, exec, $logout
# # Test rofi logout... no keybinds though which sux
# # bind = $mainMod SHIFT, Escape, exec, $HOME/.config/rofi/scripts/powermenu_t3
# # bind = $mainMod, Y, exec, $term -1 --class update -T update -e cava
# # bind = $mainMod SHIFT, Y, exec, [float] $term -1 --class clock -T clock -e tty-clock -c -B -C 7 -r -s -f "%A, %B, %d"
# bind = $mainMod, I, exec, $colorpicker
# bindr = $mainMod, Y, exec, pkill rofi || $wofi_beats
# bind = $mainMod SHIFT, D, exec, [workspace special:discord silent] discord
# bind = $mainMod, 0, exec, ROFI_PASS_CONFIG="$HOME/.config/rofi-pass/config" rofi-pass
# bind = ALT, tab, exec, rofi -show window
# bind = $mainMod, 9, exec, rofi -show calc
# # bind = $mainMod, 8, exec, rofi -show emoji
# bind = $mainMod, P, exec, $scriptsDir/grimblast -n copysave area


# bind = $mainMod, B, exec, killall -SIGUSR1 waybar
# bind = $mainMod SHIFT, B, exec, killall -SIGUSR2 waybar

# # Master layout specific
# bind = $mainMod, M, submap, masterlayout
# submap = masterlayout
# bind = , I, layoutmsg, addmaster
# bind = , I, submap, reset
# bind = , D, layoutmsg, removemaster
# bind = , D, submap, reset
# bind = , escape, submap, reset
# submap = reset

# # Night mode (blue filter)
# bind = $mainMod, T, exec, hyprctl keyword decoration:screen_shader $scriptsDir/flux.glsl
# bind = $mainMod SHIFT, T, exec, hyprctl keyword decoration:screen_shader "[[EMPTY]]"

# bind = $mainMod, G, togglegroup
# bind = $mainMod, tab, changegroupactive
# bind = $mainMod CTRL, G, moveoutofgroup
# bind = $mainMod ALT, G, lockgroups, toggle
# bind = $mainMod SHIFT, G, submap, group
# submap = group
# bind = , J, moveintogroup, d
# bind = , J, submap, reset
# bind = , K, moveintogroup, u
# bind = , K, submap, reset
# bind = , L, moveintogroup, r
# bind = , L, submap, reset
# bind = , H, moveintogroup, l
# bind = , H, submap, reset
# bind = , escape, submap, reset
# submap = reset

# # Screenshots
# bind = , Print, submap, screenshot
# submap = screenshot
# bind = , 1, exec, $scriptsDir/grimblast -n copysave screen
# bind = , 1, submap, reset
# bind = , 2, exec, $scriptsDir/grimblast -n copysave output
# bind = , 2, submap, reset
# bind = , 3, exec, $scriptsDir/grimblast -n copysave active
# bind = , 3, submap, reset
# bind = , 4, exec, $scriptsDir/grimblast -n copysave area
# bind = , 4, submap, reset
# bind = , escape, submap, reset
# submap = reset
# bind = SHIFT, Print, exec, $scriptsDir/grimblast -n copy output


# # Resize
# bind = $mainMod SHIFT, R, submap, resize
# submap = resize
# binde = , H, resizeactive,-50 0
# binde = , L, resizeactive,50 0
# binde = , K, resizeactive,0 -50
# binde = , J, resizeactive,0 50
# binde = , left, resizeactive,-50 0
# binde = , right, resizeactive,50 0
# binde = , up, resizeactive,0 -50
# binde = , down, resizeactive,0 50
# bind = , escape, submap, reset
# submap = reset

# # Move
# bind = $mainMod SHIFT, M, submap, move
# submap = move
# bind = , H, movewindow, l
# bind = , L, movewindow, r
# bind = , K, movewindow, u
# bind = , J, movewindow, d
# bind = , left, movewindow, l
# bind = , right, movewindow, r
# bind = , up, movewindow, u
# bind = , down, movewindow, d
# bind = , period, exec, hyprctl dispatch movewindow mon:0
# bind = , comma, exec, hyprctl dispatch movewindow mon:1
# bind = , escape, submap, reset
# submap = reset

# # Focus
# bind = $mainMod SHIFT, F, submap, focus
# submap = focus
# bind = , left, movefocus, l
# bind = , right, movefocus, r
# bind = , up, movefocus, u
# bind = , down, movefocus, d
# bind = , H, movefocus, l
# bind = , L, movefocus, r
# bind = , K, movefocus, u
# bind = , J, movefocus, d
# bind = , escape, submap, reset
# submap = reset

# # Preselection split ONLY IN DWINDLE mode
# bind = $mainMod, S, submap, split
# submap = split
# bind = , J, exec, hyprctl dispatch layoutmsg "preselect d"
# bind = , J, submap, reset
# bind = , K, exec, hyprctl dispatch layoutmsg "preselect u"
# bind = , K, submap, reset
# bind = , L, exec, hyprctl dispatch layoutmsg "preselect r"
# bind = , L, submap, reset
# bind = , H, exec, hyprctl dispatch layoutmsg "preselect l"
# bind = , H, submap, reset
# bind = , escape, submap, reset
# submap = reset

# # Bypass global keybinds to pass binds directly to application (eg: VMs)
# bind = $mainMod CTRL, Grave, submap, passthru
# submap = passthru
# bind = $mainMod, Escape, submap, reset
# submap = reset

# # bind = $mainMod, O, exec, hyprctl dispatch focuscurrentorlast


# # Move/resize windows with mainMod + LMB/RMB and dragging
# # mouse:272 = left
# # mouse:273 = right
# # mouse:274 = middle
# # mouse:275 = side
# # mouse:276 = extra
# bindm = $mainMod, mouse:272, movewindow
# bindm = $mainMod, mouse:273, resizewindow
# bind = $mainMod, mouse:274, togglefloating
# bindm = , mouse:275, movewindow
# bindm = , mouse:276, resizewindow

# # The second bind is redundant but I'm used to it in DWM
# # bind = $mainMod SHIFT CTRL, comma, exec, hyprctl dispatch swapactiveworkspaces 1 0
# # bind = $mainMod SHIFT CTRL, period, exec, hyprctl dispatch swapactiveworkspaces 0 1
# # bind = $mainMod SHIFT CTRL, left, exec, hyprctl dispatch swapactiveworkspaces 1 0
# # bind = $mainMod SHIFT CTRL, right, exec, hyprctl dispatch swapactiveworkspaces 0 1
# bind = $mainMod SHIFT CTRL, comma, exec, hyprctl dispatch changemonitor next
# bind = $mainMod SHIFT CTRL, period, exec, hyprctl dispatch changemonitor prev
# # focus monitor.
# bind = $mainMod, comma, focusmonitor, l
# bind = $mainMod, comma, workspace, e-1 
# bind = $mainMod, bracketleft, workspace, e-1
# bind = $mainMod, period, focusmonitor, r
# bind = $mainMod, period, workspace, e+1 
# bind = $mainMod, bracketright, workspace, e+1

# # move
# bind = SHIFTALT, comma, movecurrentworkspacetomonitor, l
# bind = SHIFTALT, period, movecurrentworkspacetomonitor, r

# # Try swap workspace Plugin
# # bind = ALT, 1, exec, $scriptsDir/try_swap_workspace 1

# # laptop lid switch
# bindl = , switch:on:Lid Switch, exec, hyprctl keyword monitor "eDP-1, 1920x1080, 1920x0, 1"
# bindl = , switch:off:Lid Switch, exec, hyprctl keyword monitor "eDP-1, disable"

# exec-once = swaybg -m fill -i $HOME/.config/hypr/bg/mohamed-chahin-plane.jpg
# # exec-once = swaybg -m fill -i $HOME/Pictures/mmuwallpaper.jpg
# exec-once = $scriptsDir/import-gsettings
# exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
# exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
# exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
# # exec-once=systemctl --user restart xdg-desktop-portal.service
# # exec-once=sleep 1 && /usr/lib/xdg-desktop-portal-hyprland &
# # exec-once = $scriptsDir/portal
# exec-once = wl-paste --watch cliphist store
# exec-once = [workspace special:junks silent] xwaylandvideobridge
# exec-once = mako --config $HOME/.config/hypr/mako/config
# exec-once = waybar --config ~/.config/hypr/waybar/config --style ~/.config/hypr/waybar/style.css
# exec-once = kmonad $HOME/.config/hypr/kmonad/lappy.kbd
# exec-once = sudo setkeycodes e057 240 e058 240
# exec-once = socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock EXEC:"${SCRIPTSDIR}/shellevents ${SCRIPTSDIR}/submaps.sh",nofork &
# exec-once = rclone mount --vfs-cache-mode writes MMU: /home/opal/MMU &
# exec-once = libinput-gestures-setup start
# exec-once = swayidle -w timeout 900 'swaylock -FfC $scriptsDir/calvin' timeout 1000 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -fC $scriptsDir/calvin'

# # workspace = special, on-created-empty:$term -1 -e t work
# # workspace = special, on-created-empty:[float maximize] $term -1 --class scratch -e zellij a MMU
# workspace = special, on-created-empty:$term -1 -e /home/opal/.tmux/plugins/t-smart-tmux-session-manager/bin/t
# # workspace = special, on-created-empty:warp-terminal
# workspace = special:trash, on-created-empty:$music
# # workspace = special:whatsapp, on-created-empty:whatsapp-nativefier
# workspace = special:whatsapp, on-created-empty:zapzap
# workspace = special:steam, on-created-empty:steam
# workspace = special:discord, on-created-empty:discord
# workspace = special:jump, on-created-empty:$term -1 -e $HOME/.local/bin/jj
# workspace = 1, on-created-empty:$mail
# workspace = 2, on-created-empty:LIBVA_DRIVER_NAME=nvidia __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only __NV_PRIME_RENDER_OFFLOAD=1 $browser
# workspace = 10, on-created-empty:microsoft-edge-stable -enable-features=UseOzonePlatform -ozone-platform=wayland --profile-directory="Profile 1"
# ''
