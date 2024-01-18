{ pkgs, ... }:
{
  home.packages = [ pkgs.zathura ];

  xdg.configFile."zathura/zathurarc".text = ''
    set font                      "JetBrainsMono Nerd Font 12"
    set selection-clipboard		    "clipboard"
    set selection-notification	  "true"
    set guioptions			          "sv"
    set scroll-page-aware		      "true"
    set statusbar-home-tilde	    "true"
    set recolor			              "true"
    set adjust-open			          "width"

    set statusbar-h-padding		    10
    set statusbar-v-padding		    10

    set default-fg                "#CDD6F4"
    set default-bg 			          "#1E1E2E"

    set completion-bg		          "#313244"
    set completion-fg		          "#CDD6F4"
    set completion-highlight-bg	  "#575268"
    set completion-highlight-fg	  "#CDD6F4"
    set completion-group-bg		    "#313244"
    set completion-group-fg		    "#89B4FA"

    set statusbar-fg		          "#CDD6F4"
    set statusbar-bg		          "#313244"

    set notification-bg		        "#313244"
    set notification-fg		        "#CDD6F4"
    set notification-error-bg	    "#313244"
    set notification-error-fg	    "#F38BA8"
    set notification-warning-bg	  "#313244"
    set notification-warning-fg	  "#FAE3B0"

    set inputbar-fg			          "#CDD6F4"
    set inputbar-bg 		          "#313244"

    set recolor-lightcolor		    "#1E1E2E"
    set recolor-darkcolor		      "#CDD6F4"

    set index-fg			            "#CDD6F4"
    set index-bg			            "#1E1E2E"
    set index-active-fg		        "#CDD6F4"
    set index-active-bg		        "#313244"

    set render-loading-bg		      "#1E1E2E"
    set render-loading-fg		      "#CDD6F4"

    set highlight-color		        "#575268"
    set highlight-fg              "#F5C2E7"
    set highlight-active-color	  "#F5C2E7"
  '';
}
