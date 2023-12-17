''
  * {
    font-size: 13px;
    font-family: JetBrainsMono Nerd Font;
  }

  #clock,
  #custom-notification,
  #custom-launcher,
  #custom-power-menu,
  /*#custom-colorpicker,*/
  #custom-window,
  #memory,
  #disk,
  #network,
  #custom-spotify,
  #pulseaudio,
  #window,
  #tray {
    padding: 5px 15px;
    border-radius: 12px;
    /* background: rgba(30, 30, 46, 0.6); */
    background: rgba(22, 22, 22, 0.6);
    color: rgb(180, 190, 254);
    box-shadow: rgba(17, 17, 27, 0.2) 0px 0px 3px 2px;
    margin-top: 4px;
    margin-bottom: 4px;
    margin-right: 4px;
    margin-left: 4px;
    transition: all 0.3s ease;
  }

  #window {
    box-shadow: none;
    background-color: transparent;
  }

  window#waybar {
    background-color: rgba(0, 0, 0, 0.096);
    border-radius: 17px;
  }

  window * {
    border-radius: 17px;
    background-color: transparent;
  }

  #workspaces {
    background-color: transparent;
  }

  #workspaces button {
    all: initial; /* Remove GTK theme values (waybar #1351) */
    min-width: 0; /* Fix weird spacing in materia (waybar #450) */
    box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
    padding: 6px 18px;
    margin: 6px 3px;
    border-radius: 4px;
    background-color: #1e1e2e;
    color: #cdd6f4;
  }

  #workspaces button.active {
    color: #1e1e2e;
    background-color: #cdd6f4;
  }

  #workspaces button:hover {
   box-shadow: inherit;
   text-shadow: inherit;
   color: #1e1e2e;
   background-color: #cdd6f4;
  }

  #workspaces button.urgent {
    background-color: #f38ba8;
  }

  #tray menu {
    background-color: rgba(30, 30, 46, 0.6);
    opacity: 0.8;
  }

  #pulseaudio.muted {
    color: rgb(243, 139, 168);
    padding-right: 16px;
  }

  #custom-notification.collapsed,
  #custom-notification.waiting_done {
    min-width: 12px;
    padding-right: 17px;
  }

  #custom-notification.waiting_start,
  #custom-notification.expanded {
    background-color: transparent;
    background: linear-gradient(
      90deg,
      rgb(49, 50, 68),
      rgba(30, 30, 46, 0.6),
      rgba(30, 30, 46, 0.6),
      rgba(30, 30, 46, 0.6),
      rgba(30, 30, 46, 0.6),
      rgb(49, 50, 68)
    );
    background-size: 400% 100%;
    animation: grey-gradient 3s linear infinite;
    min-width: 500px;
    border-radius: 17px;
  }

  #custom-notification.collapsed_muted {
    min-width: 12px;
    color: rgb(243, 139, 168);
    padding-right: 17px;
  }

  #custom-notification.waiting_done,
  #custom-notification.waiting_start {
    color: rgba(255, 255, 255, 0);
  }

  #custom-notification.wallpaper {
    min-width: 12px;
    padding-right: 17px;
    color: transparent;
    background: linear-gradient(
      58deg,
      #ff7eb6,
      #ff7eb6,
      #ff7eb6,
      #ee5396,
      #ee5396,
      #ee5396,
      #ff7eb6
    );
    background-size: 300% 300%;
    animation: colored-gradient 3s ease infinite;
  }
''
