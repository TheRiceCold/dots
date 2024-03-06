{ pkgs, ... }:
{
  home.packages = [ pkgs.onefetch ];

  programs.bash.initExtra = /* bash */ ''

    # git repository greeter
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

    # optional, greet also when opening shell directly in repository directory
    # adds time to startup
    check_directory_for_new_repository

  '';
}
