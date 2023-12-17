''
  * {
    font-family: JetBrainsMono Nerd Font;
    font-size: 13px;
    border-radius: 17px;
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
    /* background-color: rgb(255, 255, 255); */
    border-radius: 17px;
  }

  window * {
    border-radius: 17px;
    background-color: transparent;
  }

  #workspaces button label {
    color: rgb(180, 190, 254);
  }

  #workspaces button.active label {
    font-weight: bolder;
    color: rgba(16, 16, 16, 0.6);
    /* color: rgba(30, 30, 46, 0.6); */
  }

  #workspaces button:hover {
    min-width: 50px;
    box-shadow: rgb(180, 190, 254) 0 0 0 1.5px;
  }

  #workspaces {
    background-color: transparent;
    border-radius: 17px;
    padding: 5px 0px;
    margin-top: 3px;
    margin-bottom: 3px;
  }

  #workspaces button {
    box-shadow: rgba(17, 17, 27, 0.2) 0 0 3px 2px;
    /* background-color: rgba(30, 30, 46, 0.6); */
    background-color: rgba(16, 16, 16, 0.6);
    border-radius: 12px;
    margin-left: 10px;
    transition: all 0.3s ease;
  }

  #workspaces button.active {
    min-width: 50px;
    box-shadow: rgba(0, 0, 0, 0.288) 2px 2px 5px 2px;
    background-color: rgb(245, 194, 231);
    background-size: 400% 400%;
    transition: all 0.3s ease;
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
    animation: colored-gradient 20s ease infinite;
  }

  @keyframes colored-gradient {
    0% {
      background-position: 71% 0%;
    }
    50% {
      background-position: 30% 100%;
    }
    100% {
      background-position: 71% 0%;
    }
  }

  @keyframes grey-gradient {
    0% {
      background-position: 100% 50%;
    }
    100% {
      background-position: -33% 50%;
    }
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

  /*   #custom-colorpicker {
     border-radius: 17px;
   } */

/*
catppuccin
    #workspaces button.active {
    min-width: 50px;
    box-shadow: rgba(0, 0, 0, 0.288) 2px px2 5px 2px;
    background-color: rgb(245, 194, 231);
    background-size: 400% 400%;
    transition: all 0.3s ease;
    background: linear-gradient(
      58deg,
      #cba6f7,
      #cba6f7,
      #cba6f7,
      #89B4FA,
      #89B4FA,
      #CBA6F7,
      #F38BA8
    );
    background-size: 300% 300%;
    animation: colored-gradient 20s ease infinite;
  }

oxocarbon
    #workspaces button.active {
    min-width: 50px;
    box-shadow: rgba(0, 0, 0, 0.288) 2px 2px 5px 2px;
    background-color: rgb(245, 194, 231);
    background-size: 400% 400%;
    transition: all 0.3s ease;
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
    animation: colored-gradient 20s ease infinite;
  }

    jabuti
    #workspaces button.active {
    min-width: 50px;
    box-shadow: rgba(0, 0, 0, 0.288) 2px 2px 5px 2px;
    background-color: rgb(245, 194, 231);
    background-size: 400% 400%;
    transition: all 0.3s ease;
    background: linear-gradient(
      58deg,
      #29d398,
      #29d398,
      #29d398,
      #ec6a88,
      #ec6a88,
      #ec6a88,
      #F38BA8
    );
    background-size: 300% 300%;
    animation: colored-gradient 20s ease infinite;
  }
*/
''
