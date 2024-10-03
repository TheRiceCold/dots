{ inputs, pkgs, ... }: let
  # plugins = import ./plugins.nix pkgs;
  sessionx = inputs.tmux-sessionx.packages.${pkgs.system}.default;
in {
  imports = [./gitmux.nix];

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      yank
      continuum
      resurrect

      sessionx
    ];

    extraConfig = let
      blue = "#[fg=#5ea1ff]";
      grey = "#[fg=#7b8496]";
      # time-format = "%a %d, %H:%M";
      gitmux = "$(gitmux -cfg ~/.gitmux.conf #{pane_current_path})";
    in /*tmux*/ ''
      set -g mouse on
      set -g renumber-windows on
      set -g escape-time 0 # Escape ridiculously delayed

      set -g status-interval 3
      set -g status-justify 'centre'
      set -g status-style bg=default,fg=default

      set -g @sessionx-bind 'o'

      set -g status-left '${blue}█ #S'
      set -g status-right " ${blue}█"

      set -g window-status-format '${grey} #I:#W'
      set -g window-status-current-format '${blue}#[bold] #I:#W #(if [[ ${gitmux} ]]; then echo [${gitmux + blue}]; else echo ""; fi)'
    '';
  };
}
