# INFO: https://github.com/fastfetch-cli/fastfetch/wiki
{ lib, pkgs, ... }:
{
  home.packages = [ pkgs.fastfetch ];

  xdg.configFile."fastfetch/config.jsonc".text = /* jsonc */ '' {
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",

    "logo": {
      // INFO: idk why but it can't render png
      "type": "sixel",
      "source": "${./images/blonde_anime.jpg}",
    },

    "display": { "separator": " " },

    "modules": [
      "break",
      {
        "type": "custom",
        "format": " \u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m  \u001b[38m  \u001b[39m"
      },
      "break",
      {
        "type": "cpu",
        "key": "╭─",
        "keyColor": "green"
      },
      {
        "type": "disk",
        "key": "├─",
        "keyColor": "green"
      },
      {
        "type": "memory",
        "key": "╰─󰑭",
        "keyColor": "green"
      },
      "break",
      {
        "type": "shell",
        "key": "╭─",
        "keyColor": "yellow"
      },
      {
        "type": "wm",
        "key": "├─",
        "keyColor": "yellow"
      },
      {
        "type": "terminalfont",
        "key": "╰─",
        "keyColor": "yellow"
      },

      "break",
      {
        "type": "title",
        "key": "╭─",
        "format": "{1}@{2}",
        "keyColor": "blue"
      },
      {
        "type": "os",
        "key": "├─",
        "keyColor": "blue" },
      {
        "type": "packages",
        "key": "├─",
        "keyColor": "blue"
      },
      {
        "type": "uptime",
        "key": "╰─󱎫",
        "keyColor": "blue"
      }
    ]
  } '';
}
