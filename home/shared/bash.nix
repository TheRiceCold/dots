{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      yz = "yazi";
      nv = "neovide";
      curl = "curlie";
      tmux-source = "tmux source ~/.config/tmux/tmux.conf";
    };

    initExtra = /*sh*/ ''
      export CHROME_EXECUTABLE=${pkgs.google-chrome}/bin/google-chrome-stable

      # Runs only on first instance (scratchpad terminal)
      LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l);
      if [ $LIVE_COUNTER -eq 1 ]; then
        fastfetch
      fi

      # git repository greeter (onefetch)
      last_repository=
      check_directory_for_new_repository() {
        current_repository=$(git rev-parse --show-toplevel 2> /dev/null)

        if [ "$current_repository" ] && \
           [ "$current_repository" != "$last_repository" ]; then
          onefetch
        fi
        last_repository=$current_repository
      }
      cd() {
        builtin cd "$@"
        check_directory_for_new_repository
      }
    '';
  };
}
