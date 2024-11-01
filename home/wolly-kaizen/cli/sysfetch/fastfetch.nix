# See at https://github.com/fastfetch-cli/fastfetch/wiki
{ pkgs, ... }:
let
  module = type: key: ''{ "type": "${type}", "key": "${key}", "keyColor": "blue" }'';
  config = /*jsonc*/ ''
    {
       "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",

       "logo": {
         // NOTE: idk why but it can't render png
         "type": "sixel",
         "source": "${../../../../../assets/ibu-cyber.jpg}",
       },

       "display": { "separator": " " },

       "modules": [
         "break",
         {
           "type": "custom",
           "format": " \u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m  \u001b[38m  \u001b[39m"
         },

         "break",
         ${module "cpu" "╭─"},
         ${module "disk" "├─"},
         ${module "memory" "╰─󰑭"},
         "break",
         ${module "shell" "╭─"},
         ${module "wm" "├─"},
         ${module "font" "╰─"},
         "break",

         {
           "type": "title",
           "key": "╭─",
           "format": "{1}@{2}",
           "keyColor": "blue"
         },

         ${module "os" "├─"},
         ${module "packages" "├─"},
         ${module "uptime" "╰─󱎫"}
       ]
     }
  '';
in
{
  home.packages = [ pkgs.fastfetch ];
  # xdg.configFile."fastfetch/config.jsonc".text = config;
}

