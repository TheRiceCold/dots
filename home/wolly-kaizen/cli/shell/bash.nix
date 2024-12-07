pkgs: {
  initExtra = /*sh*/ ''
    export CHROME_EXECUTABLE=${pkgs.google-chrome}/bin/google-chrome-stable

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
}
