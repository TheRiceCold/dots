{ ... }:
let
  theme = {
    icon = "";
    foreground ="1C1C1C";
    background ="739E6E";
  };
in {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    terminal = "xterm-256color";

    extraConfig = '' 
      unbind r  # Reloads Configuration

      bind v split-window -h

      # Enable color support
      set -ga terminal-overrides ",*256col*:Tc"

      set -g base-index 1
      setw -g pane-base-index 1

      set -g mouse on
      set -g status-style fg=#${theme.foreground}, bg=#${theme.background}
      set -g status-left " ${theme.icon} "
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
