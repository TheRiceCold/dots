{ pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        cd  = "z";
        v   = "nvim";
        do  = "doas";
        c   = "clear";
        rmr = "rm -r";
      };
      initExtra = ''
        export ANDROID_HOME="~/Android"
        export PATH="$PATH:$ANDROID_HOME/emulator"
        export PATH="$PATH:$ANDROID_HOME/platform-tools"
        export PATH="$PATH:$ANDROID_HOME/cmdline-tools/tools/bin"

        eval "$(zoxide init bash)"
        neofetch
      '';
    };
  };
}
