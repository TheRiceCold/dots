{
  hints.border = "none";
  window.transparent = true;
  search.ignore_case = "smart";
  tabs = {
    indicator.width = 0;
    favicons.show = "never";
    last_close = "startpage";
  };
  colors = import ./colors.nix;
  completion = {
    height = "30%";
    scrollbar.width = 0;
  };
  spellcheck.languages = ["en-US"];
  input.insert_mode.auto_load = true;
  content = {
    blocking = {
      enabled = true;
      method = "both";
      adblock.lists = [
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
      ];
    };

    autoplay = false;
    javascript.enabled = true;
    javascript.clipboard = "access";
  };
  downloads = {
    position = "bottom";
    remove_finished = 0;
  };

  fonts = {
    default_family = "12pt Ubuntu Nerd Font Regular";
    statusbar = "12pt Ubuntu Nerd Font Regular";
    tabs.selected = "12pt Ubuntu Nerd Font Regular";
    tabs.unselected = "12pt Ubuntu Nerd Font Regular";
  };
}
