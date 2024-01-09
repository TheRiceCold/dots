{
  programs.nixvim.plugins.which-key = {
    enable = true;
    showHelp = true;
    showKeys = true;
    triggers = "auto";
    plugins = {
      marks = false;
      registers = false;
      spelling = {
        enabled = true; 
        suggestions = 20;
      };
      presets = {
        
      };
    };

    window = {
      winblend = 0;
      border = "rounded";
      position = "bottom";
      margin = { top = 1; right = 0; bottom = 1; left = 0; };
      padding = { top = 2; right = 2; bottom = 2; left = 2; };
    };

    layout = {
      spacing = 3;
      align = "left";
      height = { min = 4; max = 25; };
      width = { min = 20; max = 50; };
    };

    registrations = { 
    };
  };
}
