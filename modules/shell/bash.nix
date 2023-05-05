{ pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        cd      = "z";
        v       = "nvim";
        do      = "doas";
        c       = "clear";
        rmr     = "rm -r";
        l       = "joshuto";
        py      = "python3";
        pipes   = "pipes.sh";
        wifi    = "doas nmtui";
        flakes  = "nvim ~/Flakes/flake.nix";
      };
      initExtra = ''
        export PATH="$PATH:$HOME/.local/bin"

        # Android Tools
        export ANDROID_HOME="~/Android"
        export PATH="$PATH:$ANDROID_HOME/emulator"
        export PATH="$PATH:$ANDROID_HOME/platform-tools"
        export PATH="$PATH:$ANDROID_HOME/cmdline-tools/tools/bin"

        killport() {
          kill $(lsof -t -i:$1) 
        }

        reflake() {
          doas nix-collect-garbage -d && doas nixos-rebuild switch --flake .#$1
        }

        reflake_bash() {
          reflake $1 && source ~/.bashrc
        }

        reflake_reboot() {
          reflake $1 && reboot
        }

        eval "$(zoxide init bash)"
        neofetch
      '';
    };
  };
}
