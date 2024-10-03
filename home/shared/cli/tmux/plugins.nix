pkgs: {
  # link: https://github.com/olimorris/tmux-pomodoro-plus
  pomodoro = pkgs.tmuxPlugins.mkTmuxPlugin {
    version = "1.0.2";
    pluginName = "pomodoro";
    src = pkgs.fetchFromGitHub {
      owner = "olimorris";
      repo = "tmux-pomodoro-plus";
      rev = "51fb321da594dab5a4baa532b53ea19b628e2822";
      hash = "sha256-LjhG2+DOAtLwBspOzoI2UDTgbUFWj7vvj6TQXqWw9z0=";
    };
    rtpFilePath = "pomodoro.tmux";
  };

  floax = pkgs.tmuxPlugins.mkTmuxPlugin {
    version = "dev";
    pluginName = "floax";
    src = pkgs.fetchFromGitHub {
      owner = "omerxx";
      repo = "tmux-floax";
      rev = "01031665ace7a36405366e52c4f23573caa010a5";
      hash = "sha256-7XdME6VUF5JAu6BklSng0LFK0eUe7ECRNb/d1/YD3K0=";
    };
    rtpFilePath = "floax.tmux";
  };
}
