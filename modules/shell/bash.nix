{ pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        cd      = "z";
        v       = "nvim";
        x       = "exit";
        c       = "clear";
        rmr     = "rm -r";
	      code    = "codium";
        l       = "joshuto";
        py      = "python3";
        pipes   = "pipes.sh";
        wifi    = "doas nmtui";
        flakes  = "nvim ~/Flakes/flake.nix";
      };

      initExtra = ''
        export PATH="$PATH:$HOME/.local/bin"

        # Android Tools
        export ANDROID_HOME="~/Android/Sdk"
        export PATH="$PATH:$ANDROID_HOME/tools"
        export PATH="$PATH:$ANDROID_HOME/emulator"
        export PATH="$PATH:$ANDROID_HOME/tools/bin"
        export PATH="$PATH:$ANDROID_HOME/platform-tools"

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