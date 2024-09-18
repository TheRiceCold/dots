let
  theme = {
    cyberdream = {
      mouseEvents = false;
      activeBorderColor = ["#5ef1ff"];
      inactiveBorderColor = ["#7b8496"];
      searchingActiveBorderColor = ["#ff5ef1"];
      optionsTextColor = ["#3c4048"];
      selectedLineBgColor = ["#3c4048"];
      cherryPickedCommitBgColor = ["#3c4048"];
      cherryPickedCommitFgColor = ["#ff5ea0"];
      unstagedChangesColor = ["#ffbd5e"];
      defaultFgColor = ["#ffffff"];
    };
  };
in {
  enable = true;
  settings = {
    gui = {
      showIcons = true; # Deprecated
      theme = theme.cyberdream;
    };
    git.parseEmoji = true;
    git.paging = {
      colorArg = "always";
      pager = "delta --dark --paging=never";
    };
  };
}

