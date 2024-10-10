{ inputs, pkgs, ... }: {
  home = {
    packages = [pkgs.gitmux];
    file.".gitmux.conf".source = ./gitmux.yml;
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    terminal = "screen-256color";
    plugins = let
      plugins = import ./plugins.nix pkgs;
      sessionx = inputs.tmux-sessionx.packages.${pkgs.system}.default;
    in with pkgs.tmuxPlugins; [
        yank
        continuum
        resurrect
        vim-tmux-navigator

        sessionx
        plugins.floax
      ];

    extraConfig = let
      blue = "#[fg=#5ea1ff]";
      grey = "#[fg=#7b8496]";
      # time-format = "%a %d, %H:%M";
      gitmux = "$(gitmux -cfg ~/.gitmux.conf #{pane_current_path})";
    in /*tmux*/ ''
      set -g renumber-windows on

      bind -n C-n next-window
      bind -n C-p previous-window

      # Split window on current dir
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind r source-file ~/.config/tmux/tmux.conf \; display-message 'Config reloaded...'

      set -g status-interval 3
      set -g status-justify 'centre'
      set -g status-style bg=default,fg=default

      set -g status-left '${blue}█ #S'
      set -g status-right " ${blue}█"

      set -g window-status-format '${grey} #I:#W'
      set -g window-status-current-format '${blue}#[bold] #I:#W #(if [[ ${gitmux} ]]; then echo [${gitmux + blue}]; else echo ""; fi)'

      set -g @continuum-restore 'on'

      set -g @sessionx-bind 'o'
      set -g @floax-bind "-n C-\\"

      set -g @floax-text-color '#ffffff'
      set -g @floax-border-color '#5ea1ff'
    '';
  };
}
