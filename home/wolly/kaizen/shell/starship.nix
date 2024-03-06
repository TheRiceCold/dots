# NOTE: prolly need some customization
{ lib, ... }:
{
  enable = true;
  settings = let
    lang = icon: color: {
      symbol = icon;
      format = "[$symbol ](${color})";
    };
  in {
    add_newline = true;
    format = lib.strings.concatStrings [
      "$nix_shell"
      "$os"
      "$directory"
      "$container"
      "$git_branch $git_status"
      "$python"
      "$nodejs"
      "$lua"
      "$rust"
      "$java"
      "$c"
      "$golang"
      "$cmd_duration"
      "$status"
      "$line_break"
      "[❯](bold purple)"
      ''''${custom.space}''
    ];
    custom.space = {
      when = ''! test $env'';
      format = "  ";
    };
    continuation_prompt = "∙  ┆ ";
    line_break = { disabled = false; };
    status = {
      symbol = "✗";
      not_found_symbol = "󰍉 Not Found";
      not_executable_symbol = " Can't Execute E";
      sigint_symbol = "󰂭 ";
      signal_symbol = "󱑽 ";
      success_symbol = "";
      format = "[$symbol](fg:red)";
      map_symbol = true;
      disabled = false;
    };
    cmd_duration = {
      min_time = 0;
      format = "[$duration ](fg:yellow)";
    };
    nix_shell = {
      disabled = false;
      format = "[](fg:white)[ ](bg:white fg:black)[](fg:white) ";
    };
    container = {
      symbol = " 󰏖";
      format = "[$symbol ](yellow dimmed)";
    };
    directory = {
      format = " [](fg:bright-black)[$path](bg:bright-black fg:white)[](fg:bright-black)";
      truncation_length = 6;
      truncation_symbol = "~/…/";
    };
    git_branch = {
      symbol = "";
      style = "";
      format = "[ $symbol $branch](fg:purple)(:$remote_branch)";
    };
    git_commit = {
      tag_symbol = " ";
      commit_hash_length = 4;
    };
    os = {
      disabled = false;
      format = "$symbol";
    };
    os.symbols = {
      Arch = "[ ](fg:bright-blue)";
      Debian = "[ ](fg:red)";
      EndeavourOS = "[ ](fg:purple)";
      Fedora = "[ ](fg:blue)";
      NixOS = "[ ](fg:blue)";
      openSUSE = "[ ](fg:green)";
      SUSE = "[ ](fg:green)";
      Ubuntu = "[ ](fg:bright-purple)";
    };

    python = lang "" "yellow";
    nodejs = lang " " "yellow";
    lua = lang "󰢱" "blue";
    rust = lang "" "red";
    java = lang "" "red";
    c = lang "" "blue";
    golang = lang "" "blue";
  };
}
