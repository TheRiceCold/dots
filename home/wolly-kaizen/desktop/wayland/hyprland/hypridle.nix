 {
  enable = true;
  settings = {
    general = {
      # avoid starting multiple kaizen-lock instances.
      lock_cmd = "pidof kaizen-lock || kaizen-lock";
      # lock before suspend.
      before_sleep_cmd = "kaizen-lock";
      # to avoid having to press a key twice to turn on the display.
      after_sleep_cmd = "hyprctl dispatch dpms on";
    };

    listener = [
      {
        timeout = 300; # 5min.
        # set monitor backlight to minimum, avoid 0 on OLED monitor.
        on-timeout = "light -S 10";
        # monitor backlight restore.
        on-resume = "brightnessctl -r";
      }

      {
        timeout = 150; # 2.5mins
        # turn off keyboard backlight.
        on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
        # turn on keyboard backlight.
        on-resume = "brightnessctl -rd rgb:kbd_backlight";
      }
      {
        timeout = 600; # 10mins
        on-timeout = "kaizen-lock";
      }

      {
        timeout = 900; # 15mins
        # screen off when timeout has passed
        on-timeout = "hyprctl dispatch dpms off";
        # screen on when activity detected after timeout
        on-resume = "hyprctl dispatch dpms on";
      }

      {
        timeout = 1800; # 30mins
        on-timeout = "systemctl suspend";
      }
    ];
  };
}

