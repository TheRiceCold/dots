{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    escapeTime = 0;
    historyLimit = 10000;
    secureSocket = false;
    terminal = "xterm-256color";
    extraConfig = '' 
      icon=""
      color_fg="#1C1C1C"
      color_bg="#739E6E"

      # Reloads Configuration
      unbind r
      bind r source-file ~/.tmux.conf

      # unbind s
      # bind s split-window -v
      bind v split-window -h

      # Enable color support
      set -ga terminal-overrides ",*256col*:Tc"

      # Start windows and panes index at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1

      set -g mouse on       # Allow use of mouse
      set -g status-style fg=$color_fg,bg=$color_bg
      set -g status-left " $icon  "
      set -g status-justify centre
      set -g status-right ""

      # Plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'

      # Initialize TPM plugin manager
      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}
