{ lib, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = {
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
        "\n$character"
      ];
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
        format = "'[](bold fg:yellow)[$duration](bold bg:yellow fg:black)[](bold fg:yellow)'";
      };
      character = {
        success_symbol = "[❯](bold purple)";
        error_symbol = "[❯](bold red)";
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
        truncation_length = 4;
        truncation_symbol = "~/…/";
      };
      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
        "Videos" = " ";
        "Projects" = "󱌢 ";
        "School" = "󰑴 ";
        "GitHub" = "";
        ".config" = " ";
        "Vault" = "󱉽 ";
      };
      git_branch = {
        symbol = "󰘬";
        style = "bg: green";
        truncation_length = 4;
        truncation_symbol = "";
        format = "• [](bold fg:green)[$symbol $branch(:$remote_branch)](fg:black bg:green)[](bold fg:green)";
      };
      git_commit = {
        tag_symbol = " ";
        commit_hash_length = 4;
      };
      os = {
        disabled = false;
        # format = "[](fg:blue)[$symbol](bg:blue fg:black)[](fg:blue)";
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
      # python = lang "" "yellow";
      # nodejs = lang " " "yellow";
      # lua = lang "󰢱" "blue";
      # rust = lang "" "red";
      # java = lang "" "red";
      # c = lang "" "blue";
      # golang = lang "" "blue";
    };
  };
}
