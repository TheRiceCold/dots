''
  * {
    border: none;
    border-radius: 0;
    font-size: 13px;
    font-family: JetBrainsMono Nerd Font;
  }

  window#waybar {
    background: rgba(17,17,27,1);
  }

  #cava.left, #cava.right {
    background: #25253a;
    margin: 5px; 
    padding: 8px 16px;
    color: #cba6f7;
  }
  #cava.left {
    border-radius: 24px 10px 24px 10px;
  }
  #cava.right {
    border-radius: 10px 24px 10px 24px;
  }
  #workspaces {
    background: #25253a;
    margin: 5px 5px;
    padding: 8px 5px;
    border-radius: 16px;
    color: #cba6f7
  }
  #workspaces button {
    padding: 0 5px;
    margin: 0 3px;
    border-radius: 16px;
    color: transparent;
    background: rgba(17,17,27,1);
    transition: all 0.3s ease-in-out;
  }

  #workspaces button.active {
    background-color: #89b4fa;
    color: #11111B;
    border-radius: 16px;
    min-width: 40px;
    background-size: 400% 400%;
    transition: all 0.3s ease-in-out;
  }

  #workspaces button:hover {
    background-color: #f5f5f5;
    color: #11111B;
    border-radius: 16px;
    min-width: 40px;
    background-size: 400% 400%;
  }

  #tray, 
  #network, 
  #battery,
  #pulseaudio, 
  #custom-playerctl.backward, 
  #custom-playerctl.play, 
  #custom-playerctl.foward {
    background: #25253a;
    font-weight: bold;
    margin: 5px 0px;
  }
  #tray, 
  #pulseaudio, 
  #network, 
  #battery {
    color: #f5f5f5;
    border-radius: 10px 24px 10px 24px;
    padding: 0 20px;
    margin-left: 7px;
  }
  #clock {
    color: #f5f5f5;
    background: #25253a;
    border-radius: 0 0 0 40px;
    padding: 10px 10px 15px 25px;
    margin-left: 7px;
    font-weight: bold;
    font-size: 14px;
  }
  #custom-launcher {
    color: #89b4fa;
    background: #25253a;
    border-radius: 0 0 40px 0;
    margin: 0;
    padding: 0 35px 0 15px;
    font-size: 24px;
  }

  #custom-playerctl.backward, 
  #custom-playerctl.play, 
  #custom-playerctl.foward {
    background: #25253a;
    font-size: 20px;
  }
  #custom-playerctl.backward:hover, 
  #custom-playerctl.play:hover, 
  #custom-playerctl.foward:hover {
    color: #f5f5f5;
  }
  #custom-playerctl.backward {
    color: #cba6f7;
    border-radius: 24px 0px 0px 10px;
    padding-left: 16px;
    margin-left: 7px;
  }
  #custom-playerctl.play {
    color: #89b4fa;
    padding: 0 5px;
  }
  #custom-playerctl.foward {
    color: #cba6f7;
    border-radius: 0px 10px 24px 0px;
    padding-right: 12px;
    margin-right: 7px
  }
  #custom-playerlabel {
    background: #25253a;
    color: #f5f5f5;
    padding: 0 20px;
    border-radius: 24px 10px 24px 10px;
    margin: 5px 0;
    font-weight: bold;
  }
  #window{
    background: #25253a;
    padding-left: 15px;
    padding-right: 15px;
    border-radius: 16px;
    margin-top: 5px;
    margin-bottom: 5px;
    font-weight: normal;
    font-style: normal;
  }
''
