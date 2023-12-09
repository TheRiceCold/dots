{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    terminal = "xterm-256color";

    extraConfig = '' 
      icon=""
      color_fg="#1C1C1C"
      color_bg="#739E6E"

      # Reloads Configuration
      unbind r

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

      resurrect_dir="~/.local/share/tmux/resurrect"

      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-processes 'vim nvim hx cat less more tail watch'
      set -g @resurrect-dir $resurrect_dir
      set -g @resurrect-hook-post-save-all '~/.tmux/post_save.sh $resurrect_dir/last'
    '';
  };
}
