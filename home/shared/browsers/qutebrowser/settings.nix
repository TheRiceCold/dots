{
  hints.border = "none";
  # scrolling.smooth = true;
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
}
