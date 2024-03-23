# DOCS: https://github.com/fastfetch-cli/fastfetch/wiki
{ pkgs, ... }:
let
  module = type: key: color: ''{ "type": "${type}", "key": "${key}", "keyColor": "${color}" }'';
  config = /* jsonc */ '' {
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",

    "logo": {
      // NOTE: idk why but it can't render png
      "type": "sixel",
      "source": "${../../../../../assets/ibu.jpeg}",
    },

    "display": { "separator": " " },

    "modules": [
      "break",
      {
        "type": "custom",
        "format": " \u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m  \u001b[38m  \u001b[39m"
      },

      "break",
      ${module "cpu"    "╭─" "green" },
      ${module "disk"   "├─" "green" },
      ${module "memory" "╰─󰑭" "green" },
      "break",
      ${module "shell" "╭─" "green" },
      ${module "wm"    "├─" "green" },
      ${module "font"  "╰─" "green" },
      "break",

      {
        "type": "title",
        "key": "╭─",
        "format": "{1}@{2}",
        "keyColor": "green"
      },

      ${module "os"       "├─" "green" },
      ${module "packages" "├─" "green" },
      ${module "uptime"   "╰─󱎫" "green" }
    ]
  } '';
in {
  home.packages = [ pkgs.fastfetch ];
  xdg.configFile."fastfetch/config.jsonc".text = config;
}
