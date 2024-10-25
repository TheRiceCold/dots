let
  colors = {
    bg = "#16181a";
    fg = "#ffffff";
		grey = "#7b8496";
    bg-alt = "#3c4048";
    red = "#ff6e5e";
    green = "#5eff6c";
    yellow = "#f1ff5e";
    blue = "#5ea1ff";
    violet = "#bd5eff";
    cyan = "#5ef1ff";
		pink = "#ff5ea0";
		magenta = "#ff5ef1";
  };
in {
  webpage = {
		preferred_color_scheme = "dark";
		darkmode.policy.images = "never";
	};
  completion = {
    inherit (colors) fg;
    even.bg = colors.bg;
    odd.bg = colors.bg-alt;
    category.bg = colors.bg;
    category.fg = colors.fg;
    item.selected.fg = colors.blue;
  };
  tabs = {
		bar.bg = colors.bg;
		odd.bg = colors.bg;
		even.bg = colors.bg;
		selected.odd.bg = colors.bg;
		selected.even.bg = colors.bg;
		selected.odd.fg = colors.blue;
		selected.even.fg = colors.blue;
	};
	hints.bg = colors.cyan;
  contextmenu = {};
  downloads = {};
  keyhints = {};
  messages = {};
  prompts = {};
  statusbar = {};
}
